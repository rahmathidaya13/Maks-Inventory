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
        $request->validate([
            'tgl_brg_masuk' => 'required',
            'no_warehouse' => 'required',
            'nama_brg' => 'required',
            'tipe_brg' => 'required',
            'asal_gdg' => 'required',
            'jumlah_brg' => 'required',
        ]);
        $barangMasuk = new BarangMasukModel();
        $barangMasuk->id_barang = $request->input('id_barang');
        $barangMasuk->tgl_brg_masuk = $request->input('tgl_brg_masuk');
        $barangMasuk->no_warehouse = $request->input('no_warehouse');
        $barangMasuk->nama_barang = $request->input('nama_brg');
        $barangMasuk->tipe_barang = $request->input('tipe_brg');
        $barangMasuk->asal_gudang = $request->input('asal_gdg');
        $barangMasuk->jumlah_barang = $request->input('jumlah_brg');
        $barangMasuk->save();
        return back()->with('success', 'Penambahan Barang Masuk Berhasil');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $barangMasuk = BarangMasukModel::findOrFail($id);
        return response()->json(['success' => 'Fetching success', 'result'=>$barangMasuk], 200, [
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
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id) {}
}
