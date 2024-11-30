<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TopProductModel extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'tb_top_product';
    protected $primaryKey = 'id_top_product';
    public $incrementing = false;

    protected $fillable = [
        'id_barang',
        'kode_barang',
        'nama_barang',
        'tipe_barang',
        'total_barang',
    ];
}
