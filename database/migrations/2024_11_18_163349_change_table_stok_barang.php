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
        Schema::table('tb_stok_barang', function (Blueprint $table) {
            $table->integer('barang_masuk')->default(0)->change();
            $table->integer('barang_keluar')->default(0)->change();
            $table->integer('stok_awal')->default(0)->change();
            $table->integer('stok_akhir')->default(0)->change();
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
