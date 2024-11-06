<?php

use App\Http\Controllers\BarangController;
use App\Http\Controllers\BarangKeluarController;
use App\Http\Controllers\BarangMasuk;
use App\Http\Controllers\ExportAction;
use App\Http\Controllers\ImportAction;
use App\Http\Controllers\LiveAction;
use App\Http\Controllers\LiveSearch;
use App\Http\Controllers\StokBarangController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\RoleAdmin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Auth::routes();

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login');
});

Route::middleware(['auth', 'role:admin'])->group(function () {
    Route::get('/dashboard', function () {
        return view('home.index');
    })->name('dashboard');
    Route::controller(BarangController::class)->group(function () {
        Route::get('/list-item', 'index')->name('list.index');
        Route::post('/list-item/store', 'store')->name('list.store');
        Route::put('/list-item/update/{id}', 'update')->name('list.update');
        Route::get('/list-item/show/{id}', 'show')->name('list.show');
        Route::delete('/list-item/delete/{id}', 'destroy')->name('list.delete');
    });
    Route::controller(BarangMasuk::class)->group(function () {
        Route::get('/barang_masuk', 'index')->name('barang_masuk.index');
        Route::post('/barang_masuk/store', 'store')->name('barang_masuk.store');
        Route::put('/barang_masuk/update/{id}', 'update')->name('barang_masuk.update');
        Route::get('/barang_masuk/detail/{id}', 'show')->name('barang_masuk.show');
        Route::delete('/barang_masuk/delete/{id}/{date}', 'destroy')->name('barang_masuk.delete');
    });
    Route::controller(BarangKeluarController::class)->group(function () {
        Route::get('/barang_keluar', 'index')->name('barang_keluar.index');
    });
    Route::controller(StokBarangController::class)->group(function () {
        Route::get('/stok', 'index')->name('stok.index');
        Route::post('/stok/store', 'store')->name('stok.store');
        Route::put('/stok/update/{id}', 'update')->name('stok.update');
        Route::get('/stok/detail/{id}', 'show')->name('stok.show');
        Route::delete('/stok/delete/{id}', 'destroy')->name('stok.delete');
    });
    Route::controller(TransaksiController::class)->group(function () {
        Route::get('/transaksi', 'index')->name('transaksi.index');
        Route::post('/transaksi/store', 'store')->name('transaksi.store');
        Route::put('/transaksi/update/{id}', 'update')->name('transaksi.update');
        Route::put('/transaksi/repayment/{id}', 'repayment')->name('transaksi.repayment');
        Route::get('/transaksi/detail/{id}', 'show')->name('transaksi.show');
        Route::delete('/transaksi/delete/{id}', 'destroy')->name('transaksi.delete');
    });
    Route::controller(UserController::class)->group(function () {
        Route::put('/profile/update/{id}', 'update')->name('profile.update');
        Route::get('/profile/show/{id}', 'show')->name('profile.show');
    });
    // khusus untuk live action search
    Route::get("/item/search", [LiveAction::class, 'searchItem'])->name('search');
    Route::get("/barang_masuk/search", [LiveAction::class, 'searchBrgMasuk'])->name('barang_masuk');
    Route::get("/stok/search", [LiveAction::class, 'stokSearch'])->name('stok.search');
    Route::get("/transaksi/search", [LiveAction::class, 'transaksiSearch'])->name('transaksi.search');
    Route::get("/barang_keluar/search", [LiveAction::class, 'barangKeluarSearch'])->name('barang_keluar.search');

    // for limit requet endpoint 100 page
    Route::get("/item/offset", [LiveAction::class, 'filterData'])->name('offset');
    Route::get("/barang_masuk/filter", [LiveAction::class, 'filterBrgMasuk'])->name('barang_masuk.filter');
    Route::get("/stok/filter", [LiveAction::class, 'stokFilter'])->name('stok.filter');
    Route::get("/transaksi/filter", [LiveAction::class, 'transaksiFilter'])->name('transaksi.filter');
    Route::get("/barang_keluar/filter", [LiveAction::class, 'barangKeluarFilter'])->name('barang_keluar.filter');

    // for filter with date
    Route::post("/stok/filter/date", [LiveAction::class, 'filterDateStok'])->name('date.filter.stok');
    Route::post("/barang_masuk/filter/date", [LiveAction::class, 'filterDateBarangMasuk'])->name('date.filter.barang_masuk');
    Route::post("/barang_keluar/filter/date", [LiveAction::class, 'filterDateBarangKeluar'])->name('date.filter.barang_keluar');

    Route::delete("/delete_all", [LiveAction::class, 'deletedAll'])->name('deleteAll');
    Route::delete("/delete/barang_masuk", [LiveAction::class, 'deletedAllBrgMasuk'])->name('deletedAllBrgMasuk');
    Route::delete("/delete/transaksi", [LiveAction::class, 'deleteAllTransactions'])->name('deleteAllTransactions');
    Route::delete("/delete/all/stok", [LiveAction::class, 'deleteAllStok'])->name('deleteAllStok');

    // khusus untuk import file
    Route::post("/import/file", [ImportAction::class, 'importFile'])->name('import.file');
    Route::post("/import/barang_masuk", [ImportAction::class, 'importBarangMasuk'])->name('import.barangMasuk');
    Route::post("/import/stok", [ImportAction::class, 'importStokBarang'])->name('import.stok');
    Route::post("/import/transaksi", [ImportAction::class, 'importTransaksi'])->name('import.transaksi');

    // khusus untuk export file
    Route::get('/export/daftar_barang', [ExportAction::class, 'exportBarang'])->name('export.barang');
    Route::get('/export/barang_masuk', [ExportAction::class, 'exportBarangMasuk'])->name('export.barang_masuk');
    Route::get('/export/stok', [ExportAction::class, 'exportStok'])->name('export.stok');
    Route::get('/view/stok', [ExportAction::class, 'viewstok'])->name('view.stok');
    Route::get('/export/barang_keluar', [ExportAction::class, 'exportBarangKeluar'])->name('export.barang_keluar');
    Route::get('/export/transaksi', [ExportAction::class, 'exportTransaksi'])->name('export.transaksi');

    // khusus PDF export
    Route::get('/barang_keluar/pdf', [ExportAction::class, 'berangKeluarPDF'])->name('barang_keluar.pdf');
});
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
