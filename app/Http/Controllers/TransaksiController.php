<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use Illuminate\Http\Request;
use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use Illuminate\Support\Facades\DB;

class TransaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $DaftarBarang = BarangModel::all();
        // $stokBarang = StokBarangModel::all();
        $transaksi = TransaksiModel::paginate(10);
        return view('transaksi.index', compact('DaftarBarang', 'transaksi'));
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
        // validate data
        $request->validate(
            [
                'transaksi' => 'required|date',
                'kode_transaksi' => 'required|string|max:20',
                'nama_konsumen' => 'required|string|max:100',
                'nohp' => 'required|digits_between:10,13', // validasi nomor telepon
                'alamat' => 'required|string|max:255',
                'sales' => 'required|string|max:100',
                'nama_brg_transaksi' => 'required|string|max:255',
                'tipe_brg_transaksi' => 'required|string|max:100',
                'diskon' => 'nullable|integer|min:0|max:100',
                'jumlah_brg_transaksi' => 'required|integer',
                'harga_brg_transaksi' => 'required|string', // validasi string karena akan diformat ulang
                'stok' => 'required|integer|min:0',
                'status_pembayaran' => 'required|string',
                'total_pembayaran' => 'required|string',
                'pembayaran' => 'required|string',
                'selisih' => 'nullable|string',
                'dp' => 'required|string',
            ],
            [
                'transaksi.required' => 'Tanggal transaksi wajib diisi.',
                'transaksi.date' => 'Format tanggal transaksi tidak valid.',
                'kode_transaksi.required' => 'Kode transaksi wajib diisi.',
                'kode_transaksi.max' => 'Kode transaksi maksimal 20 karakter.',
                'nama_konsumen.required' => 'Nama konsumen wajib diisi.',
                'nama_konsumen.max' => 'Nama konsumen maksimal 100 karakter.',
                'nohp.required' => 'Nomor telepon wajib diisi.',
                'nohp.digits_between' => 'Nomor telepon harus terdiri dari 10 sampai 13 digit.',
                'alamat.required' => 'Alamat wajib diisi.',
                'alamat.max' => 'Alamat maksimal 255 karakter.',
                'sales.required' => 'Nama sales wajib diisi.',
                'sales.max' => 'Nama sales maksimal 100 karakter.',
                'nama_brg_transaksi.required' => 'Nama barang wajib diisi.',
                'nama_brg_transaksi.max' => 'Nama barang maksimal 255 karakter.',
                'tipe_brg_transaksi.required' => 'Tipe barang wajib diisi.',
                'tipe_brg_transaksi.max' => 'Tipe barang maksimal 100 karakter.',
                'diskon.integer' => 'Diskon harus berupa angka.',
                'diskon.min' => 'Diskon tidak boleh kurang dari 0%.',
                'diskon.max' => 'Diskon tidak boleh lebih dari 100%.',
                'jumlah_brg_transaksi.required' => 'Jumlah barang wajib diisi.',
                'jumlah_brg_transaksi.integer' => 'Jumlah barang harus berupa angka.',
                'harga_brg_transaksi.required' => 'Harga barang wajib diisi.',
                'stok.required' => 'Stok barang wajib diisi.',
                'stok.integer' => 'Stok barang harus berupa angka.',
                'stok.min' => 'Stok barang tidak boleh negatif.',
                'status_pembayaran.required' => 'Status pembayaran wajib diisi.',
                'total_pembayaran.required' => 'Total pembayaran wajib diisi.',
                'pembayaran.required' => 'Jumlah pembayaran wajib diisi.',
                'dp.required' => 'Dana pertama wajib diisi.',

            ]
        );


        $jumlah_barang = (int) $request->input('jumlah_brg_transaksi');
        $harga_barang = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('harga_brg_transaksi'));
        $total_pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('total_pembayaran'));
        $selisih_pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('selisih'));
        $pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('pembayaran'));
        $dana_pertama = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('dp'));

        // save data
        $transaksi = new TransaksiModel();
        $transaksi->id_barang = $request->input('id_barang');
        $transaksi->id_stok = $request->input('id_stok');
        $transaksi->tgl_transaksi = $request->input('transaksi');
        $transaksi->kode_transaksi = $request->input('kode_transaksi');
        $transaksi->nama_konsumen = $request->input('nama_konsumen');
        $transaksi->no_handphone = $request->input('nohp');
        $transaksi->alamat = $request->input('alamat');
        $transaksi->nama_sales = $request->input('sales');
        $transaksi->nama_barang = $request->input('nama_brg_transaksi');
        $transaksi->tipe_barang = $request->input('tipe_brg_transaksi');
        $transaksi->diskon = (int) $request->input('diskon');
        $transaksi->jumlah_barang = $jumlah_barang;
        $transaksi->harga_barang = $harga_barang;
        $transaksi->status_pembayaran = $request->input('status_pembayaran');
        $transaksi->total_pembayaran = $total_pembayaran;
        $transaksi->pembayaran = $pembayaran;
        $transaksi->selisih_pembayaran = $selisih_pembayaran;
        $transaksi->dana_pertama = $dana_pertama;
        $transaksi->save();



        $stokSebelumnya = StokBarangModel::where('id_barang', $request->input('id_barang'))
            ->orderBy('created_at', 'desc')
            ->first();
        $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

        $stokBarang = new StokBarangModel();
        $stokBarang->id_brg_masuk = null;
        $stokBarang->id_barang = $request->input('id_barang');
        $stokBarang->tanggal = $request->input('transaksi');
        $stokBarang->nama_barang = $request->input('nama_brg_transaksi');
        $stokBarang->tipe_barang = $request->input('tipe_brg_transaksi');
        $stokBarang->stok_awal = $stokAwal;
        $stokBarang->barang_masuk = 0;
        $stokBarang->barang_keluar = $jumlah_barang;
        $stokBarang->stok_akhir = $stokAwal - $jumlah_barang;
        $stokBarang->keterangan = 'barang terjual';
        $stokBarang->save();


        return back()->with('success', 'Transaksi Berhasil Dibuat');
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
            ],
            JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK
        );
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        // validate data
        $request->validate(
            [
                'transaksi' => 'required|date',
                'kode_transaksi' => 'required|string|max:20',
                'nama_konsumen' => 'required|string|max:100',
                'nohp' => 'required|digits_between:10,13', // validasi nomor telepon
                'alamat' => 'required|string|max:255',
                'sales' => 'required|string|max:100',
                'nama_brg_transaksi' => 'required|string|max:255',
                'tipe_brg_transaksi' => 'required|string|max:100',
                'diskon' => 'nullable|integer|min:0|max:100',
                'jumlah_brg_transaksi' => 'required|integer',
                'harga_brg_transaksi' => 'required|string', // validasi string karena akan diformat ulang
                'stok' => 'required|integer|min:0',
                'status_pembayaran' => 'required|string',
                'total_pembayaran' => 'required|string',
                'pembayaran' => 'required|string',
                'selisih' => 'nullable|string',
                'dp' => 'required|string',
            ],
            [
                'transaksi.required' => 'Tanggal transaksi wajib diisi.',
                'transaksi.date' => 'Format tanggal transaksi tidak valid.',
                'kode_transaksi.required' => 'Kode transaksi wajib diisi.',
                'kode_transaksi.max' => 'Kode transaksi maksimal 20 karakter.',
                'nama_konsumen.required' => 'Nama konsumen wajib diisi.',
                'nama_konsumen.max' => 'Nama konsumen maksimal 100 karakter.',
                'nohp.required' => 'Nomor telepon wajib diisi.',
                'nohp.digits_between' => 'Nomor telepon harus terdiri dari 10 sampai 13 digit.',
                'alamat.required' => 'Alamat wajib diisi.',
                'alamat.max' => 'Alamat maksimal 255 karakter.',
                'sales.required' => 'Nama sales wajib diisi.',
                'sales.max' => 'Nama sales maksimal 100 karakter.',
                'nama_brg_transaksi.required' => 'Nama barang wajib diisi.',
                'nama_brg_transaksi.max' => 'Nama barang maksimal 255 karakter.',
                'tipe_brg_transaksi.required' => 'Tipe barang wajib diisi.',
                'tipe_brg_transaksi.max' => 'Tipe barang maksimal 100 karakter.',
                'diskon.integer' => 'Diskon harus berupa angka.',
                'diskon.min' => 'Diskon tidak boleh kurang dari 0%.',
                'diskon.max' => 'Diskon tidak boleh lebih dari 100%.',
                'jumlah_brg_transaksi.required' => 'Jumlah barang wajib diisi.',
                'jumlah_brg_transaksi.integer' => 'Jumlah barang harus berupa angka.',
                'harga_brg_transaksi.required' => 'Harga barang wajib diisi.',
                'stok.required' => 'Stok barang wajib diisi.',
                'stok.integer' => 'Stok barang harus berupa angka.',
                'stok.min' => 'Stok barang tidak boleh negatif.',
                'status_pembayaran.required' => 'Status pembayaran wajib diisi.',
                'total_pembayaran.required' => 'Total pembayaran wajib diisi.',
                'pembayaran.required' => 'Jumlah pembayaran wajib diisi.',
                'dp.required' => 'Dana pertama wajib diisi.',
            ]
        );

        $jumlah_barang = (int) $request->input('jumlah_brg_transaksi');
        $harga_barang = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('harga_brg_transaksi'));
        $total_pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('total_pembayaran'));
        $selisih_pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('selisih'));
        $pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('pembayaran'));
        $dana_pertama = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('dp'));


        // update data
        $transaksi = TransaksiModel::findOrFail($id);
        $transaksi->id_barang = $request->input('id_barang');
        $transaksi->id_stok = $request->input('id_stok');
        $transaksi->tgl_transaksi = $request->input('transaksi');
        $transaksi->kode_transaksi = $request->input('kode_transaksi');
        $transaksi->nama_konsumen = $request->input('nama_konsumen');
        $transaksi->no_handphone = $request->input('nohp');
        $transaksi->alamat = $request->input('alamat');
        $transaksi->nama_sales = $request->input('sales');
        $transaksi->nama_barang = $request->input('nama_brg_transaksi');
        $transaksi->tipe_barang = $request->input('tipe_brg_transaksi');
        $transaksi->diskon = (int) $request->input('diskon');
        $transaksi->jumlah_barang = $jumlah_barang;
        $transaksi->harga_barang = $harga_barang;
        $transaksi->status_pembayaran = $request->input('status_pembayaran');
        $transaksi->total_pembayaran = $total_pembayaran;
        $transaksi->pembayaran = $pembayaran;
        $transaksi->selisih_pembayaran = $selisih_pembayaran;
        $transaksi->dana_pertama = $dana_pertama;

        $transaksi->update();

        // dd($transaksi->jumlah_barang);
        $stokBarang = StokBarangModel::where('id_stok', $request->input('id_stok'))
            ->where('id_barang', $request->input('id_barang'))
            ->whereDate('created_at', 'desc')
            ->first();
        if ($stokBarang) {
            $stokBarang->barang_keluar = $transaksi->jumlah_barang;
            $stokBarang->stok_akhir = $stokBarang->stok_awal - $stokBarang->barang_keluar;
        } else {
            $stokSebelumnya = StokBarangModel::where('id_barang', $request->input('id_barang'))
                ->orderBy('created_at', 'desc')
                ->first();
            $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

            $stokBarang = new StokBarangModel();
            $stokBarang->id_brg_masuk = null;
            $stokBarang->id_barang = $request->input('id_barang');
            $stokBarang->tanggal = $request->input('transaksi');
            $stokBarang->nama_barang = $request->input('nama_brg_transaksi');
            $stokBarang->tipe_barang = $request->input('tipe_brg_transaksi');
            $stokBarang->stok_awal = $stokAwal;
            $stokBarang->barang_masuk = 0;
            $stokBarang->barang_keluar = $transaksi->jumlah_barang;
            $stokBarang->stok_akhir = $stokAwal - $transaksi->jumlah_barang;
            $stokBarang->keterangan = 'barang terjual';
        }
        $stokBarang->save();

        return back()->with('success', 'Perubahan Data Transaksi Berhasil');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // dd($id);
        $transaksi = TransaksiModel::findOrFail($id);
        $transaksi->delete();
        return back()->with('success', 'Penghapusan Data Transaksi Berhasil');
    }
}
