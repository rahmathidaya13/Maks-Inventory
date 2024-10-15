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
}
