<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;

class BarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $barang = BarangModel::latest()->get();
        return view('Barang.index', compact('barang'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() {}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama_brg' => 'required',
            'tipe_brg' => 'required',
            'harga_brg' => 'required',
        ]);
        $barang = new BarangModel();
        $barang->nama_barang = $request->input('nama_brg');
        $barang->tipe_barang = $request->input('tipe_brg');
        $barang->harga_barang = $request->input('harga_brg');
        $barang->save();
        return redirect()->route('list.index')->with('success', 'Barang Berhasil Ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $barang = BarangModel::findOrFail($id);
        return response()->json($barang, 200);
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
        $request->validate([
            'nama_brg' => 'required',
            'tipe_brg' => 'required',
            'harga_brg' => 'required',
        ]);
        $barang = BarangModel::findOrFail($id);
        $barang->nama_barang = $request->input('nama_brg');
        $barang->tipe_barang = $request->input('tipe_brg');
        $barang->harga_barang = $request->input('harga_brg');
        $barang->update();
        return redirect()->route('list.index')->with('success', 'Data Barang Berhasil Diubah');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $barang = BarangModel::findOrFail($id);
        $barang->delete();
        return redirect()->route('list.index')->with('success', 'Barang Berhasil Dihapus');
    }
}
