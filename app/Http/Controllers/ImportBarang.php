<?php

namespace App\Http\Controllers;

use App\Imports\BarangImport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
class ImportBarang extends Controller
{
    public function importBarang(Request $request)
    {
        $files = $request->files('import');
        Excel::import(new BarangImport, $files);
        return back()->with('success', 'File imported successfully');
    }
}
