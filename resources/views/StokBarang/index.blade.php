@extends('layouts.app')
@section('title', 'Stok Barang')
@section('breadcrumb', 'Stok Barang')
@section('icon', 'fas fa-cubes')
@section('content')
<div class="row">
    <div class="col-lg-12 col-12">
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
            {{-- call out in here --}}

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
                <div class="d-flex align-items-center">
                    <div class="mx-3">
                        <div class="input-group input-group-sm">
                            <input type="date" name="start_date_filter_stok" id="start_date_filter_stok" class="form-control mx-1">
                            <input type="date" name="end_date_filter_stok" id="end_date_filter_stok" class="form-control mx-2">
                            <button id="set_filter_stok" type="submit" class="btn btn-sm btn-primary">Set</button>
                        </div>
                    </div>
                    <div class="input-group input-group-sm w-50">
                        <input type="search" name="keyword_stok" id="keyword_stok" class="form-control" placeholder="Search">
                    </div>
                </div>
            </div>
            <div class="ml-2 mb-2">
                <button disabled id="delete_all_stok" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i>
                    Hapus</button>
            </div>

            <div class="card-body table-responsive p-2">
                <table id="" class="table table-hover table-bordered text-nowrap table-sm">
                    <thead>
                        <tr class="text-center table-success">
                            <th class="text-center">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="select_all_stok"
                                        id="select_all_stok">
                                    <label class="form-check-label"></label>
                                </div>
                            </th>
                            <th>No</th>
                            <th>Tanggal</th>
                            <th>Nama Barang</th>
                            <th>Tipe Barang</th>
                            <th>Barang Masuk</th>
                            <th>Barang Keluar</th>
                            <th>Stok Awal</th>
                            <th>Stok Akhir</th>
                            <th>Keterangan</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @include('StokBarang.table_partial.tableStok',['stok'=>$stok])
                    </tbody>

                </table>
                <div class="d-flex justify-content-between p-0 pt-2">
                    <div>
                        Menampilkan <b>{{ $stok->firstItem() }}</b> sampai
                        <b>{{ $stok->lastItem() }}</b> dari
                        <b>{{ $stok->total() }}</b> item
                    </div>
                    <div>
                        {{ $stok->links() }}
                    </div>
                </div>

            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>
@include('StokBarang.modal.stokForm')
@include('StokBarang.modal.importStok')
@endsection
