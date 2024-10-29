<?php

use App\Http\Controllers\BarangController;
use App\Http\Controllers\BarangMasuk;
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
    Route::controller(StokBarangController::class)->group(function () {
        Route::get('/stok', 'index')->name('stok.index');
        Route::post('/stok/store', 'store')->name('stok.store');
        Route::put('/stok/update/{id}', 'update')->name('stok.update');
        Route::get('/stok/detail/{id}/{date}', 'show')->name('stok.show');
        Route::delete('/stok/delete/{id}', 'destroy')->name('stok.delete');
    });
    Route::controller(TransaksiController::class)->group(function () {
        Route::get('/transaksi', 'index')->name('transaksi.index');
        Route::post('/transaksi/store', 'store')->name('transaksi.store');
        Route::put('/transaksi/update/{id}', 'update')->name('transaksi.update');
        Route::get('/transaksi/detail/{id}', 'show')->name('transaksi.show');
        Route::delete('/transaksi/delete/{id}', 'destroy')->name('transaksi.delete');
    });
    Route::controller(UserController::class)->group(function () {
        Route::put('/profile/update/{id}', 'update')->name('profile.update');
        Route::get('/profile/show/{id}', 'show')->name('profile.show');
    });
    // khusus untuk live action
    Route::get("/item/search", [LiveAction::class, 'searchItem'])->name('search');
    Route::get("/barang_masuk/search", [LiveAction::class, 'searchBrgMasuk'])->name('barang_masuk');
    Route::get("/item/offset", [LiveAction::class, 'filterData'])->name('offset');
    Route::get("/barang_masuk/filter", [LiveAction::class, 'filterBrgMasuk'])->name('barang_masuk.filter');
    Route::delete("/delete_all", [LiveAction::class, 'deletedAll'])->name('deleteAll');
    Route::delete("/delete/barang_masuk", [LiveAction::class, 'deletedAllBrgMasuk'])->name('deletedAllBrgMasuk');
    Route::delete("/delete/transaksi", [LiveAction::class, 'deleteAllTransactions'])->name('deleteAllTransactions');
    Route::delete("/delete/all/stok", [LiveAction::class, 'deleteAllStok'])->name('deleteAllStok');

    // khusus untuk import file dan export file
    Route::post("/import/file", [ImportAction::class, 'importFile'])->name('import.file');
    Route::post("/import/barang_masuk", [ImportAction::class, 'importBarangMasuk'])->name('import.barangMasuk');
});
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
