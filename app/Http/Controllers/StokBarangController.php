<?php

namespace App\Http\Controllers;

use App\Models\BarangKeluarModel;
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

        $barang_masuk = BarangMasukModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->where('tgl_brg_masuk', $request->input('tgl'))
            ->sum('jumlah_barang');

        $barang_keluar = BarangKeluarModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->where('tanggal', $request->input('tgl'))
            ->sum('jumlah_barang');

        $stokChek = StokBarangModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->where('tanggal', $request->input('tgl'))
            ->first();

        if ($stokChek) {
            $stokChek->barang_masuk = $barang_masuk;
            $stokChek->barang_keluar = $barang_keluar;
            $stokChek->stok_akhir += $request->input('jumlah_barang');
            $stokChek->keterangan = $request->input('keterangan') ?? $stokChek->keterangan;
            $stokChek->save();
            return back()->with('success', 'Penambahan stok baru berhasil dibuat');
        } else {
            $stokTerakhir = StokBarangModel::where('nama_barang', $request->input('nama_barang'))
                ->where('tipe_barang', $request->input('tipe_barang'))
                ->orderBy('tanggal', 'desc')
                ->first();
            $stokAwal = $stokTerakhir ? $stokTerakhir->stok_akhir : 0;

            $stok = new StokBarangModel();
            $stok->id_barang = $request->input('id_barang');
            $stok->tanggal = $request->input('tgl');
            $stok->nama_barang = $request->input('nama_barang');
            $stok->tipe_barang = $request->input('tipe_barang');
            $stok->barang_masuk = $barang_masuk;
            $stok->barang_keluar = $barang_keluar;

            if ($stokAwal == 0 && $barang_masuk == 0 && $barang_keluar == 0) {
                $stok->stok_awal =  $request->input('jumlah_barang');
                $stok->stok_akhir =  $stok->stok_awal;
            } else {
                $stok->stok_awal =  $stokAwal;
                $stok->stok_akhir =  $stokAwal + $request->input('jumlah_barang');
            }

            $stok->stok_akhir =  $stokAwal + $request->input('jumlah_barang');
            $stok->keterangan = $request->input('keterangan');
            $stok->save();
            return back()->with('success', 'Penambahan stok baru berhasil dibuat');
        }
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
        $stok = StokBarangModel::findOrFail($id);

        $barang_masuk = BarangMasukModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->where('tgl_brg_masuk', $request->input('tgl'))
            ->sum('jumlah_barang');

        $barang_keluar = TransaksiModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->where('tgl_transaksi', $request->input('tgl'))
            ->sum('jumlah_barang');

        $stokSebelumnya = StokBarangModel::where('nama_barang',  $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->orderBy('tanggal', 'desc')
            ->first();
        $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

        if ($stok->tanggal === $request->input('tgl')) {
            $stok->barang_masuk += $barang_masuk - $stok->barang_masuk;
            $stok->barang_keluar += $barang_keluar - $stok->barang_keluar;
            $stok->stok_akhir = ($stok->stok_awal +  $request->input('jumlah_barang')) - $stok->barang_keluar;
            $stok->keterangan = $request->input('keterangan');
            $stok->update();
            return back()->with('success', 'Stok berhasil diperbarui');
        } else {
            $stokTerakhir = StokBarangModel::where('nama_barang',  $request->input('nama_barang'))
                ->where('tipe_barang', $request->input('tipe_barang'))
                ->where('tanggal', '<', $request->input('tgl'))
                ->orderBy('tanggal', 'desc')
                ->first();

            $stokAwal = $stokTerakhir ? $stokTerakhir->stok_akhir : 0;

            $stok->id_barang = $request->input('id_barang');
            $stok->tanggal = $request->input('tgl');
            $stok->nama_barang = $request->input('nama_barang');
            $stok->tipe_barang = $request->input('tipe_barang');
            $stok->barang_masuk = $barang_masuk;
            $stok->barang_keluar = $barang_keluar;
            $stok->stok_awal = $stokAwal;
            $stok->stok_akhir = $stokAwal + $barang_masuk - $barang_keluar;
            $stok->keterangan = $request->input('keterangan') ??  $stok->keterangan;
            $stok->update();
        }
        return back()->with('success', 'Pembaruan Stok Berhasil');
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
