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
        // dd($row);
        $fromExcel = $row['tanggal'];
        $dateTime = Date::excelToDateTimeObject($fromExcel);
        $formatedDate = Carbon::instance($dateTime)->format('Y-m-d');

        // ambil data barang untuk di relasikan dengan stok barang ketika di import
        $barang = BarangModel::where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->first();

        $barang_masuk = BarangMasukModel::where('id_barang', $barang->id_barang)
            ->where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->where('tgl_brg_masuk', $formatedDate)
            ->sum('jumlah_barang') ?? 0;

        $barang_keluar = TransaksiModel::where('id_barang', $barang->id_barang)
            ->where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->where('tgl_transaksi', $formatedDate)
            ->sum('jumlah_barang') ?? 0;

        if (!$barang) {
            $barang = BarangModel::create([
                'nama_barang' => $row['nama_barang'],
                'tipe_barang' => $row['tipe_barang'],
                'harga_barang' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        return new StokBarangModel([
            'id_barang' => $barang->id_barang,
            'tanggal' => $formatedDate,
            'nama_barang' => $row['nama_barang'],
            'tipe_barang' => $row['tipe_barang'],
            'barang_masuk' => $barang_masuk,
            'barang_keluar' => $barang_keluar,
            'stok_awal' => $row['stok_awal'],
            'stok_akhir' => ($row['stok_awal'] + $barang_masuk) - $barang_keluar,
            'keterangan' => $row['keterangan'] ?? '-',
        ]);
    }
    public function headingRow(): int
    {
        return 4;
    }
}
