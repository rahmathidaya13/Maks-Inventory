<?php

namespace App\Http\Controllers;

use App\Models\BarangKeluarModel;
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
                'status_transaksi' => 'required|string',
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
                'status_transaksi.required' => 'Transkasi belum dipilih',

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
        $transaksi->status_transaksi = $request->input('status_transaksi');
        $transaksi->save();


        if ($transaksi->status_pembayaran == 'lunas') {
            $stokBarang = StokBarangModel::where('id_barang', $request->input('id_barang'))
                ->whereDate('tanggal', $request->input('transaksi'))
                ->first();
            if ($stokBarang) {
                $stokBarang->barang_keluar += $jumlah_barang;
                $stokBarang->stok_akhir -= $jumlah_barang;
                $stokBarang->save();
            } else {
                $stokSebelumnya = StokBarangModel::where('id_barang', $request->input('id_barang'))
                    ->orderBy('tanggal', 'desc')
                    ->first();

                // cek kondisi barang masuk jika ada ditangall yang sama disimpan jika tidak buat 0
                $barangMasuk = ($stokSebelumnya && $stokSebelumnya->tanggal === $request->input('transaksi'))
                    ?
                    $stokSebelumnya->barang_masuk
                    : 0;

                $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

                $stokBarang = new StokBarangModel();
                $stokBarang->id_brg_masuk = null;
                $stokBarang->id_barang = $request->input('id_barang');
                $stokBarang->tanggal = $request->input('transaksi');
                $stokBarang->nama_barang = $request->input('nama_brg_transaksi');
                $stokBarang->tipe_barang = $request->input('tipe_brg_transaksi');
                $stokBarang->stok_awal = $stokAwal;
                $stokBarang->barang_masuk =  $barangMasuk;
                $stokBarang->barang_keluar = $jumlah_barang;
                $stokBarang->stok_akhir = $stokAwal - $jumlah_barang;
                $stokBarang->keterangan = 'barang terjual';
                $stokBarang->save();
            }
            $barangKeluar = new BarangKeluarModel();
            $barangKeluar->id_transaksi = $transaksi->id_transaksi;
            $barangKeluar->id_barang = $request->input('id_barang');
            $barangKeluar->tanggal = $request->input('transaksi');
            $barangKeluar->kode_transaksi = $request->input('kode_transaksi');
            $barangKeluar->nama_konsumen = $request->input('nama_konsumen');
            $barangKeluar->no_handphone = $request->input('nohp');
            $barangKeluar->alamat = $request->input('alamat');
            $barangKeluar->nama_barang = $request->input('nama_brg_transaksi');
            $barangKeluar->tipe_barang = $request->input('tipe_brg_transaksi');
            $barangKeluar->jumlah_barang = $jumlah_barang;
            $barangKeluar->save();
        }

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
    public function repayment(Request $request, string $id)
    {

        $harga_barang = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('hb'));
        $dana_pertama = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('dana_pertama'));
        $selisih_pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('selisih_pembayaran_'));
        $pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('pembayaran_pelunasan'));


        // $transaksi = TransaksiModel::where('id_transaksi', $id)
        //     ->orderBy('tgl_transaksi', 'desc')
        //     ->first();
        $getAllTransaksi = TransaksiModel::findOrFail($id);

        $old_jumlah_barang = $getAllTransaksi->jumlah_barang;

        $transaksi = new TransaksiModel();
        $transaksi->id_barang = $getAllTransaksi->id_barang;
        $transaksi->id_stok = $getAllTransaksi->id_stok;
        $transaksi->id_stok = $getAllTransaksi->id_stok;
        $transaksi->nama_barang = $getAllTransaksi->nama_barang;
        $transaksi->nama_sales = $getAllTransaksi->nama_sales;
        $transaksi->tipe_barang = $getAllTransaksi->tipe_barang;
        $transaksi->jumlah_barang = $getAllTransaksi->jumlah_barang;
        $transaksi->diskon = $getAllTransaksi->diskon;
        $transaksi->total_pembayaran = $getAllTransaksi->total_pembayaran;

        $transaksi->tgl_transaksi = $request->input('tgl_pelunasan');
        $transaksi->kode_transaksi = $request->input('kode_transaksi_pelunasan');
        $transaksi->nama_konsumen = $request->input('konsumen');
        $transaksi->no_handphone = $request->input('hp');
        $transaksi->alamat = $request->input('alamat_konsumen');
        $transaksi->status_transaksi = $request->input('transaksi');
        $transaksi->status_pembayaran = $request->input('stts_pembayaran');
        $transaksi->harga_barang = $harga_barang;
        $transaksi->dana_pertama = $dana_pertama;
        $transaksi->selisih_pembayaran = $selisih_pembayaran;
        $transaksi->pembayaran = $pembayaran;
        $transaksi->save();

        if ($transaksi->status_pembayaran == 'lunas') {
            $stokBarang = StokBarangModel::where('id_barang', $transaksi->id_barang)
                ->whereDate('tanggal', $transaksi->tgl_transaksi)
                ->first();
            if ($stokBarang) {
                $stokBarang->barang_keluar -= $old_jumlah_barang;
                $stokBarang->barang_keluar += $getAllTransaksi->jumlah_barang;
                $stokBarang->stok_akhir = $stokBarang->stok_awal - $stokBarang->barang_keluar;
                $stokBarang->save();
            } else {
                $stokSebelumnya = StokBarangModel::where('id_barang', $transaksi->id_barang)
                    ->orderBy('tanggal', 'desc')
                    ->first();

                $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

                // cek kondisi barang masuk jika ada ditangall yang sama disimpan jika tidak buat 0
                $barangMasuk = ($stokSebelumnya && $stokSebelumnya->tanggal === $transaksi->tgl_transaksi)
                    ?
                    $stokSebelumnya->barang_masuk
                    : 0;

                $stokBarang = new StokBarangModel();
                $stokBarang->id_brg_masuk = null;
                $stokBarang->id_barang = $transaksi->id_barang;
                $stokBarang->tanggal = $transaksi->tgl_transaksi;
                $stokBarang->nama_barang = $transaksi->nama_barang;
                $stokBarang->tipe_barang = $transaksi->tipe_barang;
                $stokBarang->stok_awal = $stokAwal;
                $stokBarang->barang_masuk = $barangMasuk;
                $stokBarang->barang_keluar = $getAllTransaksi->jumlah_barang;
                $stokBarang->stok_akhir = $stokAwal - $transaksi->jumlah_barang;
                $stokBarang->keterangan = 'barang terjual';
                $stokBarang->save();
            }
            // $barangKeluar = BarangKeluarModel::where('id_transaksi', $transaksi->id_transaksi)
            //     ->whereDate('tanggal', $transaksi->tanggal)
            //     ->first();
            $barangKeluar = new BarangKeluarModel();
            $barangKeluar->id_transaksi = $transaksi->id_transaksi;
            $barangKeluar->id_barang = $transaksi->id_barang;
            $barangKeluar->tanggal = $transaksi->tgl_transaksi;
            $barangKeluar->kode_transaksi = $transaksi->kode_transaksi;
            $barangKeluar->nama_konsumen = $transaksi->nama_konsumen;
            $barangKeluar->no_handphone = $transaksi->no_handphone;
            $barangKeluar->alamat = $transaksi->alamat;
            $barangKeluar->nama_barang = $transaksi->nama_barang;
            $barangKeluar->tipe_barang = $transaksi->tipe_barang;
            $barangKeluar->jumlah_barang = $transaksi->jumlah_barang;
            $barangKeluar->save();
        }

        return back()->with('success', 'Pelunasan Berhasil Dibuat');
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
        $transaksi->status_transaksi = $request->input('status_transaksi');
        $transaksi->update();


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
