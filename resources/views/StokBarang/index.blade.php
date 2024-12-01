@extends('layouts.app')
@section('title', 'Stok Barang')
@section('breadcrumb', 'Stok Barang')
@section('icon', 'fas fa-cubes')
@section('content')
    <div class="row">
        <div class="col-md-12 col-12">
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
            {{-- call out in here --}}
            <div class="callout callout-info">
                <h5><i class="fas fa-info-circle"></i> Informasi </h5>
                <h6 class="w-75">
                    Pastikan sebelum melakukan penambahan stok, Barang sudah terdaftar di data barang, Jika belum tambahkan
                    pada link dibawah ini.
                    <div class="mt-2">
                        <a id="add_item" data-toggle="modal" data-target="#staticBackdrop" class="text-primary"
                            href="#">
                            Tambah Barang</a>
                    </div>
                </h6>
            </div>
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
                            <div class="input-group input-group-sm ">
                                <input type="date" name="start_date_filter_stok" id="start_date_filter_stok"
                                    class="form-control mx-2" value="{{ \Carbon\Carbon::now()->format('Y-m-d') }}">
                                <span><i class="fas fa-sort"></i></span>
                                <input type="date" name="end_date_filter_stok" id="end_date_filter_stok"
                                    class="form-control mx-2" value="{{ \Carbon\Carbon::now()->format('Y-m-d') }}">
                                <button id="set_filter_stok" type="submit" class="btn btn-sm btn-primary">Set</button>
                            </div>
                        </div>
                        <div class="input-group input-group-sm w-50">
                            <input type="search" name="keyword_stok" id="keyword_stok" class="form-control"
                                placeholder="Search">
                        </div>
                    </div>
                </div>
                <div class="mb-2 px-3">
                    <button disabled id="delete_all_stok" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i>
                        Hapus</button>
                </div>

                <div class="card-body table-responsive p-0">
                    <table class="table table-striped text-nowrap">
                        <thead class="table-dark">
                            <tr>
                                <th class="align-middle">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="select_all_stok"
                                            id="select_all_stok">
                                        <label class="form-check-label"></label>
                                    </div>
                                </th>
                                <th class="align-middle">No</th>
                                <th class="align-middle">Tanggal</th>
                                <th class="align-middle">Nama Barang</th>
                                <th class="align-middle">Tipe Barang</th>
                                <th class="align-middle">Stok Awal</th>
                                <th class="align-middle">Barang Masuk</th>
                                <th class="align-middle">Barang Keluar</th>
                                <th class="align-middle">Stok Akhir</th>
                                <th class="align-middle">Posisi Barang</th>
                                <th class="align-middle">Keterangan</th>
                                <th class="align-middle">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @include('StokBarang.table_partial.tableStok', ['stok' => $stok])
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-6 col-md-6 d-flex justify-content-start p-3">
                        <span>
                            Menampilkan <b>{{ $stok->firstItem() }}</b> sampai
                            <b>{{ $stok->lastItem() }}</b> dari
                            <b>{{ $stok->total() }}</b> item
                        </span>
                    </div>
                    <div class="col-12 col-md-6 p-3 d-flex justify-content-center justify-content-md-end">
                        {{ $stok->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('StokBarang.modal.stokForm')
    @include('StokBarang.modal.importStok')
    @include('StokBarang.modal.print_date')
    @include('Barang.modal.form_item')

@endsection
