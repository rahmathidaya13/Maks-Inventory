<?php

namespace App\Http\Controllers;

use App\Models\BarangKeluarModel;
use App\Models\BarangMasukModel;
use App\Models\BarangModel;
use App\Models\StokBarangModel;
use App\Traits\ValidateDataBarangMasuk;
use Illuminate\Http\Request;

class BarangMasuk extends Controller
{
    /**
     * Display a listing of the resource.
     */
    use ValidateDataBarangMasuk;
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

        $barangMasuk = new BarangMasukModel();
        $barangMasuk->id_barang = $request->input('id_barang');
        $barangMasuk->tgl_brg_masuk = $request->input('tgl_brg_masuk');
        $barangMasuk->no_warehouse = $request->input('no_warehouse');
        $barangMasuk->kode_barang = $request->input('kode_barang_brg_masuk');
        $barangMasuk->nama_barang = $request->input('nama_barang');
        $barangMasuk->tipe_barang = $request->input('tipe_barang_masuk');
        $barangMasuk->asal_gudang = $request->input('asal_gdg');
        $barangMasuk->jumlah_barang = $request->input('jumlah_brg');
        $barangMasuk->status = $request->input('status');
        $barangMasuk->nama_konsumen = $request->input('konsumen');
        $barangMasuk->posisi = $request->input('posisi_brg_masuk');
        $barangMasuk->save();

        $barang_keluar = BarangKeluarModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang_masuk'))
            ->where('posisi', $request->input('posisi_brg_masuk'))
            ->where('tanggal', $request->input('tgl_brg_masuk'))
            ->sum('jumlah_barang');

        // Jika status adalah 'stok', hitung stok barang terkait barang masuk
        if ($barangMasuk->status === 'stok' || $barangMasuk->status === 'customer') {
            // Cari stok untuk barang yang sesuai dengan id_barang dan id_brg_masuk
            $stokBarang = StokBarangModel::where('id_barang', $request->input('id_barang'))
                ->where('nama_barang', $request->input('nama_barang'))
                ->where('tipe_barang', $request->input('tipe_barang_masuk'))
                ->where('posisi', $request->input('posisi_brg_masuk'))
                ->where('tanggal', $request->input('tgl_brg_masuk'))
                ->first();
            if ($stokBarang) {
                // Jika stok sudah ada, tambahkan jumlah barang masuk
                $stokBarang->barang_masuk += $request->input('jumlah_brg');
                $stokBarang->barang_keluar = $barang_keluar ?? 0;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal +  $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
                $stokBarang->save();
            } else {
                // Cari stok barang sebelumnya berdasarkan barang terakhir yaitu (id_barang)
                $stokSebelumnya = StokBarangModel::where('id_barang', $request->input('id_barang'))
                    ->where('nama_barang', $request->input('nama_barang'))
                    ->where('tipe_barang', $request->input('tipe_barang_masuk'))
                    ->where('posisi', $request->input('posisi_brg_masuk'))
                    ->orderBy('tanggal', 'desc')
                    ->first();

                // Tentukan stok awal dari stok sebelumnya
                $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

                // Buat record stok baru dengan barang masuk dan stok awal yang diperoleh
                $stokBarangNew = new StokBarangModel();
                $stokBarangNew->id_barang = $request->input('id_barang');
                $stokBarangNew->tanggal = $request->input('tgl_brg_masuk');
                $stokBarangNew->nama_barang = $request->input('nama_barang');
                $stokBarangNew->tipe_barang = $request->input('tipe_barang_masuk');
                $stokBarangNew->barang_masuk = $request->input('jumlah_brg');
                $stokBarangNew->barang_keluar =  $barang_keluar;
                $stokBarangNew->stok_awal =  $stokAwal;
                $stokBarangNew->stok_akhir =  ($stokBarangNew->stok_awal + $stokBarangNew->barang_masuk) - $stokBarangNew->barang_keluar;
                $stokBarangNew->posisi = $request->input('posisi_brg_masuk');
                $stokBarangNew->keterangan = 'stok';
                $stokBarangNew->save();
            }
        }

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


        $barangMasuk = BarangMasukModel::findOrFail($id);
        $barangMasuk->id_barang = $request->input('id_barang');
        $barangMasuk->tgl_brg_masuk = $request->input('tgl_brg_masuk');
        $barangMasuk->no_warehouse = $request->input('no_warehouse');
        $barangMasuk->kode_barang = $request->input('kode_barang_brg_masuk');
        $barangMasuk->nama_barang = $request->input('nama_barang');
        $barangMasuk->tipe_barang = $request->input('tipe_barang_masuk');
        $barangMasuk->asal_gudang = $request->input('asal_gdg');
        $barangMasuk->jumlah_barang = $request->input('jumlah_brg');
        $barangMasuk->status = $request->input('status');
        $barangMasuk->nama_konsumen = $request->input('konsumen');
        $barangMasuk->posisi = $request->input('posisi_brg_masuk');
        $barangMasuk->update();

        $barang_keluar = BarangKeluarModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang_masuk'))
            ->where('posisi', $request->input('posisi_brg_masuk'))
            ->where('tanggal', $request->input('tgl_brg_masuk'))
            ->sum('jumlah_barang');

        // Jika status adalah 'stok', hitung stok barang terkait barang masuk
        if ($barangMasuk->status === 'stok' || $barangMasuk->status === 'customer') {
            // Cari stok untuk barang yang sesuai dengan id_barang dan id_brg_masuk
            $stokBarang = StokBarangModel::where('id_barang', $request->input('id_barang'))
                ->where('nama_barang', $request->input('nama_barang'))
                ->where('tipe_barang', $request->input('tipe_barang_masuk'))
                ->where('posisi', $request->input('posisi_brg_masuk'))
                ->where('tanggal', $request->input('tgl_brg_masuk'))
                ->first();

            // Hitung selisih barang masuk
            // $selisihBarangMasuk = $request->input('jumlah_brg') - $jumlahBarangSebelum;

            // Jika stok barang ada, tambahkan jumlah barang masuk
            if ($stokBarang) {
                $stokBarang->barang_masuk =  $request->input('jumlah_brg');
                $stokBarang->barang_keluar =  $barang_keluar ?? 0;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
                $stokBarang->save();
            } else {
                // Buat stok baru jika belum ada
                $stokSebelumnya = StokBarangModel::where('id_barang', $request->input('id_barang'))
                    ->where('nama_barang', $request->input('nama_barang'))
                    ->where('tipe_barang', $request->input('tipe_barang_masuk'))
                    ->where('posisi', $request->input('posisi_brg_masuk'))
                    ->orderBy('tanggal', 'desc')
                    ->first();

                // Tentukan stok awal dari stok sebelumnya
                $stok_awal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

                // Buat record stok baru dengan barang masuk dan stok awal yang diperoleh
                $stokBarangNew = new StokBarangModel();
                $stokBarangNew->id_barang = $request->input('id_barang');
                $stokBarangNew->tanggal = $request->input('tgl_brg_masuk');
                $stokBarangNew->nama_barang = $request->input('nama_barang');
                $stokBarangNew->tipe_barang = $request->input('tipe_barang_masuk');
                $stokBarangNew->barang_masuk = $request->input('jumlah_brg');
                $stokBarangNew->barang_keluar =  $barang_keluar;
                $stokBarangNew->stok_awal = $stok_awal;
                $stokBarangNew->stok_akhir =  ($stokBarangNew->stok_awal + $stokBarangNew->barang_masuk) - $stokBarangNew->barang_keluar;
                $stokBarangNew->posisi = $request->input('posisi_brg_masuk');
                $stokBarangNew->keterangan = 'stok';
                $stokBarangNew->save();
            }
        }
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
