<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tb_barang_keluar', function (Blueprint $table) {
            $table->uuid('id_barang_keluar')->primary();
            $table->foreignUuid('id_transaksi')->references('id_transaksi')->on('tb_transaksi_penjualan')->cascadeOnDelete();
            $table->foreignUuid('id_barang')->references('id_barang')->on('tb_barang')->cascadeOnDelete();
            $table->date('tanggal');
            $table->string('kode_transaksi', 50);
            $table->string('nama_konsumen', 50);
            $table->string('no_handphone', 13);
            $table->string('alamat', 150);
            $table->string('kode_barang', 50);
            $table->string('nama_barang', 100);
            $table->string('tipe_barang', 100);
            $table->integer('jumlah_barang');
            $table->string('posisi', 50);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_barang_keluar');
    }
};
