<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use App\Models\TopProductModel;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;
use Illuminate\Support\Facades\DB;
use App\Traits\Validate\ValidateTransaksi;
use App\Traits\Handles\handlesTransaksiPenjualan;

class TransaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    use ValidateTransaksi, handlesTransaksiPenjualan;
    public function index()
    {
        $DaftarBarang = BarangModel::all();
        $transaksi = TransaksiModel::latest()->paginate(10);
        $stokBarang = StokBarangModel::all();
        return view('transaksi.index', compact('DaftarBarang', 'transaksi', 'stokBarang'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() {}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request->all());
        // validate data
        $this->ValidateTransaksi($request->all());

        $dataParse = $this->parseValue($request);

        $transaksi = $this->createTransaksiDB($dataParse, $request);

        $barang_masuk = $this->checkBarangMasuk($transaksi, $request, 'create');
        if ($transaksi->status_pembayaran === 'lunas') {
            $this->updateStok($dataParse, $request, $barang_masuk);
            $this->updateBarangKeluar($transaksi, 'create');
            $this->updateTopProduct($transaksi);
        }
        return back()->with('success', 'Transaksi Atas nama ' . ' ' . $transaksi->nama_konsumen . ' ' . ' Pembelian ' . $transaksi->nama_barang . ' - ' . $transaksi->tipe_barang . ' Berhasil Dibuat');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $transaksi = TransaksiModel::findOrFail($id);
        return response()->json(
            ['success' => 'Fetching success', 'result' => $transaksi],
            200,
            [
                'Content-Type' => 'application/json',
                'X-Content-Type-Options' => 'nosniff',
            ]
        );
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function repayment(Request $request, string $id)
    {
        // this validates that the resource
        $this->ValidateTransaksiRepayment($request->all());

        $getAllTransaksi = TransaksiModel::findOrFail($id);
        $transaksi = $this->repaymentUpdated($getAllTransaksi, $request);
        $barang_masuk = $this->checkBarangMasuk($getAllTransaksi, $request, 'repayment_updated');

        if ($transaksi->status_pembayaran == 'lunas') {
            $this->updateStokRepayment($getAllTransaksi, $request, $barang_masuk);
            $this->updateBarangKeluar($transaksi, 'update_repayment', $request);
            $this->updateTopProduct($transaksi);
        }

        return back()->with('success', 'Pelunasan' . ' ' . $transaksi->nama_konsumen . ' ' . 'Berhasil');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        // dd( $request->all());

        // validate data
        $this->ValidateTransaksi($request->all());
        $dataParse = $this->parseValue($request);
        // update data
        $this->updateTransaksiDB($dataParse, $request, $id);

        return back()->with('success', 'Perubahan Data Transaksi Berhasil');
    }

    public function takeAway(Request $request, string $id)
    {
        $transaksi = TransaksiModel::findOrFail($id);

        $transaksiNew = $this->updateTakeAway($transaksi, $request);

        $barang_masuk = $this->checkBarangMasuk($transaksi, $request, 'take_away_update');

        if ($transaksiNew->status_pembayaran == 'lunas') {
            $this->updateStokTakeAway($transaksiNew, $barang_masuk, $request);
            $this->updateBarangKeluar($transaksiNew, 'update_take_away', $request);
            $this->updateTopProduct($transaksiNew);
        }
        return back()->with('success', 'Barang' . ' ' . $transaksiNew->nama_barang . '-' . $transaksiNew->tipe_barang . ' ' . 'Berhasil Keluar');
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $transaksi = TransaksiModel::findOrFail($id);
        $transaksi->delete();
        return back()->with('success', 'Penghapusan Data Transaksi Berhasil');
    }
}
