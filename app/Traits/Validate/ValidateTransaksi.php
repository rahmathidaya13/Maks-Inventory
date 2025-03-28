<?php

namespace App\Traits\Validate;

use Illuminate\Support\Facades\Validator;

trait ValidateTransaksi
{
    // Method untuk validasi data barang
    public function ValidateTransaksi(array $data)
    {
        return Validator::make(
            $data,
            [
                'transaksi' => 'required|date',
                'kode_transaksi' => 'required|string|max:20',
                'nama_konsumen' => 'required|string|max:100',
                'nohp' => 'required|digits_between:10,13', // validasi nomor telepon
                'alamat' => 'required|string|max:255',
                'sales' => 'required|string|max:100',
                'nama_brg_transaksi' => 'required|string|max:255',
                'tipe_brg_transaksi' => 'required|string|max:100',
                'stts_barang' => 'required|string',
                'diskon' => 'nullable|integer|min:0|max:100',
                'jumlah_brg_transaksi' => 'required|integer',
                'harga_brg_transaksi' => 'required|string', // validasi string karena akan diformat ulang
                'stok' => 'required|integer|min:0',
                'status_pembayaran' => 'required|string',
                'total_pembayaran' => 'required|string',
                'pembayaran' => 'required|string',
                'selisih' => 'nullable|string',
                'dp' => 'required|string',
                'status_transaksi' => 'required|string',
                'kode_barang' => 'required|string|max:50',
                'posisi_brg_transaksi' => 'required|string',
            ],
            [
                'transaksi.required' => 'Tanggal transaksi wajib diisi.',
                'transaksi.date' => 'Format tanggal transaksi tidak valid.',
                'kode_transaksi.required' => 'Kode transaksi wajib diisi.',
                'kode_transaksi.max' => 'Kode transaksi maksimal 20 karakter.',
                'nama_konsumen.required' => 'Nama konsumen wajib diisi.',
                'nama_konsumen.max' => 'Nama konsumen maksimal 100 karakter.',
                'nohp.required' => 'Nomor telepon wajib diisi.',
                'nohp.digits_between' => 'Nomor telepon harus terdiri dari 10 sampai 13 digit.',
                'alamat.required' => 'Alamat wajib diisi.',
                'alamat.max' => 'Alamat maksimal 255 karakter.',
                'sales.required' => 'Nama sales wajib diisi.',
                'sales.max' => 'Nama sales maksimal 100 karakter.',
                'nama_brg_transaksi.required' => 'Nama barang wajib diisi.',
                'nama_brg_transaksi.max' => 'Nama barang maksimal 255 karakter.',
                'tipe_brg_transaksi.required' => 'Tipe barang wajib diisi.',
                'tipe_brg_transaksi.max' => 'Tipe barang maksimal 100 karakter.',
                'stts_barang.required' => 'Status barang wajid dipilih.',
                'diskon.integer' => 'Diskon harus berupa angka.',
                'diskon.min' => 'Diskon tidak boleh kurang dari 0%.',
                'diskon.max' => 'Diskon tidak boleh lebih dari 100%.',
                'jumlah_brg_transaksi.required' => 'Jumlah barang wajib diisi.',
                'jumlah_brg_transaksi.integer' => 'Jumlah barang harus berupa angka.',
                'harga_brg_transaksi.required' => 'Harga barang wajib diisi.',
                'stok.required' => 'Stok barang wajib diisi.',
                'stok.integer' => 'Stok barang harus berupa angka.',
                'stok.min' => 'Stok barang tidak boleh negatif.',
                'status_pembayaran.required' => 'Status pembayaran wajib diisi.',
                'total_pembayaran.required' => 'Total pembayaran wajib diisi.',
                'pembayaran.required' => 'Jumlah pembayaran wajib diisi.',
                'dp.required' => 'Dana pertama wajib diisi.',
                'status_transaksi.required' => 'Transkasi belum dipilih',
                'kode_barang.required' => 'Kode barang wajib diisi.',
                'posisi_brg_transaksi.required' => "Posisi barang wajib diipilih",

            ]
        )->validate();
    }

    public function ValidateTransaksiRepayment(array $data)
    {
        return Validator::make(
            $data,
            [
                'tgl_pelunasan' => 'required|date',
                'kode_transaksi_pelunasan' => 'required|string|max:20',
                'konsumen' => 'required|string|max:100',
                'hp' => 'required|digits_between:10,13',
                'alamat_konsumen' => 'required|string|max:255',
                'transaksi' => 'required|string|max:255',
                'stts_pembayaran' => 'required|string',
                'hb' => 'required|string',
                'dana_pertama' => 'required|string',
                'selisih_pembayaran_' => 'nullable|string',
                'pembayaran_pelunasan' => 'required|string',
            ],
            [
                'tgl_pelunasan.required' => 'Tanggal pelunasan wajib diisi.',
                'tgl_pelunasan.date' => 'Format tanggal pelunasan tidak valid.',
                'kode_transaksi_pelunasan.required' => 'Kode transaksi wajib diisi.',
                'kode_transaksi_pelunasan.max' => 'Kode transaksi maksimal 20 karakter.',
                'konsumen.required' => 'Nama konsumen wajib diisi.',
                'konsumen.max' => 'Nama konsumen tidak boleh lebih dari 100 karakter',
                'hp.required' => 'Nomor telepon wajib diisi.',
                'hp.digits_between' => 'Nomor telepon harus terdiri dari 10 sampai 13 digit.',
                'alamat_konsumen.required' => 'Alamat wajib diisi.',
                'alamat_konsumen.max' => 'Alamat maksimal 255 karakter.',
                'transaksi.required' => 'Transkasi belum dipilih.',
                'stts_pembayaran.required' => 'Status pembayaran wajib diisi.',
                'hb.required' => 'Harga barang wajib diisi.',
                'dana_pertama.required' => 'Dana pertama wajib diisi.',
                'pembayaran_pelunasan.required' => 'Pembayaran wajib diisi.',
            ]
        )->validate();
    }
    public function validateTakeAway(array $data)
    {
        return Validator::make(
            $data,
            [
                'tanggal_ambil' => 'required | date',
                'kode_transaksi_ambil_brg' => 'required | string',
            ],
            [
                'tanggal_ambil.required' => 'Tanggal ambil wajib diisi',
                'tanggal_ambil.date' => 'Tanggal ambil harus dalam format tanggal',
                'kode_transaksi_ambil_brg.required' => 'Kode transaksi barang wajib diisi',
                'kode_transaksi_ambil_brg.string' => 'Kode transaksi  barang harus berupa karakter yang sesuai',
            ]
        )->validate();
    }
    public function validateSparepart(array $data)
    {
        return Validator::make($data, [
            'tanggal_sparepart' => 'required | date',
            'kode_transaksi_sparepart' => 'required',
            'nama_cs_sparepart' => 'required|string|max:50',
            'nohp_cs_sparepart' => 'required|string|regex:/^[\d\s-]+$/',
            'alamat_cs_sparepart' => 'required|string',
            'kode_cs_sparepart' => 'required|string',
            'barang_cs_sparepart' => 'required|string',
            'tipe_cs_sparepart' => 'required|string',
            'jumlah_cs_sparepart' => 'required|integer|min:1',
            'harga_cs_sparepart' => 'required|string',
            'pembayaran_cs_sparepart' => 'required|string',
        ], [
            'tanggal_sparepart.required' => 'Tanggal wajib diisi',
            'tanggal_sparepart.date' => 'Tanggal  harus dalam format tanggal',
            'kode_transaksi_sparepart.required' => 'Kode transaksi wajib diisi',
            'nama_cs_sparepart.required' => 'Nama pelanggan wajib diisi',
            'nama_cs_sparepart.string' => 'Nama pelanggan harus berupa karakter yang sesuai',
            'nama_cs_sparepart.max' => 'Nama pelanggan maksimal 50 karakter',
            'nohp_cs_sparepart.required' => 'Nomor handphone wajib diisi',
            'nohp_cs_sparepart.regex' => 'No pelanggan harus berupa angka, spasi, atau tanda minus',
            'alamat_cs_sparepart.required' => 'Alamat pelanggan wajib diisi',
            'alamat_cs_sparepart.string' => 'Alamat pelanggan harus berupa karakter yang sesuai',
            'kode_cs_sparepart.required' => 'Kode barang wajib diisi',
            'kode_cs_sparepart.string' => 'Kode barang harus berupa karakter yang sesuai',
            'barang_cs_sparepart.required' => 'Nama barang wajib diisi',
            'tipe_cs_sparepart.required' => 'Tipe barang wajib diisi',
            'tipe_cs_sparepart.string' => 'Tipe barang harus berupa karakter yang sesuai',
            'jumlah_cs_sparepart.required' => 'Jumlah barang wajib diisi',
            'jumlah_cs_sparepart.integer' => 'Jumlah barang harus berupa angka',
            'jumlah_cs_sparepart.min' => 'Jumlah barang minimal 1',
            'harga_cs_sparepart.required' => 'Harga barang wajib diisi',
            'harga_cs_sparepart.string' => 'Harga barang harus berupa angka',
            'pembayaran_cs_sparepart.required' => 'Pembayaran  wajib diisi',
            'pembayaran_cs_sparepart.string' => 'Pembayaran harus berupa karakter yang sesuai',
        ])->validate();
    }
}
