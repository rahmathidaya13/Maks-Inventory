<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StokBarangModel extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'tb_stok_barang';
    protected $primaryKey = 'id_stok';
    protected $fillable = [
        'id_barang',
        'id_brg_masuk',
        'tanggal',
        'nama_barang',
        'tipe_barang',
        'stok_awal',
        'stok_akhir',
        'barang_masuk',
        'barang_keluar',
    ];
}
