<?php

namespace App\Http\Controllers;

use App\Models\BarangMasukModel;
use App\Models\BarangModel;
use App\Models\StokBarangModel;
use Illuminate\Http\Request;

class BarangMasuk extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $allItem = BarangModel::all();
        $barang_masuk = BarangMasukModel::latest()->paginate(10);
        return view('BarangMasuk.index', compact('barang_masuk', 'allItem'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate(
            [
                'tgl_brg_masuk' => 'required | date',
                'no_warehouse' => 'required|string|max:50',
                'nama_barang' => 'required|string|max:150',
                'tipe_barang_masuk' => 'required | string | max:150',
                'asal_gdg' => 'required | string | max:150',
                'jumlah_brg' => 'required | integer|min:1',
                'status' => 'required | string',
                'konsumen' => 'required | string | max:100',
            ],
            [
                'tgl_brg_masuk.required' => 'Tanggal barang masuk wajib diisi.',
                'tgl_brg_masuk.date' => 'Tanggal barang masuk harus berupa format tanggal yang valid.',
                'no_warehouse.required' => 'Nomor warehouse wajib diisi.',
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
            ]
        );
        $barangMasuk = new BarangMasukModel();
        $barangMasuk->id_barang = $request->input('id_barang');
        $barangMasuk->tgl_brg_masuk = $request->input('tgl_brg_masuk');
        $barangMasuk->no_warehouse = $request->input('no_warehouse');
        $barangMasuk->nama_barang = $request->input('nama_barang');
        $barangMasuk->tipe_barang = $request->input('tipe_barang_masuk');
        $barangMasuk->asal_gudang = $request->input('asal_gdg');
        $barangMasuk->jumlah_barang = $request->input('jumlah_brg');
        $barangMasuk->status = $request->input('status');
        $barangMasuk->nama_konsumen = $request->input('konsumen');
        $barangMasuk->save();

        // Hanya update stok jika status adalah 'stok'
        if ($request->status == 'stok') {
            // Cek stok di tb_stok_barang untuk tanggal tersebut dan status 'stok'
            $getId_brg_masuk = BarangMasukModel::where('id_barang', $request->input('id_barang'))->firstOr();
            $stokBarang = StokBarangModel::where('id_brg_masuk', $getId_brg_masuk->id_brg_masuk)
                ->where('id_barang',  $request->input('id_barang'))
                ->whereDate('tanggal', $request->input('tgl_brg_masuk'))
                ->first();

            if ($stokBarang) {
                // Jika stok untuk tanggal tersebut dan barang yang sama sudah ada, tambahkan ke stok_akhir
                $stokBarang->stok_akhir += $request->input('jumlah_brg');
                $stokBarang->stok_saat_ini = $stokBarang->stok_akhir;
            } else {
                // Jika stok untuk tanggal tersebut belum ada, buat stok baru
                // Ambil stok akhir dari transaksi sebelumnya untuk dijadikan stok awal
                $stokSebelumnya = StokBarangModel::where('id_brg_masuk', $getId_brg_masuk->id_brg_masuk)
                    ->where('id_barang', $request->input('id_barang'))
                    ->orderBy('tanggal', 'desc')
                    ->first();

                $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

                $stokBarang = new StokBarangModel();
                $stokBarang->id_barang = $request->input('id_barang');
                $stokBarang->id_brg_masuk = $getId_brg_masuk->id_brg_masuk;
                $stokBarang->tanggal = $request->input('tgl_brg_masuk');
                $stokBarang->nama_barang = $request->input('nama_barang');
                $stokBarang->tipe_barang = $request->input('tipe_barang_masuk');
                $stokBarang->stok_awal = $stokAwal;
                $stokBarang->stok_akhir = $stokAwal + $request->input('jumlah_brg');
                $stokBarang->stok_saat_ini = $stokBarang->stok_akhir;
                $stokBarang->status = $request->input('status');
            }
            $stokBarang->save();
        }
        return back()->with('success', "Penambahan " . request('nama_barang') . " - " . request('tipe_barang_masuk') . " "  . "Berhasil ditambahkan");
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $barangMasuk = BarangMasukModel::findOrFail($id);
        return response()->json(['success' => 'Fetching success', 'result' => $barangMasuk], 200, [
            'Content-Type' => 'application/json',
            'X-Content-Type-Options' => 'nosniff',
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate(
            [
                'tgl_brg_masuk' => 'required | date',
                'no_warehouse' => 'required|string|max:50',
                'nama_barang' => 'required|string|max:150',
                'tipe_barang_masuk' => 'required | string | max:150',
                'asal_gdg' => 'required | string | max:150',
                'jumlah_brg' => 'required | integer|min:1',
                'status' => 'required | string',
                'konsumen' => 'required | string | max:100',
            ],
            [
                'tgl_brg_masuk.required' => 'Tanggal barang masuk wajib diisi.',
                'tgl_brg_masuk.date' => 'Tanggal barang masuk harus berupa format tanggal yang valid.',
                'no_warehouse.required' => 'Nomor warehouse wajib diisi.',
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
            ]
        );

        $barangMasuk = BarangMasukModel::findOrFail($id);
        $selisih = $request->input('jumlah_brg') - $barangMasuk->jumlah_barang;
        // Jika status 'stok', lakukan update stok
        if ($barangMasuk->status == 'stok') {
            // Cari stok barang berdasarkan id_barang_masuk
            $stokBarang = StokBarangModel::where('id_brg_masuk', $barangMasuk->id_brg_masuk)
                ->first();

            if ($stokBarang) {
                // Update nama, tipe barang, dan tanggal jika ada perubahan
                $stokBarang->nama_barang = $request->input('nama_barang');
                $stokBarang->tipe_barang = $request->input('tipe_barang_masuk');
                $stokBarang->tanggal = $request->input('tgl_brg_masuk');

                // Update stok_akhir sesuai selisih
                $stokBarang->stok_akhir += $selisih;
                $stokBarang->stok_saat_ini = $stokBarang->stok_akhir;
                $stokBarang->save();
            }
        }
        $barangMasuk->id_barang = $request->input('id_barang');
        $barangMasuk->tgl_brg_masuk = $request->input('tgl_brg_masuk');
        $barangMasuk->no_warehouse = $request->input('no_warehouse');
        $barangMasuk->nama_barang = $request->input('nama_barang');
        $barangMasuk->tipe_barang = $request->input('tipe_barang_masuk');
        $barangMasuk->asal_gudang = $request->input('asal_gdg');
        $barangMasuk->jumlah_barang = $request->input('jumlah_brg');
        $barangMasuk->status = $request->input('status');
        $barangMasuk->nama_konsumen = $request->input('konsumen');
        $barangMasuk->update();

        return back()->with('success', "Pembaharuan " . request('nama_barang') . " - " . request('tipe_barang_masuk') . " " . "Berhasil diperbaharui");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $barangMasuk = BarangMasukModel::findOrFail($id);
        $barangMasuk->delete();
        return back()->with('success', 'Daftar Barang Masuk' . ' ' . $barangMasuk->nama_barang . ' - ' . $barangMasuk->tipe_barang . ' ' . 'Berhasil Dihapus');
    }
}
