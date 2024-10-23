<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BarangModel extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'tb_barang';
    protected $primaryKey = 'id_barang';
    protected $fillable = ['nama_barang', 'tipe_barang', 'harga_barang'];

    protected $with = ['barangMasuk','stokBarang'];
    public $incrementing = false;

    public function barangMasuk(){
        return $this->hasMany(BarangMasukModel::class, 'id_barang','id_barang');
    }

    public function stokBarang(){
        return $this->hasMany(StokBarangModel::class, 'id_barang','id_barang')
        ->orderBy('tanggal', 'desc');
    }

    public function transaksiPenjualan(){
        return $this->hasMany(TransaksiModel::class, 'id_barang');
    }
}
