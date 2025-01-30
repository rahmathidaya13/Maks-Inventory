@extends('layouts.app')
@section('title', 'Transaksi Penjualan')
@section('breadcrumb', 'Transaksi Penjualan')
@section('icon', 'fas fa-money-bill-wave')
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
    @if ($message = Session::get('success'))
        <div class="alert alert-default-info font-weight-bold " role="alert" style="font-size: 16px;">
            <i class="far fa-check-circle text-success mr-2"></i>
            <span> {{ $message }}</span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif

    <div class="card">
        <div class="d-flex justify-content-between align-items-center p-3">
            <div class="d-flex align-items-center">
                <span class="mr-2">Tampilkan hasil: </span>
                <div class="input-group input-group-sm" style="width: 75px">
                    <select class="form-control form-control-sm" name="filter_transaksi" id="filter_transaksi">
                        <option value="10" selected>10</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                </div>

            </div>
            <div class="d-flex align-items-center">
                <div class="mx-3">
                    <div class="input-group input-group-sm">
                        <input type="date" name="start_date_filter_transaksi" id="start_date_filter_transaksi"
                            class="form-control mx-2">
                        <span> <i class="fas fa-sort"></i></span>
                        <input type="date" name="end_date_filter_transaksi" id="end_date_filter_transaksi"
                            class="form-control mx-2">
                        <button id="set_filter_transaksi" type="submit" class="btn btn-sm btn-primary">Set</button>
                    </div>
                </div>
                <div class="input-group input-group-sm w-50">
                    <input type="search" name="keyword_transaksi" id="keyword_transaksi" class="form-control"
                        placeholder="Search">
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-end px-3">
            <div class="">
                <select class="form-control" name="stts_pembayaran" id="stts_pembayaran">
                    <option value="">Filter Pembayaran</option>
                    <option value="lunas">Lunas</option>
                    <option value="dana pertama - belum lunas">Dp - belum lunas</option>
                    <option value="dana pertama - lunas">Dp - lunas</option>
                </select>
            </div>
        </div>
        <div class="px-3 mb-2">
            @can('onlyAdmin')
                <button disabled id="delete_all_transaksi" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i>
                    Hapus</button>
            @endcan
        </div>

        <div class="card-body table-responsive p-0">
            <table id="" class="table text-nowrap table-borderless table-striped">
                <thead class="table-dark">
                    <tr>
                        @can('onlyAdmin')
                            <th class="text-center align-middle">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="select_all_transaksi"
                                        id="select_all_transaksi">
                                    <label class="form-check-label"></label>
                                </div>
                            </th>
                        @endcan
                        <th class="align-middle">No</th>
                        <th class="align-middle">Tanggal</th>
                        <th class="align-middle">Kode Transaksi</th>
                        <th class="align-middle">Nama Konsumen</th>
                        <th class="align-middle">Sales</th>
                        <th class="align-middle">Kode Barang</th>
                        <th class="align-middle">Nama Barang</th>
                        <th class="align-middle">Tipe Barang</th>
                        <th class="align-middle">Status Barang</th>
                        <th class="align-middle">Jumlah Barang</th>
                        <th class="align-middle">Posisi Barang</th>
                        <th class="align-middle">Harga Barang</th>
                        <th class="align-middle">Status Pembayaran</th>
                        <th class="align-middle">Pembayaran</th>
                        @can('onlyAdmin')
                            <th class="text-center align-middle">Aksi</th>
                        @endcan
                    </tr>
                </thead>
                <tbody id="tableTransaksi">
                    @include('transaksi.partial.table', ['transaksi' => $transaksi])
                </tbody>

            </table>
        </div>
        <div class="row">
            <div class="col-12 col-md-6 d-flex justify-content-start p-3">
                @include('transaksi.partial.informasi', ['transaksi' => $transaksi])
            </div>
            <div class="col-12 col-md-6 p-3 d-flex justify-content-center justify-content-md-end">
                @include('transaksi.partial.paginate', ['transaksi' => $transaksi])
            </div>
        </div>
    </div>
    @include('transaksi.modal.formTransaksi')
    @include('transaksi.modal.formPelunasan')
    @include('transaksi.modal.import')
    @include('transaksi.modal.print_date')
    @include('transaksi.modal.Form_ambil_barang')
    @include('transaksi.modal.formSparepart')
@endsection
