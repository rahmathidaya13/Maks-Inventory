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
        Schema::table('tb_transaksi_penjualan', function (Blueprint $table) {
            $table->uuid('id_barang')->nullable()->change();
            $table->uuid('id_stok')->nullable()->change();
        });
        Schema::table('tb_barang_keluar', function (Blueprint $table) {
            $table->uuid('id_barang')->nullable()->change();
            $table->uuid('id_transaksi')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_transaksi_penjualan');
        Schema::dropIfExists('tb_barang_keluar');
    }
};
