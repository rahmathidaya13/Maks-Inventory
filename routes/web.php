<?php

use App\Http\Controllers\BarangController;
use App\Http\Controllers\ImportAction;
use App\Http\Controllers\LiveAction;
use App\Http\Controllers\LiveSearch;
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
    return view('welcome');
});
Route::get('/dashboard', function () {
    return view('home.index');
})->name('dashboard');
Route::controller(BarangController::class)->group(function(){
    Route::get('/list-item', 'index')->name('list.index');
    Route::post('/list-item/store', 'store')->name('list.store');
    Route::put('/list-item/update/{id}', 'update')->name('list.update');
    Route::get('/list-item/show/{id}', 'show')->name('list.show');
    Route::delete('/list-item/delete/{id}', 'destroy')->name('list.delete');
});
Route::get("/item/search", [LiveAction::class, 'searchItem'])->name('search');
Route::get("/item/offset", [LiveAction::class, 'filterData'])->name('offset');
Route::delete("/delete_all", [LiveAction::class, 'deletedAll'])->name('deleteAll');

Route::post("/import/file", [ImportAction::class, 'importFile'])->name( 'import.file');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
