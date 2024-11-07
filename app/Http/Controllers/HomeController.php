<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // transaksi in dashboard only
        $getMonth = Carbon::now()->month;
        $getYear = Carbon::now()->year;
        $periode = Carbon::now()->isoFormat('MMMM Y');
        $countTransaksi = TransaksiModel::whereMonth('tgl_transaksi', $getMonth)
            ->whereYear('tgl_transaksi', $getYear)
            ->sum('pembayaran');
        $konsumen_transaksi = TransaksiModel::whereMonth('tgl_transaksi', $getMonth)
            ->whereYear('tgl_transaksi', $getYear)
            ->count('nama_konsumen');

        $countInBox = BarangMasukModel::whereMonth('tgl_brg_masuk', $getMonth)
            ->whereYear('tgl_brg_masuk', $getYear)
            ->sum('jumlah_barang');

        $countOutBox = BarangKeluarModel::whereMonth('tanggal', $getMonth)
            ->whereYear('tanggal', $getYear)
            ->sum('jumlah_barang');

        $stok_akhir = StokBarangModel::whereMonth('tanggal', $getMonth)
            ->whereYear('tanggal', $getYear)
            ->sum('stok_akhir');

        $transaksi = TransaksiModel::whereMonth('tgl_transaksi', $getMonth)
            ->whereYear('tgl_transaksi', $getYear)
            ->select('nama_sales', DB::raw('SUM(jumlah_barang) AS total_penjualan'))
            ->where('status_pembayaran', 'lunas')
            ->groupBy('nama_sales')
            ->get();
        // total barang
        $barang = BarangModel::count();


        return view('home.index', compact('transaksi', 'countTransaksi', 'periode', 'barang', 'countInBox', 'countOutBox', 'stok_akhir', 'konsumen_transaksi'));
    }
}
