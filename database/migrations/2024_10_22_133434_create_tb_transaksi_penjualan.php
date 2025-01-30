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
        Schema::create('tb_transaksi_penjualan', function (Blueprint $table) {
            $table->uuid('id_transaksi')->primary();
            $table->foreignUuid('id_barang')->references('id_barang')->on('tb_barang')->cascadeOnDelete();
            $table->foreignUuid('id_stok')->references('id_stok')->on('tb_stok_barang')->cascadeOnDelete();
            $table->date('tgl_transaksi');
            $table->string('kode_transaksi', 50);
            $table->string('nama_konsumen', 50);
            $table->string('no_handphone', 13);
            $table->string('alamat', 150);
            $table->string('nama_sales', 50);
            $table->string('kode_barang', 50);
            $table->string('nama_barang', 100);
            $table->string('tipe_barang', 100);
            $table->integer('jumlah_barang');
            $table->decimal('harga_barang', 12, 2);
            $table->string('posisi', 50);
            $table->enum('status_pembayaran', ['dana pertama - belum lunas', 'dana pertama - lunas', 'lunas'])->default('dana pertama - belum lunas');
            $table->string('status_transaksi', 50);
            $table->decimal('dana_pertama', 12, 2);
            $table->decimal('pembayaran', 12, 2);
            $table->integer('diskon');
            $table->decimal('total_pembayaran', 12, 2);
            $table->decimal('selisih_pembayaran', 12, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tb_transaksi_penjualan');
    }
};
