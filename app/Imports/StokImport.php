<?php

namespace App\Imports;

use Carbon\Carbon;
use App\Models\BarangModel;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use Maatwebsite\Excel\Concerns\ToModel;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;

class StokImport implements ToModel, WithHeadingRow, WithCalculatedFormulas
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        $fromExcel = $row['tanggal'];
        $dateTime = Date::excelToDateTimeObject($fromExcel);
        $formatedDate = Carbon::instance($dateTime)->format('Y-m-d');

        // ambil data barang untuk di relasikan dengan stok barang ketika di import
        $barang = BarangModel::where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->first();

        if (!$barang) {
            $barang = BarangModel::create([
                'nama_barang' => $row['nama_barang'],
                'tipe_barang' => $row['tipe_barang'],
                'harga_barang' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        $barang_masuk = BarangMasukModel::where('id_barang', $barang->id_barang)
            ->where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->where('posisi', $row['posisi_barang'])
            ->where('tgl_brg_masuk', $formatedDate)
            ->sum('jumlah_barang') ?? 0;

        $barang_keluar = TransaksiModel::where('id_barang', $barang->id_barang)
            ->where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->where('tgl_transaksi', $formatedDate)
            ->sum('jumlah_barang') ?? 0;

        $stokBarang = StokBarangModel::where('id_barang', $barang->id_barang)
            ->where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->where('posisi', $row['posisi_barang'])
            ->where('tanggal', $formatedDate)
            ->first();

        if ($stokBarang) {
            $stokBarang->barang_masuk = $barang_masuk;
            $stokBarang->barang_keluar = $barang_keluar;
            $stokBarang->stok_awal += $row['stok_awal'];
            $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            $stokBarang->keterangan = $row['keterangan'];
            $stokBarang->save();
        } else {
            // $stokTerakhir = StokBarangModel::where('id_barang', $barang->id_barang)
            //     ->where('nama_barang', $row['nama_barang'])
            //     ->where('tipe_barang', $row['tipe_barang'])
            //     ->where('posisi', $row['posisi_barang'])
            //     ->orderBy('tanggal', 'desc')
            //     ->first();

            // $stokAwal = $stokTerakhir ? $stokTerakhir->stok_akhir : 0;

            $stok = new StokBarangModel();
            $stok->id_barang = $barang->id_barang;
            $stok->tanggal = $formatedDate;
            $stok->nama_barang = $row['nama_barang'];
            $stok->tipe_barang = $row['tipe_barang'];
            $stok->barang_masuk = $barang_masuk;
            $stok->barang_keluar = $barang_keluar;
            $stok->stok_awal = $row['stok_awal'];
            $stok->stok_akhir =  ($stok->stok_awal + $stok->barang_masuk) - $stok->barang_keluar;
            $stok->posisi = $row['posisi_barang'];
            $stok->keterangan = $row['keterangan'];
            $stok->save();
        }
    }
    public function headingRow(): int
    {
        return 4;
    }
}
