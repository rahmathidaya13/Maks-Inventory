<?php

namespace App\Imports;

use App\Models\BarangMasukModel;
use Maatwebsite\Excel\Concerns\ToModel;
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
        // dd($row);
        return new BarangMasukModel([
            'id_barang' => uuid_create(),
            'tgl_brg_masuk' => $row['tanggal_barang_masuk'],
            'no_warehouse' => $row['no_warehouse'],
            'nama_barang' => $row['nama_barang'],
            'tipe_barang' => $row['tipe_barang'],
            'asal_gudang' => $row['asal_gudang'],
            'jumlah_barang' => $row['quantity'],
            'status' => $row['status'],
            'nama_konsumen' => $row['customer'],
        ]);
    }
}
