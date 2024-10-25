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
                    <select class="form-control form-control-sm" name="filter_stok" id="filter_stok">
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                </div>

            </div>
            <div class="input-group input-group-sm w-25">
                <input type="search" name="keyword_stok" id="keyword_stok" class="form-control" placeholder="Search">
            </div>
        </div>
        <div class="ml-2">
            <button disabled id="delete_all_stok" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i>
                Hapus</button>
        </div>

        <div class="card-body table-responsive p-0">
            <table id="" class="table table-hover text-nowrap">
                <thead>
                    <tr>
                        <th class="text-center">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="select_all_stok" id="select_all_stok">
                                <label class="form-check-label"></label>
                            </div>
                        </th>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Kode Transaksi</th>
                        <th>Konsumen</th>
                        <th>No. Handphone</th>
                        <th>Alamat</th>
                        <th>Sales</th>
                        <th>Barang</th>
                        <th>Tipe Barang</th>
                        <th>Jumlah Barang</th>
                        <th>Harga Barang</th>
                        <th>Status Pembayaran</th>
                        <th>Diskon</th>
                        <th>Pembayaran</th>
                        <th>Total Bayar</th>
                        <th>Selisih Pembayaran</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @include('transaksi.partial.table', ['transaksi' => $transaksi])
                </tbody>

            </table>
            {{-- <div class="d-flex justify-content-between p-3">
                <div>
                    Menampilkan <b>{{ $barang_masuk->firstItem() }}</b> sampai
                    <b>{{ $barang_masuk->lastItem() }}</b> dari
                    <b>{{ $barang_masuk->total() }}</b> item
                </div>
                <div>
                    {{ $barang_masuk->links() }}
                </div>
            </div> --}}

        </div>
        <!-- /.card-body -->
    </div>
    @include('transaksi.modal.formTransaksi')
@endsection
