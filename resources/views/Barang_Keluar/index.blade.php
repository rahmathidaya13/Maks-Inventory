@extends('layouts.app')
@section('title', 'Daftar Barang Keluar')
@section('breadcrumb', 'Daftar Barang Keluar')
@section('icon', 'fas fa-truck-loading')
@section('content')
<div class="row">
    <div class="col-lg-12 col-12">
        {{-- alert --}}
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
        {{-- end alert --}}
        <div class="card">
            <div class="d-flex justify-content-between align-items-center p-3">
                <div class="d-flex align-items-center">
                    <span class="mr-2">Tampilkan hasil: </span>
                    <div class="input-group input-group-sm" style="width: 75px">
                        <select class="form-control form-control-sm" name="limit_barang_keluar" id="limit_barang_keluar">
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                    </div>
                </div>
                <div class="input-group input-group-sm w-25">
                    <input type="search" name="keyword_barang_keluar" id="keyword_barang_keluar" class="form-control" placeholder="Search">
                </div>
            </div>

            <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Tanggal</th>
                            <th>Kode Transaksi</th>
                            <th>Nama Konsumen</th>
                            <th>No Handphone</th>
                            <th>Alamat</th>
                            <th>Nama Barang</th>
                            <th>Tipe Barang</th>
                            <th>Jumlah Barang</th>
                        </tr>
                    </thead>
                    <tbody>
                        @include('Barang_Keluar.partial.table', ['barang_keluar' => $barang_keluar])
                    </tbody>

                </table>
                <div class="d-flex justify-content-between p-3">
                    <div>
                        Menampilkan <b>{{ $barang_keluar->firstItem() }}</b> sampai <b>{{ $barang_keluar->lastItem() }}</b> dari
                        <b>{{ $barang_keluar->total() }}</b> item
                    </div>
                    <div>
                        {{ $barang_keluar->links() }}
                    </div>
                </div>

            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>
@endsection
