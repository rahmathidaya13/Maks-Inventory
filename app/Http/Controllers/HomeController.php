<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use App\Models\TransaksiModel;
use Carbon\Carbon;
use Illuminate\Http\Request;

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

        // total barang
        $barang = BarangModel::count();
        return view('home.index', compact('countTransaksi', 'periode', 'barang'));
    }
}
