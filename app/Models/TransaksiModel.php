<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TransaksiModel extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'tb_transaksi_penjualan';
    protected $primaryKey = 'id_transaksi';
    protected $fillable = [
        'id_barang',
        'id_stok',
        'tgl_transaksi',
        'kode_transaksi',
        'nama_konsumen',
        'no_handphone',
        'alamat',
        'nama_sales',
        'kode_barang',
        'nama_barang',
        'tipe_barang',
        'status_barang',
        'jumlah_barang',
        'harga_barang',
        'posisi',
        'status_pembayaran',
        'total_pembayaran',
        'selisih_pembayaran',
        'diskon',
        'pembayaran',
        'dana_pertama',
        'status_transaksi',
    ];
    public $incrementing = false;

    public function barang()
    {
        return $this->belongsTo(BarangModel::class, 'id_barang');
    }
    public function stokBarang()
    {
        return $this->belongsTo(StokBarangModel::class, 'id_barang');
    }
    public function barangkeluar()
    {
        return $this->hasMany(BarangKeluarModel::class, 'id_barang_keluar');
    }
}