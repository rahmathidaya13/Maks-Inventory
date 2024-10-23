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
        'nama_konsumen',
        'nama_sales',
        'nama_barang',
        'tipe_barang',
        'jumlah_barang',
        'total_pembayaran',
    ];
}