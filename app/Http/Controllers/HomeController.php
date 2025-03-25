<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\BarangModel;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use App\Models\TopProductModel;
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
        $periode = Carbon::createFromDate($getYear, $getMonth, Carbon::now()->day)->isoFormat("MMMM YYYY");

        $countTransaksi = TransaksiModel::whereMonth('tgl_transaksi', Carbon::now()->month)
            ->whereYear('tgl_transaksi', Carbon::now()->year)
            ->whereIn('status_pembayaran', ['lunas', 'dana pertama - belum lunas', 'dana pertama - lunas'])
            ->sum('pembayaran');

        $konsumen_transaksi = TransaksiModel::whereMonth('tgl_transaksi', $getMonth)
            ->whereYear('tgl_transaksi', $getYear)
            ->whereIn('status_pembayaran', ['lunas', 'dana pertama - lunas'])
            ->distinct('nama_konsumen')
            ->count('nama_konsumen');

        $countInBox = BarangMasukModel::whereMonth('tgl_brg_masuk', $getMonth)
            ->whereYear('tgl_brg_masuk', $getYear)
            ->sum('jumlah_barang');

        $countOutBox = BarangKeluarModel::whereMonth('tanggal', $getMonth)
            ->whereYear('tanggal', $getYear)
            ->sum('jumlah_barang');


        $transaksi = TransaksiModel::whereMonth('tgl_transaksi', $getMonth)
            ->whereYear('tgl_transaksi', $getYear)
            ->select('nama_sales', DB::raw('SUM(jumlah_barang) AS total_barang'), DB::raw('SUM(jumlah_barang * harga_barang) AS total_pendapatan'), 'nama_barang', 'tipe_barang', 'tgl_transaksi')
            ->where('status_pembayaran', 'lunas')
            ->groupBy('nama_sales', 'nama_barang', 'tipe_barang', 'tgl_transaksi')
            ->orderBy('tgl_transaksi', 'desc')
            ->paginate(10);

        // top prdouct
        // $topProduct = TopProductModel::select('nama_barang', 'tipe_barang', DB::raw('SUM(total_barang) AS total'))
        //     ->whereBetween('tanggal', [now()->startOfMonth(), now()->endOfMonth()])
        //     ->groupBy('nama_barang', 'tipe_barang')
        //     ->orderBy('total', 'desc')
        //     ->take(5)
        //     ->get();
        $topProduct = TopProductModel::select('nama_barang', 'tipe_barang', DB::raw('SUM(total_barang) AS total'))
            ->whereBetween('tanggal', [now()->startOfMonth(), now()->endOfMonth()])
            ->groupBy('nama_barang', 'tipe_barang')
            ->orderBy('total', 'desc')
            ->take(5)
            ->get();

        // total barang
        $barang = BarangModel::count();


        return view('home.index', compact(
            'transaksi',
            'countTransaksi',
            'periode',
            'barang',
            'countInBox',
            'countOutBox',
            'konsumen_transaksi',
            'topProduct'
        ));
    }

    public function income(Request $request)
    {

        $getquery = explode('-', $request->get('query'));

        $pendapatanTransaksi = TransaksiModel::whereMonth('tgl_transaksi',  Carbon::now()->month)
            ->whereYear('tgl_transaksi',  Carbon::now()->year)
            ->select('nama_sales', DB::raw('SUM(jumlah_barang * harga_barang) AS total_pendapatan'), DB::raw('SUM(jumlah_barang) AS total_barang'))
            ->where('status_pembayaran', 'lunas')
            ->groupBy('nama_sales')
            ->get();


        return response()->json(
            ['result' => $pendapatanTransaksi, 'query' => $getquery[0]],
            200,
            [
                'Content-Type' => 'application/json',
                'X-Content-Type-Options' => 'nosniff',
            ]
        );
    }
    public function penjualanUnit(Request $request)
    {
        $query = $request->get('query');
        $merge = explode('-', $query);
        if (!empty($query)) {
            $transaksi = TransaksiModel::whereMonth('tgl_transaksi', $merge[1])
                ->whereYear('tgl_transaksi', $merge[0])
                ->select('nama_sales', DB::raw('SUM(jumlah_barang) AS total_barang'), DB::raw('SUM(jumlah_barang * harga_barang) AS total_pendapatan'), 'nama_barang', 'tipe_barang', 'tgl_transaksi')
                ->where('status_pembayaran', 'lunas')
                ->groupBy('nama_sales', 'nama_barang', 'tipe_barang', 'tgl_transaksi')
                ->get();
        } else {
            $transaksi = $transaksi = TransaksiModel::whereMonth('tgl_transaksi', Carbon::now()->month)
                ->whereYear('tgl_transaksi', Carbon::now()->year)
                ->select('nama_sales', DB::raw('SUM(jumlah_barang) AS total_barang'), DB::raw('SUM(jumlah_barang * harga_barang) AS total_pendapatan'), 'nama_barang', 'tipe_barang', 'tgl_transaksi')
                ->where('status_pembayaran', 'lunas')
                ->groupBy('nama_sales', 'nama_barang', 'tipe_barang', 'tgl_transaksi')
                ->get();
        }
        return view('home.partial.table', compact('transaksi'));
    }
}
