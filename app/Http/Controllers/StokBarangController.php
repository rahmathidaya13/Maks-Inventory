<?php

namespace App\Http\Controllers;

use App\Models\BarangMasukModel;
use App\Models\BarangModel;
use App\Models\StokBarangModel;
use App\Models\TransaksiModel;
use Illuminate\Http\Request;

class StokBarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $daftarBarang = BarangModel::all();
        $stok = StokBarangModel::paginate(10);
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
        $stok = new StokBarangModel();
        $stok->id_barang = $request->input('id_barang');
        $stok->tanggal = $request->input('tgl');
        $stok->nama_barang = $request->input('nama_barang');
        $stok->tipe_barang = $request->input('tipe_barang');
        $stok->barang_masuk = $request->input('barang_masuk');
        $stok->barang_keluar = $request->input('barang_keluar');
        $stok->stok_awal = $request->input('stok_awal');
        $stok->stok_akhir = $request->input('stok_akhir');
        $stok->keterangan = $request->input('keterangan');
        $stok->save();
        return back()->with('success', 'Penambahan stok baru berhasil dibuat');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id, $date)
    {
        $stokBarang = StokBarangModel::where('id_barang',  $id)
            ->whereDate('tanggal', $date)->first();
        return response()->json(['success' => 'Fetching success', 'result' => $stokBarang], 200, [
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
        dd($id);
        // $barangMasuk = BarangMasukModel::where('id_brg_masuk', $request->)
        // $stokBarang = StokBarangModel::where('id_stok', $request->input('id_stok'))->first();
        // $stokBarang->stok -= $request->input('stok_keluar');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
