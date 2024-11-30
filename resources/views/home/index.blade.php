@extends('layouts.app')
@section('title', 'Dashboard')
@section('breadcrumb', 'Dashboard')
@section('icon', 'fas fa-tachometer-alt')
@section('content')
    <div class="card p-3">
        <div class="row row-cols-lg-3">

            <div class="col-md-3 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-navy">
                    <span class="info-box-icon"><i class="fas fa-dollar-sign"></i></span>
                    <div class="info-box-content ">
                        <span class="info-box-text">Total Transaksi</span>
                        <span class="info-box-text">Periode: {{ $periode }}</span>
                        <span class="info-box-number h3 ">{{ 'Rp ' . number_format($countTransaksi, 0, ',', '.') }}</span>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-navy">
                    <span class="info-box-icon"><i class="fas fa-boxes"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Daftar Barang</span>
                        <span class="info-box-text"> Cabang Pekanbaru</span>
                        <span class="info-box-number h3">{{ $barang }} <small>item</small></span>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-navy">
                    <span class="info-box-icon"><i class="fas fa-inbox"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Barang Masuk</span>
                        <span class="info-box-text">Periode: {{ $periode }}</span>
                        <span class="info-box-number h3">{{ $countInBox }} <small>item</small></span>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-navy">
                    <span class="info-box-icon"><i class="fas fa-truck-loading"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Barang Keluar</span>
                        <span class="info-box-text">Periode: {{ $periode }}</span>
                        <span class="info-box-number h3">{{ $countOutBox }} <small>item</small></span>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-12 text-nowrap">
                <div class="info-box bg-gradient-navy">
                    <span class="info-box-icon"><i class="fas fa-users"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Pelanggan</span>
                        <span class="info-box-text">Periode: {{ $periode }}</span>
                        <span class="info-box-number h3">{{ $konsumen_transaksi }}</span>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="card">
        <div class="card-header p-0 px-3 pt-3 d-flex align-items-center">
            <div class="d-flex align-items-baseline">
                <h4><i class="fas fa-chart-line"></i></h4>
                <h4 class="font-weight-bold ml-2">
                    Top Products <br>
                    <small>Periode: {{ $periode }} </small>
                </h4>
            </div>
        </div>
        <div class="card-body">
            <ul class="list-group list-group-flush">
                @foreach ($topProduct as $index => $rows)
                    <li class="list-group-item bg-primary" style="width: 18em">
                        {{ $rows->nama_barang }}
                        {{ $rows->tipe_barang }}</li>
                @endforeach
            </ul>
        </div>
    </div>

    {{-- chart bar income --}}
    <div class="card ">
        <div class="card-header p-0 px-3 pt-3 d-flex align-items-center">
            <div class="d-flex align-items-baseline">
                <h4><i class="fas fa-chart-pie"></i></h4>
                <h4 class="font-weight-bold ml-2">
                    Total Pendapatan per Sales <br>
                    <small>Periode: {{ $periode }} </small>
                </h4>
            </div>
        </div>
        <div class="card-body">
            <canvas class="mb-3" id="myChart" width="800" height="400"></canvas>
        </div>
    </div>

    {{-- table penjualan --}}
    <div class="card ">
        <div class="card-header p-0 px-3 pt-3 d-flex align-items-center">
            <div class="d-flex align-items-baseline">
                <h4><i class="fas fa-money-check-alt"></i> </h4>
                <h4 class="font-weight-bold ml-2">
                    Total Penjualan Unit Sales <br>
                    <small>Periode: {{ $periode }} </small>
                </h4>
            </div>
            <div class="ml-auto align-content-center">
                <div class="input-group input-group-sm">
                    <a class="btn btn-sm btn-success mx-2" href="{{ route('penjualan.pdf') }}"> <i
                            class="fas fa-print"></i> Print</a>
                    <input class="form-control form-control-sm" type="search" id="sales_keyword" name="sales_keyword">
                </div>
            </div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-borderless text-nowrap table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Tanggal Penjualan</th>
                            <th scope="col">Nama Sales</th>
                            <th scope="col">Nama Barang</th>
                            <th scope="col">Tipe Barang</th>
                            <th scope="col">Barang Terjual</th>
                            <th scope="col">Total Penjualan</th>
                        </tr>
                    </thead>
                    <tbody id="tabel_penjualan">
                        @include('home.partial.table', ['transaksi' => $transaksi])
                    </tbody>
                </table>
            </div>
            <div class="d-flex justify-content-between p-3">
                <div>
                    Menampilkan <b>{{ $transaksi->firstItem() }}</b> sampai <b>{{ $transaksi->lastItem() }}</b> dari
                    <b>{{ $transaksi->total() }}</b> item
                </div>
                <div>
                    {{ $transaksi->links() }}
                </div>
            </div>
        </div>
    </div>




@endsection
