<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Exports\BarangExport;
use Maatwebsite\Excel\Facades\Excel;

class ExportAction extends Controller
{
    public function exportBarang()
    {
        return Excel::download(new BarangExport, 'Barang.xlsx');
    }

    // public function viewItem()
    // {    $barang = BarangModel::all();
    //     return view('Barang.print_out.page',compact('barang'));
    // }
}
