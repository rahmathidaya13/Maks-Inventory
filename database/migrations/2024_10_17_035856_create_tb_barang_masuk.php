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
        Schema::create('tb_barang_masuk', function (Blueprint $table) {
            $table->uuid('id_brg_masuk')->primary();
            $table->foreignUuid('id_barang')->references('id_barang')->on('tb_barang')->cascadeOnDelete();
            $table->date('tgl_brg_masuk');
            $table->string('no_warehouse', 50);
            $table->string('nama_barang', 100);
            $table->string('tipe_barang', 100);
            $table->string('asal_gudang', 50);
            $table->integer('jumlah_barang');
            $table->string('posisi', 50);
            $table->string('status', 50);
            $table->string('nama_konsumen', 50);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_barang_masuk');
    }
};
