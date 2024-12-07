<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Exports\StokExport;
use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Exports\BarangExport;
use App\Exports\ExportStokAll;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Exports\TransaksiExport;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;
use App\Exports\BarangMasukExport;
use Illuminate\Support\Facades\DB;
use App\Exports\BarangKeluarExport;
use App\Exports\exportStokByPosition;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;

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

    public function exportStokDate(Request $request)
    {
        // export by date
        $dateParameter = collect([
            'start_date' => $request->get('start_date_stok'),
            'end_date' => $request->get('end_date_stok'),
        ]);
        $request->get('start_date_stok');
        return Excel::download(new StokExport($dateParameter), 'Stok Barang.xlsx');
    }
    public function exportStokByPosition(Request $request)
    {
        $validator = validator::make(
            $request->only('nama_barang_filter'),
            [
                'nama_barang_filter' => 'required|string',
            ],
            [
                'nama_barang_filter.required' => 'Nama Barang Harus Dipilih',
            ]
        );
        $validator = Validator::make($request->only('posisi_barang_export'), [
            'posisi_barang_export' => 'required|string',
        ], [
            'posisi_barang_export.required' => 'Posisi Barang Harus Dipilih.',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator) // Kirim pesan error ke session
                ->withInput();
        }

        $position = $request->get('posisi_barang_export');
        $get_id_barang = $request->get('nama_barang_filter');
        if ($position) {
            return Excel::download(new exportStokByPosition($position), 'Stok Barang ' . $position . '.xlsx');
        } else {
            return Excel::download(new exportStokByPosition($get_id_barang), 'Stok Barang.xlsx');
        }
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
        $pdf = PDF::loadView('BarangMasuk.print.print_pdf', compact('barang_masuk', 'start_date', 'end_date'))
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
    public function penjualanPDF(Request $request)
    {
        // $getMonth = Carbon::now()->month;
        // $getYear = Carbon::now()->year;
        $getMonth = '09';
        $getYear = '2024';

        $getMonthName = Carbon::now()->translatedFormat('F');
        $transaksi = TransaksiModel::whereMonth('tgl_transaksi', $getMonth)
            ->whereYear('tgl_transaksi', $getYear)
            ->select('nama_sales', DB::raw('SUM(jumlah_barang) AS total_barang'), DB::raw('SUM(jumlah_barang * harga_barang) AS total_pendapatan'), 'nama_barang', 'tipe_barang', 'tgl_transaksi')
            ->where('status_pembayaran', 'lunas')
            ->groupBy('nama_sales', 'nama_barang', 'tipe_barang', 'tgl_transaksi')
            ->get();

        $pdf = PDF::loadView('home.print.penjualan_pdf', compact('transaksi', 'getMonthName'))
            ->setPaper('a4', 'portrait')
            ->setOption([
                'dpi' => 160, // set dpi untuk sesuaikan layout
                'defaultFont' => 'sans-serif',
                'margin-top' => 10,
                'margin-right' => 10,
                'margin-bottom' => 10,
                'margin-left' => 10,
            ]);
        return $pdf->stream('Rekap penjualan unit sales.pdf');
    }

    public function viewstok()
    {
        return view('StokBarang.print.index', [
            'stok' => StokBarangModel::all(),
        ]);
    }
}
