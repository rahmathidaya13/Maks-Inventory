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
        $stok = StokBarangModel::latest()->paginate(10);
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
        // Validasi input
        $request->validate([
            'nama_barang' => 'required|string|max:255',
            'tipe_barang' => 'required|string|max:255',
            'tgl' => 'required|date',  // Pastikan tanggal valid
            'jumlah_barang' => 'required|integer|min:1',  // Pastikan jumlah barang minimal 1
            'keterangan' => 'nullable|string|max:255',  // Keterangan bersifat opsional
            'posisi_barang' => 'required|string',  // Keterangan bersifat opsional
        ], [
            'nama_barang.required' => 'Nama barang harus dipilih.',
            'tipe_barang.required' => 'Tipe barang harus dipilih.',
            'tgl.required' => 'Tanggal barang masuk harus diisi.',
            'tgl.date' => 'Format tanggal tidak valid.',
            'jumlah_barang.required' => 'Jumlah barang harus diisi.',
            'jumlah_barang.integer' => 'Jumlah barang harus berupa angka.',
            'jumlah_barang.min' => 'Jumlah barang minimal 1.',
            'posisi_barang.required' => 'Posisi barang harus dipilih.',
        ]);

        $barang_masuk = BarangMasukModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->where('posisi', $request->input('posisi_barang'))
            ->where('tgl_brg_masuk', $request->input('tgl'))
            ->sum('jumlah_barang');

        $barang_keluar = BarangKeluarModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->where('posisi', $request->input('posisi_barang'))
            ->where('tanggal', $request->input('tgl'))
            ->sum('jumlah_barang');

        $stokChek = StokBarangModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->where('posisi', $request->input('posisi_barang'))
            ->where('tanggal', $request->input('tgl'))
            ->first();

        if ($stokChek) {
            $stokChek->barang_masuk = $barang_masuk;
            $stokChek->barang_keluar = $barang_keluar;
            $stokChek->stok_awal += $request->input('jumlah_barang');
            $stokChek->stok_akhir = ($stokChek->stok_awal + $stokChek->barang_masuk) - $stokChek->barang_keluar;
            $stokChek->keterangan = $request->input('keterangan') ?? $stokChek->keterangan;
            $stokChek->save();
        } else {
            $stokTerakhir = StokBarangModel::where('id_barang', $request->input('id_barang'))
                ->where('nama_barang', $request->input('nama_barang'))
                ->where('tipe_barang', $request->input('tipe_barang'))
                ->where('posisi', $request->input('posisi_barang'))
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
            if (empty($stokAwal)) {
                $stok->stok_awal = $request->input('jumlah_barang');
            } else {
                $stok->stok_awal = $stokAwal + $request->input('jumlah_barang');
            }
            // $stok->stok_awal = $request->input('jumlah_barang');
            $stok->stok_akhir =  ($stok->stok_awal + $stok->barang_masuk) - $stok->barang_keluar;
            $stok->posisi = $request->input('posisi_barang');
            $stok->keterangan = $request->input('keterangan');
            $stok->save();
            // dd($stokAwal);
        }
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
        // Validasi input
        $request->validate([
            'nama_barang' => 'required|string|max:255',
            'tipe_barang' => 'required|string|max:255',
            'tgl' => 'required|date',
            'jumlah_barang' => 'required|integer|min:1',
            'keterangan' => 'nullable|string|max:255',
            'posisi_barang' => 'required|string',
        ], [
            'nama_barang.required' => 'Nama barang harus dipilih.',
            'tipe_barang.required' => 'Tipe barang harus dipilih.',
            'tgl.required' => 'Tanggal barang masuk harus diisi.',
            'tgl.date' => 'Format tanggal tidak valid.',
            'jumlah_barang.required' => 'Jumlah barang harus diisi.',
            'jumlah_barang.integer' => 'Jumlah barang harus berupa angka.',
            'jumlah_barang.min' => 'Jumlah barang minimal 1.',
            'posisi_barang.required' => 'Posisi barang harus dipilih.',
        ]);

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

        $stokSebelumnya = StokBarangModel::where('id_barang',  $request->input('id_barang'))
            ->where('nama_barang',  $request->input('nama_barang'))
            ->where('tipe_barang', $request->input('tipe_barang'))
            ->where('tanggal', $request->input('tgl'))
            ->first();
        $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

        if ($stokSebelumnya) {
            $stokBarang = StokBarangModel::find($id);

            $selisih = $stokBarang->stok_akhir;

            $stokBarang->nama_barang = $request->input('nama_barang');
            $stokBarang->tipe_barang = $request->input('tipe_barang');
            $stokBarang->tanggal = $request->input('tgl');
            $stokBarang->barang_masuk = $barang_masuk;
            $stokBarang->barang_keluar = $barang_keluar;
            $stokBarang->stok_awal = (int) $request->input('jumlah_barang');
            $stokBarang->stok_akhir = (int) ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            $stokBarang->posisi = $request->input('posisi_barang');
            $stokBarang->keterangan = $request->input('keterangan');
            $stokBarang->save();
        } else {
            $stoklama = StokBarangModel::where('id_barang',  $request->input('id_barang'))
                ->where('nama_barang',  $request->input('nama_barang'))
                ->where('tipe_barang', $request->input('tipe_barang'))
                ->where('posisi', $request->input('posisi_barang'))
                ->orderBy('tanggal', 'desc')
                ->first();

            $stok_awal = $stoklama ? $stoklama->stok_akhir : 0;

            $stokNew = new StokBarangModel();
            $stokNew->id_barang = $request->input('id_barang');
            $stokNew->nama_barang = $request->input('nama_barang');
            $stokNew->tipe_barang = $request->input('tipe_barang');
            $stokNew->tanggal = $request->input('tgl');
            $stokNew->barang_masuk = $barang_masuk;
            $stokNew->barang_keluar = $barang_keluar;
            $stokNew->stok_awal = $request->input('jumlah_barang') + $stok_awal;
            $stokNew->stok_akhir = ($stokNew->stok_awal + $stokNew->barang_masuk) - $stokNew->barang_keluar;
            $stokNew->posisi = $request->input('posisi_barang');
            $stokNew->keterangan = $request->input('keterangan');
            $stokNew->save();
            return back()->with('success', 'Data Stok' . ' ' . $stokNew->nama_barang . ' - ' . $stokNew->tipe_barang . ' ' . 'Berhasil Diupdate');
        }
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
