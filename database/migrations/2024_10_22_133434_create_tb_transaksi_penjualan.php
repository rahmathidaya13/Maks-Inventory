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
            $table->string('kode_transaksi');
            $table->string('nama_konsumen');
            $table->string('no_handphone');
            $table->string('alamat');
            $table->string('nama_sales');
            $table->string('kode_barang',20);
            $table->string('nama_barang');
            $table->string('tipe_barang');
            $table->integer('jumlah_barang');
            $table->decimal('harga_barang', 10, 2);
            $table->string('posisi');
            $table->enum('status_pembayaran', ['belum lunas', 'lunas'])->default('belum lunas');
            $table->string('status_transaksi',50);
            $table->decimal('dana_pertama', 10, 2);
            $table->decimal('pembayaran', 10, 2);
            $table->integer('diskon');
            $table->decimal('total_pembayaran', 10, 2);
            $table->decimal('selisih_pembayaran', 10, 2);
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
