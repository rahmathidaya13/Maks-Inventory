@extends('layouts.app')
@section('title', 'Dashboard')
@section('breadcrumb', 'Dashboard')
@section('icon', 'fas fa-tachometer-alt')
@section('content')
    @if ($errors->any())
        <div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h5><i class="icon fas fa-ban"></i> Alert!</h5>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
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
    <div class="row">
        <div class="col-md-6">
            {{-- chart bar income --}}
            <div class="card">
                <div class="card-header p-0 px-3 pt-3">
                    <div class="row d-flex align-items-center">
                        <div class="d-flex align-items-baseline col-md-8">
                            <h4><i class="fas fa-chart-pie"></i></h4>
                            <h4 class="font-weight-bold ml-2">
                                Total Pendapatan perSales <br>
                                <small>Periode: {{ $periode }} </small>
                            </h4>
                        </div>
                        <div class="col-md-4 d-flex justify-content-end">
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <canvas class="myChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card" style="height: 440px">
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
                    <div class="table-responsive">
                        <table class="table table-sm table-borderless table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th>Top</th>
                                    <th>Nama Barang</th>
                                    <th class="text-center">Jumlah</th>
                                </tr>
                            </thead>
                            <tbody id="top_product">
                                @foreach ($topProduct as $index => $data)
                                    <tr class="font-weight-bold">
                                        <td>
                                            @if ($loop->iteration == 1)
                                                <span class="badge badge-success align-middle px-3">
                                                    {{ $loop->iteration }}</span>
                                            @elseif($loop->iteration == 2)
                                                <span class="badge badge-warning px-3">
                                                    {{ $loop->iteration }}</span>
                                            @elseif($loop->iteration == 3)
                                                <span class="badge badge-secondary px-3">
                                                    {{ $loop->iteration }}</span>
                                            @else
                                                <span class="badge badge-light px-3 mx-1">
                                                    {{ $loop->iteration }}</span>
                                            @endif
                                        </td>
                                        <td>{{ $data->nama_barang }} - {{ $data->tipe_barang }}</td>
                                        <td class="text-center">{{ $data->total }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </div>

    {{-- table penjualan --}}
    <div class="card ">
        <div class="card-header p-0 px-3 pt-3">
            <div class="row d-flex align-items-center">
                <div class="d-flex align-items-baseline col-md-7">
                    <h4><i class="fas fa-money-check-alt"></i> </h4>
                    <h4 class="font-weight-bold ml-2">
                        Total Penjualan Unit Sales <br>
                        <small>Periode: {{ $periode }} </small>
                    </h4>
                </div>
                <div class="col-md-5 mb-3 mb-md-0 ">
                    <div class="input-group input-group-sm">
                        <a class="btn btn-sm btn-success mx-2" href="{{ route('penjualan.pdf') }}"> <i
                                class="fas fa-print"></i> Print</a>
                        <input class="form-control form-control-sm filter_month" type="month">
                        <span class="mx-2"><i class="fas fa-sort"></i></span>
                        <input placeholder="Keyword..." class="form-control form-control-sm" type="search"
                            id="sales_keyword" name="sales_keyword">
                    </div>
                </div>

            </div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-sm table-borderless text-nowrap table-striped">
                    <thead class="table-dark">
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
