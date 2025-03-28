@extends('layouts.app')
@section('title', 'Daftar Barang')
@section('breadcrumb', 'Daftar Barang')
@section('icon', 'fas fa-box')
@section('content')
    <!-- Small boxes (Stat box) -->
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
                <div class="alert alert-default-info font-weight-bold " role="alert" style="font-size: 16px;">
                    <i class="far fa-check-circle text-success mr-2"></i>
                    <span> {{ $message }}</span>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            @endif
            {{-- end alert --}}
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
                <div class="px-3 d-flex mb-2">
                    @can('onlyAdmin')
                        <button disabled id="delete_all" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i>
                            Hapus</button>
                    @endcan
                </div>
                <div class="card-body table-responsive p-0">
                    <table id="myTable" class="table text-nowrap table-borderless table-striped">
                        <thead class="table-dark">
                            <tr>
                                @can('onlyAdmin')
                                    <th>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="selectAll" id="selectAll">
                                            <label class="form-check-label"></label>
                                        </div>
                                    </th>
                                @endcan
                                <th>No</th>
                                <th>Nama Barang</th>
                                <th>Tipe Barang</th>
                                <th>Harga</th>
                                @can('onlyAdmin')
                                    <th>Aksi</th>
                                @endcan
                            </tr>
                        </thead>
                        <tbody id="tableBarang">
                            @include('Barang.partials.table_item', ['barang' => $barang])
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-12 col-md-6 d-flex justify-content-start p-3">
                        @include('Barang.partials.informasi', ['barang' => $barang])
                    </div>
                    <div class="col-12 col-md-6 p-3 d-flex justify-content-center justify-content-md-end">
                        {{-- {{ $barang->links() }} --}}
                        @include('Barang.partials.paginate', ['barang' => $barang])
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    @include('Barang.modal.form_item')
    @include('Barang.modal.form_import')
@endsection
