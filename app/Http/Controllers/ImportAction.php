<?php

namespace App\Http\Controllers;

use App\Imports\BarangImport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Validator;

class ImportAction extends Controller
{
    public function importFile(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'imports' => 'required|file|mimes:xls,xlsx,csv|max:11120'
            ],
            [
                'imports.required' => 'File impor wajib diunggah',
                'imports.mimes' => 'File harus berformat Excel (xls, xlsx) atau CSV',
                'imports.max' => 'Ukuran file tidak boleh lebih dari 11 MB',
            ]
        );
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();  // redirect back with errors.
        }
        $files = $request->file('imports');
        try {

            Excel::import(new BarangImport, $files);
            return back()->with('success', 'File imported successfully');
        } catch (\Exception $err) {
            return back()->with('error', $err->getMessage());
        }
    }
}
