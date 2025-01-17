<?php

namespace App\Traits\Handles;

use App\Models\TransaksiModel;
use App\Models\StokBarangModel;
use App\Models\TopProductModel;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;
use Illuminate\Support\Facades\Request;

trait handlesTransaksiPenjualan
{
    public function parseValue($request)
    {
        return [
            'jumlah_barang' => (int) $request->input('jumlah_brg_transaksi'),
            'harga_barang' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('harga_brg_transaksi')),
            'total_pembayaran' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('total_pembayaran')),
            'selisih_pembayaran' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('selisih')),
            'pembayaran' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('pembayaran')),
            'dana_pertama' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('dp')),
        ];
    }
    public function createTransaksiDB($request)
    {
        $dataParse = [
            'jumlah_barang' => (int) $request->input('jumlah_brg_transaksi'),
            'harga_barang' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('harga_brg_transaksi')),
            'total_pembayaran' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('total_pembayaran')),
            'selisih_pembayaran' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('selisih')),
            'pembayaran' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('pembayaran')),
            'dana_pertama' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('dp')),
        ];
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
        $transaksi->kode_barang = $request->input('kode_barang');
        $transaksi->nama_barang = $request->input('nama_brg_transaksi');
        $transaksi->tipe_barang = $request->input('tipe_brg_transaksi');
        $transaksi->status_barang = $request->input('stts_barang');
        $transaksi->diskon = (int) $request->input('diskon');
        $transaksi->jumlah_barang = $dataParse['jumlah_barang'];
        $transaksi->harga_barang = $dataParse['harga_barang'];
        $transaksi->posisi = $request->input('posisi_brg_transaksi');
        $transaksi->status_pembayaran = $request->input('status_pembayaran');
        $transaksi->total_pembayaran = $dataParse['total_pembayaran'];
        $transaksi->pembayaran = $dataParse['pembayaran'];
        $transaksi->selisih_pembayaran = $dataParse['selisih_pembayaran'];
        $transaksi->dana_pertama = $dataParse['dana_pertama'];
        $transaksi->status_transaksi = $request->input('status_transaksi');
        $transaksi->save();
        return $transaksi;
    }
    public function updateTransaksiDB($request, $id)
    {
        $dataParse = [
            'jumlah_barang' => (int) $request->input('jumlah_brg_transaksi'),
            'harga_barang' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('harga_brg_transaksi')),
            'total_pembayaran' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('total_pembayaran')),
            'selisih_pembayaran' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('selisih')),
            'pembayaran' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('pembayaran')),
            'dana_pertama' => (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('dp')),
        ];
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
        $transaksi->kode_barang = $request->input('kode_barang');
        $transaksi->nama_barang = $request->input('nama_brg_transaksi');
        $transaksi->tipe_barang = $request->input('tipe_brg_transaksi');
        $transaksi->status_barang = $request->input('stts_barang');
        $transaksi->diskon = (int) $request->input('diskon');
        $transaksi->jumlah_barang = $dataParse['jumlah_barang'];
        $transaksi->harga_barang = $dataParse['harga_barang'];
        $transaksi->posisi = $request->input('posisi_brg_transaksi');
        $transaksi->status_pembayaran = $request->input('status_pembayaran');
        $transaksi->total_pembayaran = $dataParse['total_pembayaran'];
        $transaksi->pembayaran = $dataParse['pembayaran'];
        $transaksi->selisih_pembayaran = $dataParse['selisih_pembayaran'];
        $transaksi->dana_pertama = $dataParse['dana_pertama'];
        $transaksi->status_transaksi = $request->input('status_transaksi');
        $transaksi->update();
        return $transaksi;
    }
    public function updateTakeAway($transaksi, $request)
    {
        $transaksiNew = new TransaksiModel();
        $transaksiNew->id_barang = $transaksi->id_barang;
        $transaksiNew->id_stok = $transaksi->id_stok;
        $transaksiNew->kode_barang = $transaksi->kode_barang;
        $transaksiNew->nama_barang = $transaksi->nama_barang;
        $transaksiNew->nama_sales = $transaksi->nama_sales;
        $transaksiNew->tipe_barang = $transaksi->tipe_barang;
        $transaksiNew->status_barang = $transaksi->status_barang;
        $transaksiNew->jumlah_barang = $transaksi->jumlah_barang;
        $transaksiNew->posisi = $transaksi->posisi;
        $transaksiNew->diskon = $transaksi->diskon;
        $transaksiNew->total_pembayaran = $transaksi->total_pembayaran;
        $transaksiNew->status_transaksi = $transaksi->status_transaksi;
        $transaksiNew->status_pembayaran = 'lunas';
        $transaksiNew->harga_barang = $transaksi->harga_barang;
        $transaksiNew->dana_pertama = $transaksi->dana_pertama;
        $transaksiNew->selisih_pembayaran = $transaksi->selisih_pembayaran;
        $transaksiNew->pembayaran = $transaksi->pembayaran;

        $transaksiNew->tgl_transaksi = $request->input('tanggal_ambil');
        $transaksiNew->kode_transaksi = $request->input('kode_transaksi_ambil_brg');
        $transaksiNew->nama_konsumen = $request->input('konsumen_ambil_barang');
        $transaksiNew->no_handphone = $request->input('hp_ambil_barang');
        $transaksiNew->alamat = $request->input('alamat_ambil_barang');

        $transaksiNew->save();
        return $transaksiNew;
    }

    public function updatedSparepart($request, $transaksiUp)
    {

        $harga_barang = (int) str_replace(['Rp', "\u{A0}", '.'], '', $request->input('harga_cs_sparepart'));



        $transaksi = new TransaksiModel();

        $transaksi->id_barang = $transaksiUp->id_barang;
        $transaksi->id_stok = $transaksiUp->id_stok;
        $transaksi->nama_sales = $transaksiUp->nama_sales;
        $transaksi->posisi = $transaksiUp->posisi;
        $transaksi->diskon = $transaksiUp->diskon;
        $transaksi->total_pembayaran = $transaksiUp->total_pembayaran;
        $transaksi->status_transaksi = $transaksiUp->status_transaksi;
        $transaksi->dana_pertama = $transaksiUp->dana_pertama;
        $transaksi->selisih_pembayaran = $transaksiUp->selisih_pembayaran;
        $transaksi->pembayaran = $transaksiUp->pembayaran;
        $transaksi->status_barang = $transaksiUp->status_barang;

        $transaksi->tgl_transaksi = $request->input('tanggal_sparepart');
        $transaksi->kode_transaksi = $request->input('kode_transaksi_sparepart');
        $transaksi->nama_konsumen = $request->input('nama_cs_sparepart');
        $transaksi->no_handphone = $request->input('nohp_cs_sparepart');
        $transaksi->alamat = $request->input('alamat_cs_sparepart');
        $transaksi->kode_barang = $request->input('kode_cs_sparepart');
        $transaksi->nama_barang = $request->input('barang_cs_sparepart');
        $transaksi->tipe_barang = $request->input('tipe_cs_sparepart');
        $transaksi->jumlah_barang = $request->input('jumlah_cs_sparepart');
        $transaksi->harga_barang = $harga_barang;
        $transaksi->status_pembayaran = $request->input('pembayaran_cs_sparepart');
        $transaksi->save();
        return $transaksi;
    }
    public function repaymentUpdated($transaksi, $request)
    {
        $harga_barang = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('hb'));
        $dana_pertama = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('dana_pertama'));
        $selisih_pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('selisih_pembayaran_'));
        $pembayaran = str_replace(['Rp', "\u{A0}", '.'], '', $request->input('pembayaran_pelunasan'));

        $transaksiNew = new TransaksiModel();
        $transaksiNew->id_barang = $transaksi->id_barang;
        $transaksiNew->id_stok = $transaksi->id_stok;
        $transaksiNew->kode_barang = $transaksi->kode_barang;
        $transaksiNew->nama_barang = $transaksi->nama_barang;
        $transaksiNew->nama_sales = $transaksi->nama_sales;
        $transaksiNew->tipe_barang = $transaksi->tipe_barang;
        $transaksiNew->status_barang = $transaksi->status_barang;
        $transaksiNew->jumlah_barang = $transaksi->jumlah_barang;
        $transaksiNew->posisi = $transaksi->posisi;
        $transaksiNew->diskon = $transaksi->diskon;
        $transaksiNew->total_pembayaran = $transaksi->total_pembayaran;

        $transaksiNew->tgl_transaksi = $request->input('tgl_pelunasan');
        $transaksiNew->kode_transaksi = $request->input('kode_transaksi_pelunasan');
        $transaksiNew->nama_konsumen = $request->input('konsumen');
        $transaksiNew->no_handphone = $request->input('hp');
        $transaksiNew->alamat = $request->input('alamat_konsumen');
        $transaksiNew->status_transaksi = $request->input('transaksi');
        $transaksiNew->status_pembayaran = $request->input('stts_pembayaran');
        $transaksiNew->harga_barang = $harga_barang;
        $transaksiNew->dana_pertama = $dana_pertama;
        $transaksiNew->selisih_pembayaran = $selisih_pembayaran;
        $transaksiNew->pembayaran = $pembayaran;
        $transaksiNew->save();
        return $transaksiNew;
    }
    public function updateStok($request, $barang_masuk)
    {
        $dataParse = $this->parseValue($request);
        // dd($dataParse);
        $stokBarang = StokBarangModel::where('id_barang', $request->input('id_barang'))
            ->where('nama_barang', $request->input('nama_brg_transaksi'))
            ->where('tipe_barang', $request->input('tipe_brg_transaksi'))
            ->where('posisi', $request->input('posisi_brg_transaksi'))
            ->whereDate('tanggal', $request->input('transaksi'))
            ->first();

        if ($stokBarang) {
            // Cari stok berdasarkan tanggal pelunasan, bukan tanggal transaksi sebelumnya
            $stokBarang->barang_masuk = $barang_masuk ?? 0;
            $stokBarang->barang_keluar += $dataParse['jumlah_barang'];
            $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            $stokBarang->keterangan = 'stok';
            $stokBarang->save();
        } else {
            // Ambil stok sebelumnya (sebelum pelunasan)
            $stokSebelumnya = StokBarangModel::where('id_barang', $request->input('id_barang'))
                ->where('nama_barang', $request->input('nama_brg_transaksi'))
                ->where('tipe_barang', $request->input('tipe_brg_transaksi'))
                ->where('posisi', $request->input('posisi_brg_transaksi'))
                ->orderBy('tanggal', 'desc')
                ->first();
            $stok_awal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

            // Buat record stok baru dengan tanggal pelunasan
            $stokBarangNew = new StokBarangModel();
            $stokBarangNew->id_barang = $request->input('id_barang');
            $stokBarangNew->tanggal = $request->input('transaksi');
            $stokBarangNew->nama_barang = $request->input('nama_brg_transaksi');
            $stokBarangNew->tipe_barang = $request->input('tipe_brg_transaksi');
            $stokBarangNew->barang_masuk =  $barang_masuk ?? 0;
            $stokBarangNew->barang_keluar = $dataParse['jumlah_barang'];
            $stokBarangNew->stok_awal = $stok_awal;
            $stokBarangNew->stok_akhir = ($stokBarangNew->stok_awal + $stokBarangNew->barang_masuk) - $stokBarangNew->barang_keluar;
            $stokBarangNew->posisi = $request->input('posisi_brg_transaksi');
            $stokBarangNew->keterangan = 'stok';
            $stokBarangNew->save();
        }
    }

    public function updateStokTakeAway($transaksi, $barang_masuk, $request)
    {
        $stokBarang = StokBarangModel::where('id_barang', $transaksi->id_barang)
            ->where('nama_barang', $transaksi->nama_barang)
            ->where('tipe_barang', $transaksi->tipe_barang)
            ->where('posisi', $transaksi->posisi)
            ->whereDate('tanggal', $request->input('tanggal_ambil'))
            ->first();
        if ($stokBarang) {
            $stokBarang->barang_masuk = $barang_masuk ?? 0;
            $stokBarang->barang_keluar += $transaksi->jumlah_barang;
            $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            $stokBarang->save();
        } else {
            // Ambil stok sebelumnya (sebelum pelunasan)
            $stokSebelumnya = StokBarangModel::where('id_barang', $transaksi->id_barang)
                ->where('nama_barang', $transaksi->nama_barang)
                ->where('tipe_barang', $transaksi->tipe_barang)
                ->where('posisi', $transaksi->posisi)
                ->orderBy('tanggal', 'desc')  // Ambil stok terakhir berdasarkan tanggal
                ->first();

            $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

            $stokBarang = new StokBarangModel();
            $stokBarang->id_barang = $transaksi->id_barang;
            $stokBarang->tanggal = $request->input('tanggal_ambil');
            $stokBarang->nama_barang = $transaksi->nama_barang;
            $stokBarang->tipe_barang = $transaksi->tipe_barang;
            $stokBarang->stok_awal = $stokAwal;
            $stokBarang->barang_masuk = $barang_masuk ?? 0;
            $stokBarang->barang_keluar = $transaksi->jumlah_barang;
            $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            $stokBarang->posisi = $transaksi->posisi;
            $stokBarang->keterangan = 'stok';
            $stokBarang->save();
        }
    }

    public function updateStokRepayment($transaksi, $request, $barang_masuk)
    {
        // Cari stok berdasarkan tanggal pelunasan, bukan tanggal transaksi sebelumnya
        $stokBarang = StokBarangModel::where('id_barang', $transaksi->id_barang)
            ->where('nama_barang', $transaksi->nama_barang)
            ->where('tipe_barang', $transaksi->tipe_barang)
            ->where('posisi', $transaksi->posisi)
            ->whereDate('tanggal', $request->input('tgl_pelunasan'))  // Ubah jadi tgl_pelunasan
            ->first();
        if ($stokBarang) {
            $stokBarang->barang_masuk = $barang_masuk ?? 0;
            $stokBarang->barang_keluar += $transaksi->jumlah_barang;
            $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            $stokBarang->save();
        } else {
            // Ambil stok sebelumnya (sebelum pelunasan)
            $stokSebelumnya = StokBarangModel::where('id_barang', $transaksi->id_barang)
                ->where('nama_barang', $transaksi->nama_barang)
                ->where('tipe_barang', $transaksi->tipe_barang)
                ->where('posisi', $transaksi->posisi)
                ->orderBy('tanggal', 'desc')  // Ambil stok terakhir berdasarkan tanggal
                ->first();

            $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;
            $stokBarang = new StokBarangModel();
            $stokBarang->id_barang = $transaksi->id_barang;
            $stokBarang->tanggal = $request->input('tgl_pelunasan');
            $stokBarang->nama_barang = $transaksi->nama_barang;
            $stokBarang->tipe_barang = $transaksi->tipe_barang;
            $stokBarang->stok_awal = $stokAwal;
            $stokBarang->barang_masuk = $barang_masuk ?? 0;
            $stokBarang->barang_keluar = $transaksi->jumlah_barang;
            $stokBarang->stok_akhir = ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
            $stokBarang->posisi = $transaksi->posisi;
            $stokBarang->keterangan = 'stok';
            $stokBarang->save();
        }
    }
    public function updateBarangKeluar($transaksi, $operations,  $request = null)
    {
        if ($operations === 'create') {
            $tanggal = $transaksi->tgl_transaksi;
        } else if ($operations === 'update_take_away') {
            $tanggal = $request->input('tanggal_ambil');
        } else if ($operations === 'update_repayment') {
            $tanggal = $transaksi->tgl_transaksi;
        } elseif ($operations === 'update_sparepart') {
            $tanggal = $request->input('tanggal_sparepart');
        }
        // Update stok barang di barang_keluar
        $barangKeluar = $this->checkBarangKeluar($transaksi);
        if ($barangKeluar) {
            $barangKeluar->jumlah_barang += $transaksi->jumlah_barang;
            $barangKeluar->save();
        } else {
            $barangKeluar = new BarangKeluarModel();
            $barangKeluar->id_transaksi = $transaksi->id_transaksi;
            $barangKeluar->id_barang = $transaksi->id_barang;
            $barangKeluar->tanggal = $tanggal;
            $barangKeluar->kode_transaksi = $transaksi->kode_transaksi;
            $barangKeluar->nama_konsumen = $transaksi->nama_konsumen;
            $barangKeluar->no_handphone = $transaksi->no_handphone;
            $barangKeluar->alamat = $transaksi->alamat;
            $barangKeluar->kode_barang = $transaksi->kode_barang;
            $barangKeluar->nama_barang = $transaksi->nama_barang;
            $barangKeluar->tipe_barang = $transaksi->tipe_barang;
            $barangKeluar->jumlah_barang = $transaksi->jumlah_barang;
            $barangKeluar->posisi = $transaksi->posisi;
            $barangKeluar->save();
        }
    }

    public function updateTopProduct($transaksi)
    {
        $topProduct = $this->checkTopProduct($transaksi);
        if ($topProduct) {
            $topProduct->total_barang += $transaksi->jumlah_barang;
            $topProduct->save();
        } else {
            $topProducts = new TopProductModel();
            $topProducts->id_barang = $transaksi->id_barang;
            $topProducts->tanggal = $transaksi->tgl_transaksi;
            $topProducts->kode_barang = $transaksi->kode_barang;
            $topProducts->nama_barang = $transaksi->nama_barang;
            $topProducts->tipe_barang = $transaksi->tipe_barang;
            $topProducts->total_barang = $transaksi->jumlah_barang;
            $topProducts->save();
        }
    }

    public function checkBarangKeluar($transaksi)
    {
        return BarangKeluarModel::where('id_barang', $transaksi->id_barang)
            ->where('nama_konsumen', $transaksi->nama_konsumen)
            ->where('nama_barang', $transaksi->nama_barang)
            ->where('tipe_barang', $transaksi->tipe_barang)
            ->where('posisi', $transaksi->posisi)
            ->whereDate('tanggal', $transaksi->tgl_transaksi)
            ->first();
    }
    public function checkBarangMasuk($transaksi, $request, $operation)
    {
        if ($operation === 'take_away_update') {
            return BarangMasukModel::where('id_barang', $transaksi->id_barang)
                ->where('nama_barang', $transaksi->nama_barang)
                ->where('tipe_barang', $transaksi->tipe_barang)
                ->where('posisi', $transaksi->posisi)
                ->where('tgl_brg_masuk', $request->input('tanggal_ambil'))
                ->sum('jumlah_barang');
        } else if ($operation === 'repayment_updated') {
            return BarangMasukModel::where('id_barang', $transaksi->id_barang)
                ->where('nama_barang', $transaksi->nama_barang)
                ->where('tipe_barang', $transaksi->tipe_barang)
                ->where('posisi', $transaksi->posisi)
                ->where('tgl_brg_masuk', $request->input('tgl_pelunasan'))
                ->sum('jumlah_barang');
        } else if ($operation === 'create') {
            return BarangMasukModel::where('id_barang', $request->input('id_barang'))
                ->where('nama_barang', $request->input('nama_brg_transaksi'))
                ->where('tipe_barang', $request->input('tipe_brg_transaksi'))
                ->where('posisi', $request->input('posisi_brg_transaksi'))
                ->where('tgl_brg_masuk', $request->input('transaksi'))
                ->sum('jumlah_barang');
        }
    }
    public function checkTopProduct($transaksi)
    {
        return TopProductModel::where('id_barang', $transaksi->id_barang)
            ->where('nama_barang', $transaksi->nama_barang)
            ->where('tipe_barang', $transaksi->tipe_barang)
            ->whereDate('tanggal', $transaksi->tgl_transaksi)
            ->first();
    }
    public function checkStokBarang($transaksi, $request, $operation)
    {
        return StokBarangModel::where('id_barang', $transaksi->id_barang)
            ->where('nama_barang', $transaksi->nama_barang)
            ->where('tipe_barang', $transaksi->tipe_barang)
            ->where('posisi', $transaksi->posisi)
            ->whereDate('tanggal', $request->input('tgl_pelunasan'))  // Ubah jadi tgl_pelunasan
            ->first();
    }
}
