<?php

namespace App\Http\Controllers;

use App\Exports\BarangMasukExport;
use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Exports\BarangExport;
use App\Exports\StokExport;
use App\Models\BarangMasukModel;
use App\Models\StokBarangModel;
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

    public function exportStok()
    {
        return Excel::download(new StokExport, 'Stok Barang.xlsx');
    }

    public function viewstok()
    {
        return view('StokBarang.print.index', [
           'stok' => StokBarangModel::all(),
        ]);
    }
}
