<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BarangMasukModel extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'tb_barang_masuk';
    protected $primaryKey = 'id_brg_masuk';
    // protected $with = 'id_barang';
    protected $fillable = [
        'id_barang',
        'tgl_brg_masuk',
        'no_warehouse',
        'nama_barang',
        'tipe_barang',
        'asal_gudang',
        'jumlah_barang',
    ];
}
