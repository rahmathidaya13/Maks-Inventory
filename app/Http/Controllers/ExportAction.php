<?php

namespace App\Http\Controllers;

use App\Exports\TransaksiExport;
use App\Models\TransaksiModel;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Exports\StokExport;
use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Exports\BarangExport;
use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use App\Exports\BarangMasukExport;
use App\Exports\BarangKeluarExport;
use App\Exports\ExportStokAll;
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
    public function exportStokAll()
    {
        return Excel::download(new ExportStokAll(), 'Stok Barang.xlsx');
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
        $pdf = PDF::loadView('Barang_Keluar.print.pdf_only', compact('barang_keluar', 'start_date', 'end_date'))
            ->setPaper('a4', 'portrait')
            ->setOption([
                'dpi' => 150, // set dpi untuk sesuaikan layout
                'defaultFont' => 'sans-serif',
                'margin-top' => 10,
                'margin-right' => 10,
                'margin-bottom' => 10,
                'margin-left' => 10,
            ]);
        // return $pdf->download('Laporan barang keluar.pdf');
        return $pdf->stream('laporan-barang-keluar.pdf');
    }
    public function transaksiPDF(Request $request)
    {
        $transaksi = TransaksiModel::all();
        $pdf = PDF::loadView('transaksi.print.pdf_print', compact('transaksi'))
            ->setPaper('a4', 'landscape')
            ->setOption([
                'dpi' => 170,  // set dpi untuk sesuaikan layout
                'defaultFont' => 'sans-serif',
                'margin-top' => 10,
                'margin-right' => 10,
                'margin-bottom' => 10,
                'margin-left' => 10,
            ]);
        return $pdf->stream('laporan transaksi.pdf');
    }
    public function stokPDF(Request $request)
    {
        $stok = StokBarangModel::all();
        $pdf = PDF::loadView('StokBarang.print.pdf_print', compact('stok'))
            ->setPaper('a4', 'portrait')
            ->setOption([
                'dpi' => 150, // set dpi untuk sesuaikan layout
                'defaultFont' => 'sans-serif',
                'margin-top' => 10,
                'margin-right' => 10,
                'margin-bottom' => 10,
                'margin-left' => 10,
            ]);
        return $pdf->stream('laporan stok barang.pdf');
    }
    public function dataBarangPDF(Request $request)
    {
        $barang = BarangModel::all();
        $pdf = PDF::loadView('Barang.print_out.pdf_print', compact('barang'))
            ->setPaper('a4', 'portrait')
            ->setOption([
                'dpi' => 150, // set dpi untuk sesuaikan layout
                'defaultFont' => 'sans-serif',
                'margin-top' => 10,
                'margin-right' => 10,
                'margin-bottom' => 10,
                'margin-left' => 10,
            ]);
        return $pdf->stream('laporan data barang.pdf');
    }
    public function barangMasukPDF(Request $request)
    {
        $start_date = Carbon::now();
        $end_date = Carbon::now();
        $barang_masuk = BarangMasukModel::all();
        $pdf = PDF::loadView('BarangMasuk.print.print_pdf', compact('barang_masuk','start_date','end_date'))
            ->setPaper('a4', 'portrait')
            ->setOption([
                'dpi' => 150, // set dpi untuk sesuaikan layout
                'defaultFont' => 'sans-serif',
                'margin-top' => 10,
                'margin-right' => 10,
                'margin-bottom' => 10,
                'margin-left' => 10,
            ]);
        return $pdf->stream('laporan data barang Masuk.pdf');
    }

    public function viewstok()
    {
        return view('StokBarang.print.index', [
            'stok' => StokBarangModel::all(),
        ]);
    }
}
