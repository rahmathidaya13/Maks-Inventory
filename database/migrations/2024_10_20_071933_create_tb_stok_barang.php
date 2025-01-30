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
        Schema::create('tb_stok_barang', function (Blueprint $table) {
            $table->uuid('id_stok')->primary();
            $table->foreignUuid('id_barang')->references('id_barang')->on('tb_barang')->cascadeOnDelete();
            $table->date('tanggal');
            $table->string('nama_barang', 100);
            $table->string('tipe_barang', 100);
            $table->integer('barang_masuk');
            $table->integer('barang_keluar');
            $table->integer('stok_awal');
            $table->integer('stok_akhir');
            $table->string('posisi', 50);
            $table->string('keterangan', 50);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_stok_barang');
    }
};
