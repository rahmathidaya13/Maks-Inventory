<?php

namespace App\Imports;

use App\Models\BarangMasukModel;
use App\Models\BarangModel;
use Carbon\Carbon;
use App\Models\StokBarangModel;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class StokImport implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        $get_date = Carbon::parse($row['tanggal'])->format('Y-m-d');

        // ambil data barang untuk di relasikan dengan stok barang ketika di import
        $barang = BarangModel::where('nama_barang', $row['nama_barang'])
            ->where('tipe_barang', $row['tipe_barang'])
            ->first();
        if (!$barang) {
            $barang = BarangModel::create([
                'nama_barang' => $row['nama'],
                'tipe_barang' => $row['tipe'],
                'harga_barang' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
        // dd($row);
        return new StokBarangModel([
            'id_barang' => $barang->id_barang,
            'id_brg_masuk' => null,
            'tanggal' => $get_date,
            'nama_barang' => $row['nama_barang'],
            'tipe_barang' => $row['tipe_barang'],
            'stok_awal' => $row['stok_awal'],
            'barang_masuk' => $row['barang_masuk'],
            'barang_keluar' => $row['barang_keluar'],
            'stok_akhir' => $row['stok_akhir'],
            'keterangan' => $row['keterangan'],
        ]);
    }
    public function headingRow(): int
    {
        return 5;
    }
}
