<?php

namespace App\Traits;

use Illuminate\Support\Facades\Validator;

trait ValidateDataBarangMasuk
{
    // Method untuk validasi data barang
    public function validateDataBarangMasuk(array $data)
    {
        return Validator::make(
            $data,
            [
                'tgl_brg_masuk' => 'required | date',
                'no_warehouse' => 'required|string|max:50',
                'kode_barang_brg_masuk' => 'required|string|max:50',
                'nama_barang' => 'required|string|max:150',
                'tipe_barang_masuk' => 'required | string | max:150',
                'asal_gdg' => 'required | string | max:150',
                'jumlah_brg' => 'required | integer|min:1',
                'status' => 'required | string',
                'konsumen' => 'required | string | max:100',
                'posisi_brg_masuk' => 'required | string',
            ],
            [
                'tgl_brg_masuk.required' => 'Tanggal barang masuk wajib diisi.',
                'tgl_brg_masuk.date' => 'Tanggal barang masuk harus berupa format tanggal yang valid.',
                'no_warehouse.required' => 'Nomor warehouse wajib diisi.',
                'kode_barang_brg_masuk.required' => 'Kode barang wajib diisi',
                'kode_barang_brg_masuk.max' => 'Kode barang tidak boelh lebih dari 50 karakter',
                'no_warehouse.max' => 'Nomor warehouse tidak boleh lebih dari 50 karakter.',
                'nama_barang.required' => 'Nama barang wajib diisi.',
                'nama_barang.max' => 'Nama barang tidak boleh lebih dari 150 karakter.',
                'tipe_barang_masuk.required' => 'Tipe barang wajib diisi.',
                'tipe_barang_masuk.max' => 'Tipe barang tidak boleh lebih dari 150 karakter.',
                'asal_gdg.required' => 'Asal gudang wajib diisi.',
                'asal_gdg.max' => 'Asal gudang tidak boleh lebih dari 150 karakter.',
                'jumlah_brg.required' => 'Jumlah barang wajib diisi.',
                'jumlah_brg.integer' => 'Jumlah barang harus berupa angka yang valid.',
                'jumlah_brg.min' => 'Jumlah barang minimal adalah 1.',
                'status.required' => 'Status wajib dipilih.',
                'konsumen.required' => 'Nama konsumen wajib diisi.',
                'konsumen.max' => 'Nama konsumen tidak boleh lebih dari 100 Karakter',
                'posisi_brg_masuk.required' => 'Posisi barang wajib dipilih',
            ]
        )->validate();
    }
}
