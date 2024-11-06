<?php

namespace App\Http\Controllers;

use App\Exports\TransaksiExport;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Exports\StokExport;
use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Exports\BarangExport;
use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use App\Exports\BarangMasukExport;
use App\Exports\BarangKeluarExport;
use App\Models\BarangKeluarModel;
use Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;

class ExportAction extends Controller
{
    public function exportBarang()
    {
        return Excel::download(new BarangExport, 'Daftar Barang.xlsx');
    }
    public function exportBarangMasuk(Request $request)
    {
        $start_date = $request->get('start_date');
        $end_date = $request->get('end_date');
        // dd($barang);
        return Excel::download(new BarangMasukExport($start_date, $end_date), 'Barang Masuk.xlsx');
    }

    public function exportStok(Request $request)
    {
        $start_date = $request->get('start_date_stok');
        $end_date = $request->get('end_date_stok');
        return Excel::download(new StokExport($start_date, $end_date), 'Stok Barang.xlsx');
    }
    public function exportBarangKeluar(Request $request)
    {
        $start_date = $request->get('start_date_barang_keluar');
        $end_date = $request->get('end_date_barang_keluar');
        return Excel::download(new BarangKeluarExport($start_date, $end_date), 'Laporan barang keluar.xlsx');
    }
    public function exportTransaksi(Request $request)
    {
        $start_date = $request->get('start_date_transaksi');
        $end_date = $request->get('end_date_transaksi');
        return Excel::download(new TransaksiExport($start_date, $end_date), 'Laporan Transaksi.xlsx');
    }

    public function berangKeluarPDF(Request $request)
    {
        $start_date = Carbon::now();
        $end_date = Carbon::now();
        $barang_keluar = BarangKeluarModel::all();
        $pdf = PDF::loadView('Barang_Keluar.print.index', compact('barang_keluar', 'start_date', 'end_date'));
        // return $pdf->download('Laporan barang keluar.pdf');
        return $pdf->stream('laporan-barang.pdf');
    }

    public function viewstok()
    {
        return view('StokBarang.print.index', [
            'stok' => StokBarangModel::all(),
        ]);
    }
}
