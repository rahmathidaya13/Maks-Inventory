@extends('layouts.app')
@section('title', 'Dashboard')
@section('breadcrumb', 'Dashboard')
@section('icon', 'fas fa-tachometer-alt')
@section('content')
    <div class="card p-3">
        <div class="row row-cols-lg-3">

            <div class="col-md-3 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-teal">
                    <span class="info-box-icon bg-gradient-navy"><i class="fas fa-dollar-sign"></i></span>
                    <div class="info-box-content ">
                        <span class="info-box-text">Total Transaksi</span>
                        <span class="info-box-text">Periode: {{ $periode }}</span>
                        <span class="info-box-number h3 ">{{ 'Rp ' . number_format($countTransaksi, 0, ',', '.') }}</span>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-cyan">
                    <span class="info-box-icon bg-gradient-navy"><i class="fas fa-boxes"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Daftar Barang</span>
                        <span class="info-box-text"> Cabang Pekanbaru</span>
                        <span class="info-box-number h3">{{ $barang }} <small>item</small></span>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-teal">
                    <span class="info-box-icon bg-gradient-navy"><i class="fas fa-inbox"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Barang Masuk</span>
                        <span class="info-box-text">Periode: {{ $periode }}</span>
                        <span class="info-box-number h3">{{ $countInBox }} <small>item</small></span>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-cyan">
                    <span class="info-box-icon bg-gradient-navy"><i class="fas fa-box-open"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Barang Keluar</span>
                        <span class="info-box-text">Periode: {{ $periode }}</span>
                        <span class="info-box-number h3">{{ $countOutBox }} <small>item</small></span>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-navy">
                    <span class="info-box-icon bg-gradient-navy"><i class="fas fa-users"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Pelanggan</span>
                        <span class="info-box-text">Periode: {{ $periode }}</span>
                        <span class="info-box-number h3">{{ $konsumen_transaksi }}</span>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="card ">
        <div class="card-header p-0 px-3 pt-3">
            <h4 class="font-weight-bold ">Total Penjualan Unit Sales</h4>
            <h5 class="">Periode: {{ $periode }}</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive text-center">
                <table class="table table-sm text-nowrap table-bordered text-nowrap">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Tia Saputri</th>
                            <th scope="col">Ade Yolanda</th>
                            <th scope="col">M. Reza</th>
                            <th scope="col">Rahmat Hidaya</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="font-weight-bold h3">
                            <td scope="row">
                                {{ $transaksi->firstWhere('nama_sales', 'Tia Saputri')->total_penjualan ?? 0 }}</td>
                            <td scope="row">
                                {{ $transaksi->firstWhere('nama_sales', 'Ade Yolanda')->total_penjualan ?? 0 }}</td>
                            <td scope="row">{{ $transaksi->firstWhere('nama_sales', 'Muhammad Reza')->total_penjualan ?? 0 }}
                            </td>
                            <td scope="row">
                                {{ $transaksi->firstWhere('nama_sales', 'Rahmat Hidaya')->total_penjualan ?? 0 }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
