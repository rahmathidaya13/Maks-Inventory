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
            $table->foreignUuid('id_brg_masuk')->references('id_brg_masuk')->on('tb_barang_masuk')->cascadeOnDelete();
            $table->date('tanggal');
            $table->string('nama_barang');
            $table->string('tipe_barang');
            $table->integer('stok_awal');
            $table->integer('stok_akhir');
            $table->integer('stok_saat_ini');
            $table->string('status');
            $table->string('keterangan')->nullable();
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
