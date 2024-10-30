<?php

namespace App\Http\Controllers;

use App\Models\BarangMasukModel;
use App\Models\BarangModel;
use App\Models\StokBarangModel;
use Illuminate\Http\Request;

class BarangMasuk extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $allItem = BarangModel::all();
        $barang_masuk = BarangMasukModel::paginate(10);
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
        $request->validate(
            [
                'tgl_brg_masuk' => 'required | date',
                'no_warehouse' => 'required|string|max:50',
                'nama_barang' => 'required|string|max:150',
                'tipe_barang_masuk' => 'required | string | max:150',
                'asal_gdg' => 'required | string | max:150',
                'jumlah_brg' => 'required | integer|min:1',
                'status' => 'required | string',
                'konsumen' => 'required | string | max:100',
            ],
            [
                'tgl_brg_masuk.required' => 'Tanggal barang masuk wajib diisi.',
                'tgl_brg_masuk.date' => 'Tanggal barang masuk harus berupa format tanggal yang valid.',
                'no_warehouse.required' => 'Nomor warehouse wajib diisi.',
                'no_warehouse.max' => 'Nomor warehouse tidak boleh lebih dari 50 karakter.',
                'nama_barang.required' => 'Nama barang wajib diisi.',
                'nama_barang.max' => 'Nama barang tidak boleh lebih dari 150 karakter.',
                'tipe_barang_masuk.required' => 'Tipe barang wajib diisi.',
                'tipe_barang_masuk.max' => 'Tipe barang tidak boleh lebih dari 150 karakter.',
                'asal_gdg.required' => 'Asal gudang wajib diisi.',
                'asal_gdg.max' => 'Asal gudang tidak boleh lebih dari 150 karakter.',
                'jumlah_brg.required' => 'Jumlah barang wajib diisi.',
                'jumlah_brg.integer' => 'Jumlah barang harus berupa angka yang valid.',
                'jumlah_brg.min' => 'Jumlah barang minimal adalah 1.',
                'status.required' => 'Status wajib dipilih.',
                'konsumen.required' => 'Nama konsumen wajib diisi.',
                'konsumen.max' => 'Nama konsumen tidak boleh lebih dari 100 Karakter',
            ]
        );
        $barangMasuk = new BarangMasukModel();
        $barangMasuk->id_barang = $request->input('id_barang');
        $barangMasuk->tgl_brg_masuk = $request->input('tgl_brg_masuk');
        $barangMasuk->no_warehouse = $request->input('no_warehouse');
        $barangMasuk->nama_barang = $request->input('nama_barang');
        $barangMasuk->tipe_barang = $request->input('tipe_barang_masuk');
        $barangMasuk->asal_gudang = $request->input('asal_gdg');
        $barangMasuk->jumlah_barang = $request->input('jumlah_brg');
        $barangMasuk->status = $request->input('status');
        $barangMasuk->nama_konsumen = $request->input('konsumen');
        $barangMasuk->save();

        // Jika status adalah 'stok', hitung stok barang terkait barang masuk
        if ($barangMasuk->status === 'stok') {
            // Cari stok untuk barang yang sesuai dengan id_barang dan id_brg_masuk
            $stokBarang = StokBarangModel::where('id_barang', $request->input('id_barang'))
                ->where('nama_barang', $request->input('nama_barang'))
                ->where('tipe_barang', $request->input('tipe_barang_masuk'))
                ->whereDate('tanggal', $request->input('tgl_brg_masuk'))
                ->first();
            if ($stokBarang) {
                // Jika stok sudah ada, tambahkan jumlah barang masuk
                $stokBarang->barang_masuk += $request->input('jumlah_brg');
                $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            } else {
                // Cari stok barang sebelumnya berdasarkan barang terakhir (id_barang)
                $stokSebelumnya = StokBarangModel::where('id_barang', $request->input('id_barang'))
                    ->orderBy('tanggal', 'desc')
                    ->first();
                // Tentukan stok awal dari stok sebelumnya
                $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

                // Buat record stok baru dengan barang masuk dan stok awal yang diperoleh
                $stokBarang = new StokBarangModel();
                $stokBarang->id_brg_masuk = $barangMasuk->id_brg_masuk;
                $stokBarang->id_barang = $request->input('id_barang');
                $stokBarang->tanggal = $request->input('tgl_brg_masuk');
                $stokBarang->nama_barang = $request->input('nama_barang');
                $stokBarang->tipe_barang = $request->input('tipe_barang_masuk');
                $stokBarang->stok_awal = $stokAwal;
                $stokBarang->barang_masuk = $request->input('jumlah_brg');
                $stokBarang->barang_keluar =  0;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
                $stokBarang->keterangan = 'barang masuk';
            }
            $stokBarang->save();
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
        $request->validate(
            [
                'tgl_brg_masuk' => 'required | date',
                'no_warehouse' => 'required|string|max:50',
                'nama_barang' => 'required|string|max:150',
                'tipe_barang_masuk' => 'required | string | max:150',
                'asal_gdg' => 'required | string | max:150',
                'jumlah_brg' => 'required | integer|min:1',
                'status' => 'required | string',
                'konsumen' => 'required | string | max:100',
            ],
            [
                'tgl_brg_masuk.required' => 'Tanggal barang masuk wajib diisi.',
                'tgl_brg_masuk.date' => 'Tanggal barang masuk harus berupa format tanggal yang valid.',
                'no_warehouse.required' => 'Nomor warehouse wajib diisi.',
                'no_warehouse.max' => 'Nomor warehouse tidak boleh lebih dari 50 karakter.',
                'nama_barang.required' => 'Nama barang wajib diisi.',
                'nama_barang.max' => 'Nama barang tidak boleh lebih dari 150 karakter.',
                'tipe_barang_masuk.required' => 'Tipe barang wajib diisi.',
                'tipe_barang_masuk.max' => 'Tipe barang tidak boleh lebih dari 150 karakter.',
                'asal_gdg.required' => 'Asal gudang wajib diisi.',
                'asal_gdg.max' => 'Asal gudang tidak boleh lebih dari 150 karakter.',
                'jumlah_brg.required' => 'Jumlah barang wajib diisi.',
                'jumlah_brg.integer' => 'Jumlah barang harus berupa angka yang valid.',
                'jumlah_brg.min' => 'Jumlah barang minimal adalah 1.',
                'status.required' => 'Status wajib dipilih.',
                'konsumen.required' => 'Nama konsumen wajib diisi.',
                'konsumen.max' => 'Nama konsumen tidak boleh lebih dari 100 Karakter',
            ]
        );

        $barangMasuk = BarangMasukModel::findOrFail($id);

        $jumlahBarangSebelum = $barangMasuk->jumlah_barang;

        $barangMasuk->id_barang = $request->input('id_barang');
        $barangMasuk->tgl_brg_masuk = $request->input('tgl_brg_masuk');
        $barangMasuk->no_warehouse = $request->input('no_warehouse');
        $barangMasuk->nama_barang = $request->input('nama_barang');
        $barangMasuk->tipe_barang = $request->input('tipe_barang_masuk');
        $barangMasuk->asal_gudang = $request->input('asal_gdg');
        $barangMasuk->jumlah_barang = $request->input('jumlah_brg');
        $barangMasuk->status = $request->input('status');
        $barangMasuk->nama_konsumen = $request->input('konsumen');
        $barangMasuk->update();

        // Jika status adalah 'stok', hitung stok barang terkait barang masuk
        if ($barangMasuk->status === 'stok') {
            // Cari stok untuk barang yang sesuai dengan id_barang dan id_brg_masuk
            $stokBarang = StokBarangModel::where('id_barang', $request->input('id_barang'))
                ->whereDate('tanggal', $request->input('tgl_brg_masuk'))
                ->first();

            // Hitung selisih barang masuk
            $selisihBarangMasuk = $request->input('jumlah_brg') - $jumlahBarangSebelum;
            if ($stokBarang) {
                // Tambahkan atau kurangi selisih barang masuk dari stok
                // $stokBarang->barang_masuk += $selisihBarangMasuk;

                // // Hitung ulang stok akhir
                // $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;

                $stokBarang->barang_masuk += $selisihBarangMasuk;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            } else {
                // Buat stok baru jika belum ada
                $stokSebelumnya = StokBarangModel::where('id_barang', $request->input('id_barang'))
                    ->orderBy('tanggal', 'desc')
                    ->first();
                // Tentukan stok awal dari stok sebelumnya
                $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

                // Buat record stok baru dengan barang masuk dan stok awal yang diperoleh
                $stokBarang = new StokBarangModel();
                $stokBarang->id_brg_masuk = $barangMasuk->id_brg_masuk;
                $stokBarang->id_barang = $request->input('id_barang');
                $stokBarang->tanggal = $request->input('tgl_brg_masuk');
                $stokBarang->nama_barang = $request->input('nama_barang');
                $stokBarang->tipe_barang = $request->input('tipe_barang_masuk');
                $stokBarang->stok_awal = $stokAwal;
                $stokBarang->barang_masuk = $request->input('jumlah_brg');
                $stokBarang->barang_keluar =  0;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
                $stokBarang->keterangan = 'barang masuk';
            }
            // Simpan stok yang diperbarui
            $stokBarang->save();
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
