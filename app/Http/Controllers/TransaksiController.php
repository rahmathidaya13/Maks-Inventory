<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use App\Models\TopProductModel;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;
use Illuminate\Support\Facades\DB;
use App\Traits\Validate\ValidateTransaksi;
use App\Traits\Handles\handlesTransaksiPenjualan;

class TransaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    use ValidateTransaksi, handlesTransaksiPenjualan;
    public function index()
    {
        $DaftarBarang = BarangModel::all();
        $transaksi = TransaksiModel::latest()->paginate(10);
        $stokBarang = StokBarangModel::all();
        return view('transaksi.index', compact('DaftarBarang', 'transaksi', 'stokBarang'));
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
        // dd($request->all());
        // validate data
        $this->ValidateTransaksi($request->all());

        $dataParse = $this->parseValue($request);

        $transaksi = $this->createTransaksiDB($dataParse, $request);

        $barang_masuk = $this->checkBarangMasuk($request);
        if ($transaksi->status_pembayaran === 'lunas') {
            $this->updateStok($dataParse, $request, $barang_masuk);
            $this->updateBarangKeluar($transaksi);
            $this->updateTopProduct($transaksi);
        }


        return back()->with('success', 'Transaksi Berhasil Dibuat');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $transaksi = TransaksiModel::findOrFail($id);
        return response()->json(
            ['success' => 'Fetching success', 'result' => $transaksi],
            200,
            [
                'Content-Type' => 'application/json',
                'X-Content-Type-Options' => 'nosniff',
            ],
            JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK
        );
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function repayment(Request $request, string $id)
    {
        // this validates that the resource
        $this->ValidateTransaksiRepayment($request->all());

        $harga_barang = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('hb'));
        $dana_pertama = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('dana_pertama'));
        $selisih_pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('selisih_pembayaran_'));
        $pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('pembayaran_pelunasan'));

        $getAllTransaksi = TransaksiModel::findOrFail($id);

        $old_jumlah_barang = $getAllTransaksi->jumlah_barang;

        $transaksi = new TransaksiModel();
        $transaksi->id_barang = $getAllTransaksi->id_barang;
        $transaksi->id_stok = $getAllTransaksi->id_stok;
        $transaksi->kode_barang = $getAllTransaksi->kode_barang;
        $transaksi->nama_barang = $getAllTransaksi->nama_barang;
        $transaksi->nama_sales = $getAllTransaksi->nama_sales;
        $transaksi->tipe_barang = $getAllTransaksi->tipe_barang;
        $transaksi->jumlah_barang = $getAllTransaksi->jumlah_barang;
        $transaksi->posisi = $getAllTransaksi->posisi;
        $transaksi->diskon = $getAllTransaksi->diskon;
        $transaksi->total_pembayaran = $getAllTransaksi->total_pembayaran;

        $transaksi->tgl_transaksi = $request->input('tgl_pelunasan');
        $transaksi->kode_transaksi = $request->input('kode_transaksi_pelunasan');
        $transaksi->nama_konsumen = $request->input('konsumen');
        $transaksi->no_handphone = $request->input('hp');
        $transaksi->alamat = $request->input('alamat_konsumen');
        $transaksi->status_transaksi = $request->input('transaksi');
        $transaksi->status_pembayaran = $request->input('stts_pembayaran');
        $transaksi->harga_barang = $harga_barang;
        $transaksi->dana_pertama = $dana_pertama;
        $transaksi->selisih_pembayaran = $selisih_pembayaran;
        $transaksi->pembayaran = $pembayaran;
        $transaksi->save();

        $barang_masuk = BarangMasukModel::where('id_barang', $getAllTransaksi->id_barang)
            ->where('nama_barang', $getAllTransaksi->nama_barang)
            ->where('tipe_barang', $getAllTransaksi->tipe_barang)
            ->where('posisi', $getAllTransaksi->posisi)
            ->where('tgl_brg_masuk', $request->input('tgl_pelunasan'))
            ->sum('jumlah_barang');

        if ($transaksi->status_pembayaran == 'lunas') {
            // Cari stok berdasarkan tanggal pelunasan, bukan tanggal transaksi sebelumnya
            $stokBarang = StokBarangModel::where('id_barang', $getAllTransaksi->id_barang)
                ->where('nama_barang', $getAllTransaksi->nama_barang)
                ->where('tipe_barang', $getAllTransaksi->tipe_barang)
                ->where('posisi', $getAllTransaksi->posisi)
                ->whereDate('tanggal', $request->input('tgl_pelunasan'))  // Ubah jadi tgl_pelunasan
                ->first();
            $stokAwal = $stokBarang ? $stokBarang->stok_akhir : 0;
            if ($stokBarang) {
                $stokBarang->barang_masuk = $barang_masuk ?? 0;
                $stokBarang->barang_keluar += $old_jumlah_barang;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
                $stokBarang->save();
            } else {
                // Ambil stok sebelumnya (sebelum pelunasan)
                $stokSebelumnya = StokBarangModel::where('id_barang', $getAllTransaksi->id_barang)
                    ->where('nama_barang', $getAllTransaksi->nama_barang)
                    ->where('tipe_barang', $getAllTransaksi->tipe_barang)
                    ->where('posisi', $getAllTransaksi->posisi)
                    ->orderBy('tanggal', 'desc')  // Ambil stok terakhir berdasarkan tanggal
                    ->first();

                $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;
                $stokBarang = new StokBarangModel();
                $stokBarang->id_barang = $getAllTransaksi->id_barang;
                $stokBarang->tanggal = $request->input('tgl_pelunasan');
                $stokBarang->nama_barang = $getAllTransaksi->nama_barang;
                $stokBarang->tipe_barang = $getAllTransaksi->tipe_barang;
                $stokBarang->stok_awal = $stokAwal;
                $stokBarang->barang_masuk = $barang_masuk ?? 0;
                $stokBarang->barang_keluar = $old_jumlah_barang;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
                $stokBarang->posisi = $getAllTransaksi->posisi;
                $stokBarang->keterangan = 'stok';
                $stokBarang->save();
            }

            // Update stok barang di barang_keluar
            $barangKeluar = BarangKeluarModel::where('id_barang', $transaksi->id_barang)
                ->where('nama_konsumen', $transaksi->nama_konsumen)
                ->where('nama_barang', $transaksi->nama_barang)
                ->where('tipe_barang', $transaksi->tipe_barang)
                ->where('posisi', $transaksi->posisi)
                ->whereDate('tanggal', $transaksi->tgl_transaksi)
                ->first();
            if ($barangKeluar) {
                $barangKeluar->jumlah_barang += $transaksi->jumlah_barang;
                $barangKeluar->save();
            } else {
                $barangKeluar = new BarangKeluarModel();
                $barangKeluar->id_transaksi = $transaksi->id_transaksi;
                $barangKeluar->id_barang = $transaksi->id_barang;
                $barangKeluar->tanggal = $transaksi->tgl_transaksi;
                $barangKeluar->kode_transaksi = $transaksi->kode_transaksi;
                $barangKeluar->nama_konsumen = $transaksi->nama_konsumen;
                $barangKeluar->no_handphone = $transaksi->no_handphone;
                $barangKeluar->alamat = $transaksi->alamat;
                $barangKeluar->kode_barang = $transaksi->kode_barang;
                $barangKeluar->nama_barang = $transaksi->nama_barang;
                $barangKeluar->tipe_barang = $transaksi->tipe_barang;
                $barangKeluar->jumlah_barang = $transaksi->jumlah_barang;
                $barangKeluar->posisi = $transaksi->posisi;
                $barangKeluar->save();
            }

            // maish test
            $topProduct = TopProductModel::where('id_barang', $transaksi->id_barang)
                ->where('nama_barang', $transaksi->nama_barang)
                ->where('tipe_barang', $transaksi->tipe_barang)
                ->whereDate('tanggal', $transaksi->tgl_transaksi)
                ->first();
            if ($topProduct) {
                $topProduct->total_barang += $transaksi->jumlah_barang;
                $topProduct->save();
            } else {
                $topProducts = new TopProductModel();
                $topProducts->id_barang = $transaksi->id_barang;
                $topProducts->tanggal = $transaksi->tgl_transaksi;
                $topProducts->kode_barang = $transaksi->kode_barang;
                $topProducts->nama_barang = $transaksi->nama_barang;
                $topProducts->tipe_barang = $transaksi->tipe_barang;
                $topProducts->total_barang = $transaksi->jumlah_barang;
                $topProducts->save();
            }
        }

        return back()->with('success', 'Pelunasan' . ' ' . $transaksi->nama_konsumen . ' ' . 'Berhasil');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        // dd( $request->all());

        // validate data
        $this->ValidateTransaksi($request->all());
        $dataParse = $this->parseValue($request);
        // update data
        $this->updateTransaksiDB($dataParse, $request, $id);

        return back()->with('success', 'Perubahan Data Transaksi Berhasil');
    }

    public function takeAway(Request $request, string $id)
    {
        $transaksi = TransaksiModel::findOrFail($id);

        $oldBarang = $transaksi->jumlah_barang;

        $transaksiNew = $this->updateTakeAway($transaksi, $request);

        // cari barang masuk agar memperbarui tabel atau data stok barang
        $barang_masuk = BarangMasukModel::where('id_barang', $transaksi->id_barang)
            ->where('nama_barang', $transaksi->nama_barang)
            ->where('tipe_barang', $transaksi->tipe_barang)
            ->where('posisi', $transaksi->posisi)
            ->where('tgl_brg_masuk', $request->input('tanggal_ambil'))
            ->sum('jumlah_barang');

        if ($transaksiNew->status_pembayaran == 'lunas') {
            // Cari stok berdasarkan tanggal pelunasan, bukan tanggal transaksi sebelumnya
            $stokBarang = StokBarangModel::where('id_barang', $transaksi->id_barang)
                ->where('nama_barang', $transaksi->nama_barang)
                ->where('tipe_barang', $transaksi->tipe_barang)
                ->where('posisi', $transaksi->posisi)
                ->whereDate('tanggal', $request->input('tanggal_ambil'))
                ->first();
            if ($stokBarang) {
                $stokBarang->barang_masuk = $barang_masuk ?? 0;
                $stokBarang->barang_keluar += $oldBarang;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
                $stokBarang->save();
            } else {
                // Ambil stok sebelumnya (sebelum pelunasan)
                $stokSebelumnya = StokBarangModel::where('id_barang', $transaksi->id_barang)
                    ->where('nama_barang', $transaksi->nama_barang)
                    ->where('tipe_barang', $transaksi->tipe_barang)
                    ->where('posisi', $transaksi->posisi)
                    ->orderBy('tanggal', 'desc')  // Ambil stok terakhir berdasarkan tanggal
                    ->first();

                $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

                $stokBarang = new StokBarangModel();
                $stokBarang->id_barang = $transaksi->id_barang;
                $stokBarang->tanggal = $request->input('tanggal_ambil');
                $stokBarang->nama_barang = $transaksi->nama_barang;
                $stokBarang->tipe_barang = $transaksi->tipe_barang;
                $stokBarang->stok_awal = $stokAwal;
                $stokBarang->barang_masuk = $barang_masuk ?? 0;
                $stokBarang->barang_keluar = $oldBarang;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
                $stokBarang->posisi = $transaksi->posisi;
                $stokBarang->keterangan = 'stok';
                $stokBarang->save();
            }

            // Update stok barang di barang_keluar
            $barangKeluar = BarangKeluarModel::where('id_barang', $transaksiNew->id_barang)
                ->where('nama_konsumen', $transaksiNew->nama_konsumen)
                ->where('nama_barang', $transaksiNew->nama_barang)
                ->where('tipe_barang', $transaksiNew->tipe_barang)
                ->where('posisi', $transaksiNew->posisi)
                ->whereDate('tanggal', $transaksiNew->tgl_transaksi)
                ->first();
            if ($barangKeluar) {
                $barangKeluar->jumlah_barang += $transaksiNew->jumlah_barang;
                $barangKeluar->save();
            } else {
                $barangKeluar = new BarangKeluarModel();
                $barangKeluar->id_transaksi = $transaksiNew->id_transaksi;
                $barangKeluar->id_barang = $transaksiNew->id_barang;
                $barangKeluar->tanggal = $request->input('tanggal_ambil');
                $barangKeluar->kode_transaksi = $transaksiNew->kode_transaksi;
                $barangKeluar->nama_konsumen = $transaksiNew->nama_konsumen;
                $barangKeluar->no_handphone = $transaksiNew->no_handphone;
                $barangKeluar->alamat = $transaksiNew->alamat;
                $barangKeluar->kode_barang = $transaksiNew->kode_barang;
                $barangKeluar->nama_barang = $transaksiNew->nama_barang;
                $barangKeluar->tipe_barang = $transaksiNew->tipe_barang;
                $barangKeluar->jumlah_barang = $transaksiNew->jumlah_barang;
                $barangKeluar->posisi = $transaksiNew->posisi;
                $barangKeluar->save();
            }

            // maish test
            $topProduct = TopProductModel::where('id_barang', $transaksiNew->id_barang)
                ->where('nama_barang', $transaksiNew->nama_barang)
                ->where('tipe_barang', $transaksiNew->tipe_barang)
                ->whereDate('tanggal', $transaksiNew->tgl_transaksi)
                ->first();
            if ($topProduct) {
                $topProduct->total_barang += $transaksiNew->jumlah_barang;
                $topProduct->save();
            } else {
                $topProducts = new TopProductModel();
                $topProducts->id_barang = $transaksiNew->id_barang;
                $topProducts->tanggal = $transaksiNew->tgl_transaksi;
                $topProducts->kode_barang = $transaksiNew->kode_barang;
                $topProducts->nama_barang = $transaksiNew->nama_barang;
                $topProducts->tipe_barang = $transaksiNew->tipe_barang;
                $topProducts->total_barang = $transaksiNew->jumlah_barang;
                $topProducts->save();
            }
        }
        return back()->with('success', 'Barang' . ' ' . $transaksiNew->nama_barang . '-' . $transaksiNew->tipe_barang . ' ' . 'Berhasil Keluar');
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $transaksi = TransaksiModel::findOrFail($id);
        $transaksi->delete();
        return back()->with('success', 'Penghapusan Data Transaksi Berhasil');
    }
}
