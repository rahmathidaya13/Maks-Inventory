<?php

namespace App\Traits\Handles;

use App\Models\StokBarangModel;
use App\Models\BarangMasukModel;
use App\Models\BarangKeluarModel;

trait handlesStokBarang
{
    public function createStokBarang(array $data)
    {
        $barang_masuk = $this->countBarangMasuk($data);
        $barang_keluar = $this->countBarangKeluar($data);
        $cekStok = $this->checkStok($data);
        if ($cekStok) {
            $cekStok->barang_masuk = $barang_masuk ?? 0;
            $cekStok->barang_keluar = $barang_keluar ?? 0;
            $cekStok->stok_awal += $data['jumlah_barang'];
            $cekStok->stok_akhir = ($cekStok->stok_awal + $cekStok->barang_masuk) - $cekStok->barang_keluar;
            $cekStok->keterangan = $data['keterangan'] ?? $cekStok->keterangan;
            $cekStok->save();
        } else {
            // ambil stok terakhir berdasarkan nama barang,tipe barang,posisi barang,
            // jika sesuai ambil datanya yang paling terakhir dan jadikan stok awal
            $stokSebelum = $this->checkStokTerakhir($data);
            $stokAwal =  $stokSebelum ? $stokSebelum->stok_akhir : 0;

            $stok = new StokBarangModel();
            $stok->id_barang = $data['id_barang'];
            $stok->tanggal = $data['tgl'];
            $stok->nama_barang = $data['nama_barang'];
            $stok->tipe_barang = $data['tipe_barang'];
            $stok->barang_masuk = $barang_masuk ?? 0;
            $stok->barang_keluar = $barang_keluar ?? 0;
            if (empty($stokAwal)) {
                $stok->stok_awal = $data['jumlah_barang'];
            } else {
                $stok->stok_awal = $stokAwal + $data['jumlah_barang'];
            }
            $stok->stok_akhir =  ($stok->stok_awal + $stok->barang_masuk) - $stok->barang_keluar;
            $stok->posisi = $data['posisi_barang'];
            $stok->keterangan = $data['keterangan'];
            $stok->save();
        }
    }
    public function updateStokBarang(array $data, string $id)
    {
        $barang_masuk = $this->countBarangMasuk($data);
        $barang_keluar = $this->countBarangKeluar($data);

        $stokBarang = StokBarangModel::find($id);
        $stokBarang->nama_barang = $data['nama_barang'];
        $stokBarang->tipe_barang = $data['tipe_barang'];
        $stokBarang->tanggal = $data['tgl'];
        $stokBarang->barang_masuk = $barang_masuk ?? 0;
        $stokBarang->barang_keluar = $barang_keluar ?? 0;
        $stokBarang->stok_awal = (int) $data['jumlah_barang'];
        $stokBarang->stok_akhir = (int) ($stokBarang->stok_awal + $stokBarang->barang_masuk) - $stokBarang->barang_keluar;
        $stokBarang->posisi = $data['posisi_barang'];
        $stokBarang->keterangan = $data['keterangan'];
        $stokBarang->update();

        return $stokBarang;
    }

    public function countBarangMasuk(array $data)
    {
        return BarangMasukModel::where('id_barang', $data['id_barang'])
            ->where('nama_barang', $data['nama_barang'])
            ->where('tipe_barang', $data['tipe_barang'])
            ->where('posisi', $data['posisi_barang'])
            ->where('tgl_brg_masuk', $data['tgl'])
            ->sum('jumlah_barang');
    }
    public function countBarangKeluar(array $data)
    {
        return BarangKeluarModel::where('id_barang', $data['id_barang'])
            ->where('nama_barang', $data['nama_barang'])
            ->where('tipe_barang', $data['tipe_barang'])
            ->where('posisi', $data['posisi_barang'])
            ->where('tanggal', $data['tgl'])
            ->sum('jumlah_barang');
    }
    public function checkStok(array $data)
    {
        return StokBarangModel::where('id_barang', $data['id_barang'])
            ->where('nama_barang', $data['nama_barang'])
            ->where('tipe_barang', $data['tipe_barang'])
            ->where('posisi', $data['posisi_barang'])
            ->where('tanggal', $data['tgl'])
            ->first();
    }
    public function checkStokTerakhir(array $data)
    {
        return StokBarangModel::where('id_barang', $data['id_barang'])
            ->where('nama_barang', $data['nama_barang'])
            ->where('tipe_barang', $data['tipe_barang'])
            ->where('posisi', $data['posisi_barang'])
            ->orderBy('tanggal', 'desc')
            ->first();
    }
}
