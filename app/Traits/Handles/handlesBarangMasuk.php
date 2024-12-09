<?php

namespace App\Traits\Handles;

use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;

trait handlesBarangMasuk
{
    // Method untuk mengelola data barang masuk
    public function createBarangMasuk(array $data)
    {
        // Implementasi method untuk mengelola data barang masuk
        $barangMasuk = new BarangMasukModel();
        $barangMasuk->id_barang = $data['id_barang'];
        $barangMasuk->tgl_brg_masuk = $data['tgl_brg_masuk'];
        $barangMasuk->no_warehouse = $data['no_warehouse'];
        $barangMasuk->kode_barang = $data['kode_barang_brg_masuk'];
        $barangMasuk->nama_barang = $data['nama_barang'];
        $barangMasuk->tipe_barang = $data['tipe_barang_masuk'];
        $barangMasuk->asal_gudang = $data['asal_gdg'];
        $barangMasuk->jumlah_barang = $data['jumlah_brg'];
        $barangMasuk->status = $data['status'];
        $barangMasuk->nama_konsumen = $data['konsumen'];
        $barangMasuk->posisi = $data['posisi_brg_masuk'];
        $barangMasuk->save();

        // update Kondisi stok
        $this->updateStok($barangMasuk, $data, 'create');
        return $barangMasuk;
    }

    public function updateBarangMasuk(array $data, string $id)
    {

        $barangMasuk = BarangMasukModel::findOrFail($id);
        $barangMasuk->id_barang = $data['id_barang'];
        $barangMasuk->tgl_brg_masuk = $data['tgl_brg_masuk'];
        $barangMasuk->no_warehouse = $data['no_warehouse'];
        $barangMasuk->kode_barang = $data['kode_barang_brg_masuk'];
        $barangMasuk->nama_barang = $data['nama_barang'];
        $barangMasuk->tipe_barang = $data['tipe_barang_masuk'];
        $barangMasuk->asal_gudang = $data['asal_gdg'];
        $barangMasuk->jumlah_barang = $data['jumlah_brg'];
        $barangMasuk->status = $data['status'];
        $barangMasuk->nama_konsumen = $data['konsumen'];
        $barangMasuk->posisi = $data['posisi_brg_masuk'];
        $barangMasuk->update();

        $this->updateStok($barangMasuk, $data, 'update');

        return $barangMasuk;
    }

    private function updateStok($barangMasuk, array $data, string $operation)
    {
        // cari barang keluar berdasarkan kondisi where
        $barang_keluar = $this->countBarangKeluar($data);

        // Jika status adalah 'stok', hitung stok barang terkait barang masuk
        if ($barangMasuk->status === 'stok' || $barangMasuk->status === 'customer') {

            // Cari stok untuk barang yang sesuai dengan id_barang dan id_brg_masuk
            $stokBarang = $this->countStokSekarang($data);

            if ($stokBarang) {
                // Jika stok sudah ada, tambahkan jumlah barang masuk
                if ($operation === 'create') {
                    $stokBarang->barang_masuk += $data['jumlah_brg'];
                } elseif ($operation === 'update') {
                    $stokBarang->barang_masuk = $data['jumlah_brg'];
                }
                $stokBarang->barang_keluar = $barang_keluar ?? 0;
                $stokBarang->stok_akhir = ($stokBarang->stok_awal +  $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
                $stokBarang->save();
            } else {
                // Cari stok barang sebelumnya berdasarkan barang terakhir yaitu (id_barang)
                $stokSebelumnya = $this->countStokSebelum($data);

                // Tentukan stok awal dari stok sebelumnya
                $stokAwal = $stokSebelumnya ? $stokSebelumnya->stok_akhir : 0;

                // Buat record stok baru dengan barang masuk dan stok awal yang diperoleh
                $stokBarangNew = new StokBarangModel();
                $stokBarangNew->id_barang = $data['id_barang'];
                $stokBarangNew->tanggal = $data['tgl_brg_masuk'];
                $stokBarangNew->nama_barang = $data['nama_barang'];
                $stokBarangNew->tipe_barang = $data['tipe_barang_masuk'];
                $stokBarangNew->barang_masuk = $data['jumlah_brg'];
                $stokBarangNew->barang_keluar =  $barang_keluar;
                $stokBarangNew->stok_awal =  $stokAwal;
                $stokBarangNew->stok_akhir =  ($stokBarangNew->stok_awal + $stokBarangNew->barang_masuk) - $stokBarangNew->barang_keluar;
                $stokBarangNew->posisi = $data['posisi_brg_masuk'];
                $stokBarangNew->keterangan = 'stok';
                $stokBarangNew->save();
            }
        }
    }

    public function countBarangKeluar(array $data)
    {
        return BarangKeluarModel::where('id_barang', $data['id_barang'])
            ->where('nama_barang', $data['nama_barang'])
            ->where('tipe_barang', $data['tipe_barang_masuk'])
            ->where('posisi', $data['posisi_brg_masuk'])
            ->where('tanggal', $data['tgl_brg_masuk'])
            ->sum('jumlah_barang');
    }

    public function countStokSekarang(array $data)
    {
        return StokBarangModel::where('id_barang', $data['id_barang'])
            ->where('nama_barang', $data['nama_barang'])
            ->where('tipe_barang', $data['tipe_barang_masuk'])
            ->where('posisi', $data['posisi_brg_masuk'])
            ->where('tanggal', $data['tgl_brg_masuk'])
            ->first();
    }
    public function countStokSebelum(array $data)
    {
        return StokBarangModel::where('id_barang', $data['id_barang'])
            ->where('nama_barang', $data['nama_barang'])
            ->where('tipe_barang', $data['tipe_barang_masuk'])
            ->where('posisi', $data['posisi_brg_masuk'])
            ->orderBy('tanggal', 'desc')
            ->first();
    }
}
