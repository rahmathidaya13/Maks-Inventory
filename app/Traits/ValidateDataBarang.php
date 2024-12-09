<?php

namespace App\Traits;

use Illuminate\Support\Facades\Validator;

trait ValidateDataBarang
{
    // Method untuk validasi data barang
    public function validateDataBarang(array $data)
    {
        return Validator::make(
            $data,
            [
                'nama_brg' => 'required|string|max:150',
                'tipe_brg' => 'required|string|max:150',
                'harga_brg' => 'required|string',
            ],
            [
                'nama_brg.required' => 'Nama barang wajib diisi',
                'nama_brg.max' => 'Nama barang maksimal 150 karakter',
                'tipe_brg.required' => 'Tipe barang wajib diisi',
                'tipe_brg.max' => 'Tipe barang maksimal 150 karakter',
                'harga_brg.required' => 'Harga barang wajib diisi',
            ]
        )->validate();
    }
}
