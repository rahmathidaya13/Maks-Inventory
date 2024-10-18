<?php

namespace App\Http\Controllers;

use App\Models\BarangMasukModel;
use App\Models\BarangModel;
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
                'nama_brg' => 'required|string|max:150',
                'tipe_brg' => 'required | string | max:150',
                'asal_gdg' => 'required | string | max:150',
                'jumlah_brg' => 'required | integer|min:1',
            ],
            [
                'tgl_brg_masuk.required' => 'Tanggal barang masuk wajib diisi.',
                'tgl_brg_masuk.date' => 'Tanggal barang masuk harus berupa format tanggal yang valid.',
                'no_warehouse.required' => 'Nomor warehouse wajib diisi.',
                'no_warehouse.max' => 'Nomor warehouse tidak boleh lebih dari 50 karakter.',
                'nama_brg.required' => 'Nama barang wajib diisi.',
                'nama_brg.max' => 'Nama barang tidak boleh lebih dari 150 karakter.',
                'tipe_brg.required' => 'Tipe barang wajib diisi.',
                'tipe_brg.max' => 'Tipe barang tidak boleh lebih dari 150 karakter.',
                'asal_gdg.required' => 'Asal gudang wajib diisi.',
                'asal_gdg.max' => 'Asal gudang tidak boleh lebih dari 150 karakter.',
                'jumlah_brg.required' => 'Jumlah barang wajib diisi.',
                'jumlah_brg.integer' => 'Jumlah barang harus berupa angka yang valid.',
                'jumlah_brg.min' => 'Jumlah barang minimal adalah 1.'
            ]
        );
        $barangMasuk = new BarangMasukModel();
        $barangMasuk->id_barang = $request->input('id_barang');
        $barangMasuk->tgl_brg_masuk = $request->input('tgl_brg_masuk');
        $barangMasuk->no_warehouse = $request->input('no_warehouse');
        $barangMasuk->nama_barang = $request->input('nama_brg');
        $barangMasuk->tipe_barang = $request->input('tipe_brg');
        $barangMasuk->asal_gudang = $request->input('asal_gdg');
        $barangMasuk->jumlah_barang = $request->input('jumlah_brg');
        $barangMasuk->save();
        return back()->with('success', "Penambahan " . request('nama_brg') . " - " . request('tipe_brg') . " "  . "Berhasil ditambahkan");
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
                'nama_brg' => 'required|string|max:150',
                'tipe_brg' => 'required | string | max:150',
                'asal_gdg' => 'required | string | max:150',
                'jumlah_brg' => 'required | integer|min:1',
            ],
            [
                'tgl_brg_masuk.required' => 'Tanggal barang masuk wajib diisi.',
                'tgl_brg_masuk.date' => 'Tanggal barang masuk harus berupa format tanggal yang valid.',
                'no_warehouse.required' => 'Nomor warehouse wajib diisi.',
                'no_warehouse.max' => 'Nomor warehouse tidak boleh lebih dari 50 karakter.',
                'nama_brg.required' => 'Nama barang wajib diisi.',
                'nama_brg.max' => 'Nama barang tidak boleh lebih dari 150 karakter.',
                'tipe_brg.required' => 'Tipe barang wajib diisi.',
                'tipe_brg.max' => 'Tipe barang tidak boleh lebih dari 150 karakter.',
                'asal_gdg.required' => 'Asal gudang wajib diisi.',
                'asal_gdg.max' => 'Asal gudang tidak boleh lebih dari 150 karakter.',
                'jumlah_brg.required' => 'Jumlah barang wajib diisi.',
                'jumlah_brg.integer' => 'Jumlah barang harus berupa angka yang valid.',
                'jumlah_brg.min' => 'Jumlah barang minimal adalah 1.'
            ]
        );
        $barangMasuk = BarangMasukModel::findOrFail($id);
        $barangMasuk->id_barang = $request->input('id_barang');
        $barangMasuk->tgl_brg_masuk = $request->input('tgl_brg_masuk');
        $barangMasuk->no_warehouse = $request->input('no_warehouse');
        $barangMasuk->nama_barang = $request->input('nama_brg');
        $barangMasuk->tipe_barang = $request->input('tipe_brg');
        $barangMasuk->asal_gudang = $request->input('asal_gdg');
        $barangMasuk->jumlah_barang = $request->input('jumlah_brg');
        $barangMasuk->update();
        return back()->with('success', "Pembaharuan " . request('nama_brg') . " - " . request('tipe_brg') . " " . "Berhasil diperbaharui");
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
