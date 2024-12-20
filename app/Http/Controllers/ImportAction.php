<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Imports\BarangImport;
use App\Imports\BarangMasukImport;
use App\Imports\StokImport;
use App\Imports\TransaksiImport;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Validator;

class ImportAction extends Controller
{
    public function importFile(Request $request)
    {
        $request->validate(
            [
                'imports' => 'required|file|mimes:xls,xlsx|max:11120'
            ],
            [
                'imports.required' => 'File impor wajib diunggah',
                'imports.mimes' => 'File harus berformat Excel xls, xlsx',
                'imports.max' => 'Ukuran file tidak boleh lebih dari 11 MB',
            ]
        );

        $files = $request->file('imports');
        try {

            Excel::import(new BarangImport, $files);
            return back()->with('success', 'File imported successfully');
        } catch (\Exception $err) {
            return back()->with('error', $err->getMessage());
        }
    }

    public function importBarangMasuk(Request $request)
    {
        $request->validate(
            [
                'import_brg_masuk' => 'required|file|mimes:xls,xlsx|max:11120'
            ],
            [
                'import_brg_masuk.required' => 'File impor wajib diunggah',
                'import_brg_masuk.mimes' => 'File harus berformat Excel xls, xlsx',
                'import_brg_masuk.max' => 'Ukuran file tidak boleh lebih dari 11 MB',
            ]
        );

        $files = $request->file('import_brg_masuk');
        // $fileType = in_array($files->getClientOriginalExtension(), ['xls', 'xlsx']) ? 'excel' : 'csv';

        // Mulai transaksi
        try {
            DB::beginTransaction();
            // Nonaktifkan foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS=0;');

            // Proses impor file menggunakan Laravel Excel
            Excel::import(new BarangMasukImport, $files);

            // Aktifkan kembali foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
            DB::commit();
            return back()->with('success', 'File imported successfully');
        } catch (\Exception $err) {

            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();

            // Aktifkan kembali foreign key checks jika ada error
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
            return back()->with('error', $err->getMessage());
        }
    }

    public function importStokBarang(Request $request)
    {
        $request->validate(
            [
                'import_stok_form' => 'required|file|mimes:xls,xlsx|max:11120'
            ],
            [
                'import_stok_form.required' => 'File impor wajib diunggah',
                'import_stok_form.mimes' => 'File harus berformat Excel xls, xlsx',
                'import_stok_form.max' => 'Ukuran file tidak boleh lebih dari 11 MB',
            ]
        );

        $files = $request->file('import_stok_form');
        try {
            DB::beginTransaction();
            // Nonaktifkan foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS=0;');

            // Proses impor file menggunakan Laravel Excel
            Excel::import(new StokImport, $files);

            // Aktifkan kembali foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
            DB::commit();
            return back()->with('success', 'File imported successfully');
        } catch (\Exception $err) {

            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();

            // Aktifkan kembali foreign key checks jika ada error
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
            return back()->with('error', $err->getMessage());
        }
    }
    public function importTransaksi(Request $request)
    {
        $request->validate(
            [
                'import_transaksi_form' => 'required|file|mimes:xls,xlsx|max:11120'
            ],
            [
                'import_transaksi_form.required' => 'File impor wajib diunggah',
                'import_transaksi_form.mimes' => 'File harus berformat Excel xls, xlsx',
                'import_transaksi_form.max' => 'Ukuran file tidak boleh lebih dari 11 MB',
            ]
        );

        $files = $request->file('import_transaksi_form');
        try {
            DB::beginTransaction();
            // Nonaktifkan foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS=0;');

            // Proses impor file menggunakan Laravel Excel
            Excel::import(new TransaksiImport, $files);

            // Aktifkan kembali foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
            DB::commit();
            return back()->with('success', 'File imported successfully');
        } catch (\Exception $err) {

            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();

            // Aktifkan kembali foreign key checks jika ada error
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
            return back()->with('error', $err->getMessage());
        }
    }
}
