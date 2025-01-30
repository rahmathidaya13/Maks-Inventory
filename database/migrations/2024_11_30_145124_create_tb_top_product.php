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
        Schema::create('tb_top_product', function (Blueprint $table) {
            $table->uuid('id_top_product')->primary();
            $table->foreignUuid('id_barang')->references('id_barang')->on('tb_barang')->cascadeOnDelete();
            $table->date('tanggal');
            $table->string('kode_barang',50);
            $table->string('nama_barang',100);
            $table->string('tipe_barang',100);
            $table->integer('total_barang');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_top_product');
    }
};
