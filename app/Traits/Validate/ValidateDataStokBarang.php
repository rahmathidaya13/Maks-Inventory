<?php

namespace App\Traits\Validate;

use Illuminate\Support\Facades\Validator;

trait ValidateDataStokBarang
{
    // Method untuk validasi data barang
    public function ValidateDataStokBarang(array $data)
    {
        return Validator::make(
            $data,
            [
                'nama_barang' => 'required|string|max:255',
                'tipe_barang' => 'required|string|max:255',
                'tgl' => 'required|date',  // Pastikan tanggal valid
                'jumlah_barang' => 'required|integer|min:1',  // Pastikan jumlah barang minimal 1
                'keterangan' => 'nullable|string|max:255',  // Keterangan bersifat opsional
                'posisi_barang' => 'required|string',  // Keterangan bersifat opsional
            ],
            [
                'nama_barang.required' => 'Nama barang harus dipilih.',
                'tipe_barang.required' => 'Tipe barang harus dipilih.',
                'tgl.required' => 'Tanggal barang masuk harus diisi.',
                'tgl.date' => 'Format tanggal tidak valid.',
                'jumlah_barang.required' => 'Jumlah barang harus diisi.',
                'jumlah_barang.integer' => 'Jumlah barang harus berupa angka.',
                'jumlah_barang.min' => 'Jumlah barang minimal 1.',
                'posisi_barang.required' => 'Posisi barang harus dipilih.',
            ]
        )->validate();
    }
}
