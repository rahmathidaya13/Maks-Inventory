<?php

namespace App\Imports;

use Carbon\Carbon;
use App\Models\BarangModel;
use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;
use Maatwebsite\Excel\Concerns\ToModel;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BarangMasukImport implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */

    public function model(array $row)
    {

        $fromExcel = $row['tanggal_barang_masuk'];
        $dateTime = Date::excelToDateTimeObject($fromExcel);
        $get_date = Carbon::instance($dateTime)->format('Y-m-d');
        // $get_date = Carbon::parse($formatedDate)->format('Y-m-d');

        // cek barang dari file excel sebelum disimpan dan diambil
        $barang = BarangModel::where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->first();

        // cek barang keluar
        $barang_keluar = BarangKeluarModel::where('id_barang', $barang->id_barang)
            ->where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->where('posisi', $row['posisi_barang'])
            ->where('tanggal',  $get_date)
            ->sum('jumlah_barang');

        /*cek stok barang berdasarkan import dari excel yang mempunyai
        idbarang,nama_barang,tipe_barang dan tanggal yang sama
        jika tidak sesuai dari where yang dtentukan maka akan buat record baru, (kondisi else)*/

        $stokBarang = StokBarangModel::where('id_barang', $barang->id_barang)
            ->where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->where('posisi', $row['posisi_barang'])
            ->whereDate('tanggal', $get_date)
            ->first();

        if ($stokBarang) {
            $stokBarang->barang_masuk += $row['quantity'];
            $stokBarang->barang_keluar = $barang_keluar;
            $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            $stokBarang->keterangan = 'stok';
            $stokBarang->save();
        } else {
            // cek stok terakhir jika dtemukan barang dengan id yang sama nama,tipe dan tanggal terakhir maka simpan ke db
            $stokTerakhir = StokBarangModel::where('id_barang', $barang->id_barang)
                ->where('nama_barang', $row['nama_barang'])
                ->where('tipe_barang', $row['tipe_barang'],)
                ->where('posisi', $row['posisi_barang'])
                ->orderBy('tanggal', 'desc')
                ->first();

            $stokAwal = $stokTerakhir ? $stokTerakhir->stok_akhir : 0;

            $stok = new StokBarangModel();
            $stok->id_barang = $barang->id_barang;
            $stok->tanggal = $get_date;
            $stok->nama_barang = $row['nama_barang'];
            $stok->tipe_barang = $row['tipe_barang'];
            $stok->barang_masuk = $row['quantity'];
            $stok->barang_keluar = $barang_keluar;
            $stok->stok_awal = $stokAwal;
            $stok->stok_akhir = ($stok->stok_awal + $stok->barang_masuk) - $stok->barang_keluar;
            $stok->posisi = $stokTerakhir->posisi ?? $row['posisi_barang'];
            $stok->keterangan = 'stok';
            $stok->save();
        }
        // dd($row);
        // jika barang yang mau di import tidak ada maka buat barang baru
        if (!$barang) {
            $barang = BarangModel::create([
                'nama_barang' => $row['nama_barang'],
                'tipe_barang' => $row['tipe_barang'],
                'harga_barang' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
        return new BarangMasukModel([
            'id_barang' => $barang->id_barang,
            'tgl_brg_masuk' => $get_date,
            'no_warehouse' => $row['no_warehouse'],
            'nama_barang' => $row['nama_barang'],
            'tipe_barang' => $row['tipe_barang'],
            'asal_gudang' => $row['asal_gudang'],
            'jumlah_barang' => $row['quantity'],
            'posisi' => $row['posisi_barang'],
            'status' => $row['status'],
            'nama_konsumen' => $row['customer'],
        ]);
    }
    public function headingRow(): int
    {
        return 4;
    }
}
