<?php

namespace App\Imports;

use App\Models\BarangModel;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BarangImport implements ToModel,WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new BarangModel([
            'nama_barang' => $row['nama_barang'],
            'tipe_barang' => $row['tipe_barang'],
            'harga_barang' => $row['harga_barang'],
        ]);
    }
}
