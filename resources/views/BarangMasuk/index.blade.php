@extends('layouts.app')
@section('title', 'Barang Masuk')
@section('breadcrumb', 'Barang Masuk')
@section('icon', 'fas fa-clipboard-check')
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
                <div class="alert alert-default-info font-weight-bold " role="alert" style="font-size: 16px;">
                    <i class="far fa-check-circle text-success mr-2"></i>
                    <span> {{ $message }}</span>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            @endif
            @can('onlyAdmin')
                <div class="callout callout-warning">
                    <h5><i class="fas fa-info-circle"></i> Informasi </h5>
                    <h6 class="w-75">
                        Tidak menemukan barang yang diinginkan?
                        Silahkan tambahkan informasi barang seperti nama, tipe, dan harga melalui link berikut.
                        <div class="mt-2">
                            <a id="add_item" data-toggle="modal" data-target="#staticBackdrop" class="text-primary"
                                href="#">
                                Tambah Barang</a>
                        </div>
                    </h6>
                </div>
            @endcan

            <div class="card">
                <div class="d-flex justify-content-between align-items-center p-3">
                    <div class="d-flex align-items-center">
                        <span class="mr-2">Tampilkan hasil: </span>
                        <div class="input-group input-group-sm" style="width: 75px">
                            <select class="form-control form-control-sm" name="filter_brg_masuk" id="filter_brg_masuk">
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
                                <input type="date" name="start_date_brg_masuk" id="start_date_brg_masuk"
                                    class="form-control mx-2">
                                <span><i class="fas fa-sort"></i></span>
                                <input type="date" name="end_date_brg_masuk" id="end_date_brg_masuk"
                                    class="form-control mx-2">
                                <button id="set_brg_masuk" type="submit" class="btn btn-sm btn-primary">Set</button>
                            </div>
                        </div>
                        <div class="input-group input-group-sm w-50">
                            <input type="search" name="keyword_brg_masuk" id="keyword_brg_masuk" class="form-control"
                                placeholder="Search">
                        </div>
                    </div>
                </div>
                <div class="px-3 mb-2">
                    @can('onlyAdmin')
                        <button disabled id="delete_all_brg_masuk" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i>
                            Hapus</button>
                    @endcan
                </div>

                <div class="card-body table-responsive p-0">
                    <table id="" class="table text-nowrap table-borderless table-striped">
                        <thead class="table-dark">
                            <tr>
                                @can('onlyAdmin')
                                    <th>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="selectAllItem"
                                                id="selectAllItem">
                                            <label class="form-check-label"></label>
                                        </div>
                                    </th>
                                @endcan
                                <th>No</th>
                                <th>Tgl. Barang Masuk</th>
                                <th>No. Warehouse</th>
                                <th>Kode Barang</th>
                                <th>Nama Barang</th>
                                <th>Tipe Barang</th>
                                <th>Asal Gudang</th>
                                <th>Jumlah</th>
                                <th>Posisi Barang</th>
                                <th>Status</th>
                                <th>Nama Konsumen</th>
                                @can('onlyAdmin')
                                    <th>Aksi</th>
                                @endcan
                            </tr>
                        </thead>
                        <tbody id="tableBarangMasuk">
                            @include('BarangMasuk.partial.table_item', ['barang_masuk' => $barang_masuk])
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-12 col-md-6 d-flex justify-content-start p-3">
                        @include('BarangMasuk.partial.informasi', ['barang_masuk' => $barang_masuk])
                    </div>
                    <div class="col-12 col-md-6 p-3 d-flex justify-content-center justify-content-md-end">
                        @include('BarangMasuk.partial.paginate', ['barang_masuk' => $barang_masuk])
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('BarangMasuk.modal.form_import')
    @include('Barang.modal.form_item')
    @include('BarangMasuk.modal.form_item')
    {{-- @include('StokBarang.modal.UpdateFormStok') --}}
    @include('BarangMasuk.modal.print_date')
@endsection
