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
        $barang = BarangModel::latest()->paginate(10);
        $barang->lastItem();
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
        $request->validate(
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
        );
        $replace = str_replace(".","",$request->input('harga_brg'));
        $convert = floatval($replace);
        $barang = new BarangModel();
        $barang->nama_barang = $request->input('nama_brg');
        $barang->tipe_barang = $request->input('tipe_brg');
        $barang->harga_barang = $convert;
        $barang->save();
        return back()->with('success', 'Barang Berhasil Ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $barang = BarangModel::findOrFail($id);
        return response()->json(
            ['success' => 'Fetching success', 'result' => $barang],
            200,
            [
                'Content-Type' => 'application/json',
                'X-Content-Type-Options' => 'nosniff',
            ],
            JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK
        );
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
        );
        $replace = str_replace(".","",$request->input('harga_brg'));
        $convert = floatval($replace);

        $barang = BarangModel::findOrFail($id);
        $barang->nama_barang = $request->input('nama_brg');
        $barang->tipe_barang = $request->input('tipe_brg');
        $barang->harga_barang = $convert;
        $barang->update();
        return back()->with('success', 'Data Barang Berhasil Diubah');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $barang = BarangModel::findOrFail($id);
        $barang->delete();
        return back()->with('success', 'Data barang '.$barang->nama_barang.' - '.$barang->tipe_barang.' '.'Berhasil Dihapus');
    }
}
