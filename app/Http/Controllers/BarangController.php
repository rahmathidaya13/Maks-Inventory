<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Traits\Validate\ValidateDataBarang;

class BarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    use ValidateDataBarang;
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
        // this alert will be displayed
        $data = $this->validateDataBarang($request->all());

        $replace = str_replace(".", "", $data['harga_brg']);
        $convert = floatval($replace);

        $barang = new BarangModel();
        $barang->nama_barang = $data['nama_brg'];
        $barang->tipe_barang = $data['tipe_brg'];
        $barang->harga_barang = $convert;
        $barang->save();
        return back()->with('success', 'Penambahan data ' . $barang->nama_barang . " - " . $barang->tipe_barang . " " . 'Berhasil Ditambahkan');
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
            ]
        );
    }
    public function showAll()
    {
        $barang = BarangModel::all();
        return response()->json(
            ['data' => $barang],
            200,
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
        // this alert will be displayed
        $data = $this->validateDataBarang($request->all());

        $replace = str_replace(".", "", $data['harga_brg']);

        $barang = BarangModel::findOrFail($id);
        $barang->nama_barang = $data['nama_brg'];
        $barang->tipe_barang = $data['tipe_brg'];
        $barang->harga_barang = floatval($replace);
        $barang->update();
        return back()->with('success', 'Perubahan data ' . $barang->nama_barang . "-" . $barang->tipe_barang . " " . 'Berhasil');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $barang = BarangModel::findOrFail($id);
        $barang->delete();
        return back()->with('success', 'Data barang ' . $barang->nama_barang . ' - ' . $barang->tipe_barang . ' ' . 'Berhasil Dihapus');
    }
}
