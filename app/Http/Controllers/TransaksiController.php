<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use Illuminate\Support\Facades\DB;

class TransaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $DaftarBarang = BarangModel::all();
        $stokBarang = StokBarangModel::all();
        $daftarTransaksi = TransaksiModel::paginate(10);
        return view('transaksi.index', compact('DaftarBarang', 'stokBarang', 'daftarTransaksi'));
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
        $transaksi = new TransaksiModel();
        $transaksi->tgl_transaksi = $request->input('transaksi');
        $transaksi->kode_transaksi = $request->input('kode_transaksi');
        $transaksi->nama_konsumen = $request->input('nama_konsumen');
        $transaksi->no_handphone = $request->input('nohp');
        $transaksi->alamat = $request->input('alamat');
        $transaksi->nama_sales = $request->input('sales');
        $transaksi->nama_barang = $request->input('nama_brg_transaksi');
        $transaksi->tipe_barang = $request->input('tipe_brg_transaksi');
        $transaksi->jumlah_barang = $request->input('jumlah_brg_transaksi');
        $transaksi->harga_barang = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('harga_brg_transaksi'));
        $transaksi->status_pembayaran = $request->input('status_pembayaran');
        $transaksi->total_pembayaran = $request->input('total_pembayaran');
        $transaksi->selisih_pembayaran = $request->input('selisih');
        $transaksi->save();
        return back()->with('success', 'Transaksi Berhasil Dibuat');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
    public function destroy(string $id)
    {
        //
    }
}
