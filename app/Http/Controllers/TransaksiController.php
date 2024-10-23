<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use App\Models\StokBarangModel;
use App\Models\TransaksiModel;
use Illuminate\Http\Request;

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
        return view('transaksi.index', compact( 'DaftarBarang','stokBarang','daftarTransaksi'));
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
        dd($request->all());
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
