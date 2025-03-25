<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;
use App\Traits\Handles\handlesStokBarang;
use App\Traits\Validate\ValidateDataStokBarang;

class StokBarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    use ValidateDataStokBarang, handlesStokBarang;
    public function index()
    {
        $daftarBarang = BarangModel::all();
        $stok = StokBarangModel::latest('tanggal')->paginate(10);
        return view('StokBarang.index', compact('stok', 'daftarBarang'));
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
        // this validates the resource
        $this->ValidateDataStokBarang($request->all());
        // simpan stok barang
        $this->createStokBarang($request->all());
        return back()->with('success', 'Penambahan stok baru berhasil dibuat');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $stokBarang = StokBarangModel::findOrFail($id);
        return response()->json(['success' => 'Fetching success', 'result' => $stokBarang], 200, [
            'Content-Type' => 'application/json',
            'X-Content-Type-Options' => 'nosniff',
        ]);
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
        // this validates that the resource
        $this->ValidateDataStokBarang($request->all());
        // update stok barang
        $stokBarang = $this->updateStokBarang($request->all(), $id);
        return back()->with('success', 'Data Stok' . ' ' . $stokBarang->nama_barang . ' - ' . $stokBarang->tipe_barang . ' ' . 'Berhasil Diupdate');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $stok = StokBarangModel::findOrFail($id);
        $stok->delete();
        return back()->with('success', 'Data Stok' . ' ' . $stok->nama_barang . ' - ' . $stok->tipe_barang . ' ' . 'Berhasil Dihapus');
    }
}
