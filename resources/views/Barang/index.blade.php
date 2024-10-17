@extends('layouts.app')
@section('title', 'Daftar Barang')
@section('breadcrumb', 'Daftar Barang')
@section('icon', 'fas fa-box')
@section('content')
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-lg-12 col-12">
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            @if ($message = Session::get('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong> <i class="fas fa-check-circle"></i> {{ $message }}</strong>
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
                            <select class="form-control form-control-sm" name="offset" id="offset">
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                        </div>
                    </div>
                    <div class="input-group input-group-sm w-25">
                        <input type="search" name="keyword" id="keyword" class="form-control" placeholder="Search">
                    </div>
                </div>
                <div class="px-3 d-flex">
                    <button disabled id="delete_all" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i> Delete
                        all</button>
                </div>
                <div class="card-body table-responsive p-0">
                    <table id="" class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th class="text-center">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="selectAll" id="selectAll">
                                        <label class="form-check-label"></label>
                                    </div>
                                </th>
                                <th>No</th>
                                <th>Nama Barang</th>
                                <th>Tipe Barang</th>
                                <th>Harga</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @include('Barang.partials.table_item', ['barang' => $barang])
                        </tbody>

                    </table>
                    <div class="d-flex justify-content-between p-3">
                        <div>
                            Menampilkan <b>{{ $barang->firstItem() }}</b> sampai <b>{{ $barang->lastItem() }}</b> dari
                            <b>{{ $barang->total() }}</b> item
                        </div>
                        <div>
                            {{ $barang->links() }}
                        </div>
                    </div>

                </div>
                <!-- /.card-body -->
            </div>
        </div>
    </div>
    @include('Barang.modal.form_item')
    @include('Barang.modal.form_import')
    <script>
        $(document).ready(function() {

        });
    </script>
@endsection
