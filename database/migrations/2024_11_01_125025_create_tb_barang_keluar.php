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
            $table->string('kode_transaksi');
            $table->string('nama_konsumen');
            $table->string('no_handphone');
            $table->string('alamat');
            $table->string('kode_barang');
            $table->string('nama_barang');
            $table->string('tipe_barang');
            $table->integer('jumlah_barang');
            $table->string('posisi');
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
