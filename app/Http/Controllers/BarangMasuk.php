<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;

use App\Models\BarangKeluarModel;
use App\Traits\Handles\handlesBarangMasuk;
use App\Traits\Validate\ValidateDataBarangMasuk;

class BarangMasuk extends Controller
{
    /**
     * Display a listing of the resource.
     */
    use ValidateDataBarangMasuk, handlesBarangMasuk;
    public function index()
    {
        $allItem = BarangModel::all();
        $barang_masuk = BarangMasukModel::latest('tgl_brg_masuk')->paginate(10);
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
        // this valdate that resources
        $this->validateDataBarangMasuk($request->all());

        // create new barangMasuk
        $this->createBarangMasuk($request->all());
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
        // this valdate that resources
        $this->validateDataBarangMasuk($request->all());

        // update barang masuk in database
        $this->updateBarangMasuk($request->all(), $id);

        return back()->with('success', "Pembaharuan " . request('nama_barang') . " - " . request('tipe_barang_masuk') . " " . "Berhasil diperbaharui");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id, $date)
    {
        $barangMasuk = BarangMasukModel::where('id_brg_masuk', $id)
            ->whereDate('tgl_brg_masuk', $date)
            ->first();
        $barangMasuk->delete();
        return back()->with('success', 'Daftar Barang Masuk' . ' ' . $barangMasuk->nama_barang . ' - ' . $barangMasuk->tipe_barang . ' ' . 'Berhasil Dihapus');
    }
}
