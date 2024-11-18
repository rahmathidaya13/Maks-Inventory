@extends('layouts.app')
@section('title', 'Transaksi Penjualan')
@section('breadcrumb', 'Transaksi')
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
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h5><i class="icon fas fa-check"></i> Alert!</h5>
            {{ $message }}
        </div>
    @endif

    <div class="card">
        <div class="d-flex justify-content-between align-items-center p-3">
            <div class="d-flex align-items-center">
                <span class="mr-2">Tampilkan hasil: </span>
                <div class="input-group input-group-sm" style="width: 75px">
                    <select class="form-control form-control-sm" name="filter_transaksi" id="filter_transaksi">
                        <option value="10">10</option>
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
                            class="form-control mx-1">
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
        <div class="px-3 mb-2">
            <button disabled id="delete_all_transaksi" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i>
                Hapus</button>
        </div>

        <div class="card-body table-responsive p-3">
            <table id="" class="table table-hover text-nowrap table-sm table-bordered table-striped">
                <thead class="table-info">
                    <tr class="text-center">
                        <th class="text-center">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="select_all_transaksi"
                                    id="select_all_transaksi">
                                <label class="form-check-label"></label>
                            </div>
                        </th>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Kode Transaksi</th>
                        <th>Konsumen</th>
                        <th>Sales</th>
                        <th>Barang</th>
                        <th>Tipe Barang</th>
                        <th>Jumlah Barang</th>
                        <th>Harga Barang</th>
                        <th>Status Pembayaran</th>
                        <th>Total Bayar</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @include('transaksi.partial.table', ['transaksi' => $transaksi])
                </tbody>

            </table>
            <div class="d-flex justify-content-between p-3">
                <div>
                    Menampilkan <b>{{ $transaksi->firstItem() }}</b> sampai
                    <b>{{ $transaksi->lastItem() }}</b> dari
                    <b>{{ $transaksi->total() }}</b> item
                </div>
                <div>
                    {{ $transaksi->links() }}
                </div>
            </div>

        </div>
    </div>
    @include('transaksi.modal.formTransaksi')
    @include('transaksi.modal.formPelunasan')
    @include('transaksi.modal.import')
    @include('transaksi.modal.print_date')

@endsection
