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
    <div class="callout callout-info">
        <h5><i class="fas fa-info-circle"></i> Informasi </h5>
        <h6 class="w-75">
            Pastikan sebelum melakukan transaksi nama Barang sudah terdaftar di data barang, Jika belum tambahkan pada link dibawah ini.
            <div class="mt-2">
                <a id="add_item" data-toggle="modal" data-target="#staticBackdrop" class="text-primary" href="#">
                    Tambah Barang</a>
            </div>
        </h6>
    </div>
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
            <div class="input-group input-group-sm w-25">
                <input type="search" name="keyword_transaksi" id="keyword_transaksi" class="form-control" placeholder="Search">
            </div>
        </div>
        <div class="ml-2 mb-2">
            <button disabled id="delete_all_transaksi" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i>
                Hapus</button>
        </div>

        <div class="card-body table-responsive p-2">
            <table id="" class="table table-hover text-nowrap table-sm table-bordered">
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
    @include('Barang.modal.form_item')
    @include('transaksi.modal.import')
    @include('transaksi.modal.print_date')

@endsection
