@extends('layouts.app')
@section('title', 'Barang Keluar')
@section('breadcrumb', 'Barang Keluar')
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
                <div class="d-flex justify-content-between align-items-center p-3 ">
                    <div class="d-flex align-items-center">
                        <span class="mr-2">Tampilkan hasil: </span>
                        <div class="input-group input-group-sm" style="width: 75px">
                            <select class="form-control form-control-sm" name="limit_barang_keluar"
                                id="limit_barang_keluar">
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
                                <input type="date" name="start_date_item_in" id="start_date_item_in"
                                    class="form-control mx-2">
                                <span><i class="fas fa-sort"></i></span>
                                <input type="date" name="end_date_item_out" id="end_date_item_out"
                                    class="form-control mx-2">
                                <button id="set_filter_item_out" type="submit" class="btn btn-sm btn-primary">Set</button>
                            </div>
                        </div>
                        <div class="input-group input-group-sm w-50">
                            <input type="search" name="keyword_barang_keluar" id="keyword_barang_keluar"
                                class="form-control" placeholder="Search">
                        </div>
                    </div>
                </div>

                <div class="card-body table-responsive p-0">
                    <table class="table table-borderless text-nowrap  table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>#</th>
                                <th>Tanggal</th>
                                <th>Kode Transaksi</th>
                                <th>Nama Konsumen</th>
                                <th>No Handphone</th>
                                <th>Alamat</th>
                                <th>Kode Barang</th>
                                <th>Nama Barang</th>
                                <th>Tipe Barang</th>
                                <th>Jumlah Barang</th>
                                <th>Posisi Barang</th>
                            </tr>
                        </thead>
                        <tbody id="tableBarangKeluar">
                            @include('Barang_Keluar.partial.table', ['barang_keluar' => $barang_keluar])
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-12 col-md-6 d-flex justify-content-start p-3">
                        @include('Barang_Keluar.partial.informasi', ['barang_keluar' => $barang_keluar])
                    </div>
                    <div class="col-12 col-md-6 p-3 d-flex justify-content-center justify-content-md-end">
                        @include('Barang_Keluar.partial.paginate',['barang_keluar' => $barang_keluar])
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('Barang_Keluar.modal.print_date')
@endsection
