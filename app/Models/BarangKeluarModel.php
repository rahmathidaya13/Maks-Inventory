<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BarangKeluarModel extends Model
{
    use HasFactory, HasUuids;
    protected $table = 'tb_barang_keluar';
    protected $primaryKey = 'id_barang_keluar';
    protected $fillable = [
        'id_transaksi',
        'id_barang',
        'tanggal',
        'kode_transaksi',
        'nama_konsumen',
        'no_handphone',
        'alamat',
        'nama_barang',
        'tipe_barang',
        'jumlah_barang',
    ];
    public $incrementing = false;

    public function transaksi(){
        return $this->belongsTo(TransaksiModel::class, 'id_transaksi');
    }

}
