@extends('layouts.app')
@section('title', 'Daftar Barang Masuk')
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
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h5><i class="icon fas fa-check"></i> Alert!</h5>
                    {{ $message }}
                </div>
            @endif
            <div class="callout callout-warning">
                <h5><i class="fas fa-exclamation-triangle"></i> Pemberitahuan !</h5>
                <h6 class="w-75">
                    Jika barang yang dicari saat ini tidak tersedia, silahkan tambahkan dahulu nama barang, tipe dan harga di
                    daftar
                    barang.
                    <div class="mt-2">
                        <a id="add_item" data-toggle="modal" data-target="#staticBackdrop"
                            class="text-decoration-none text-primary" href="#"><i class="fas fa-plus-square"></i>
                            Tambah Barang</a>
                    </div>
                </h6>
            </div>
            <div>

            </div>
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
                <div class="ml-2">
                    <button disabled id="delete_all" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i> Delete
                        all</button>
                </div>

                <div class="card-body table-responsive p-0">
                    <table id="" class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th class="text-center">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="selectAllItem"
                                            id="selectAllItem">
                                        <label class="form-check-label"></label>
                                    </div>
                                </th>
                                <th>No</th>
                                <th>Tgl. Barang Masuk</th>
                                <th>No. Warehouse</th>
                                <th>Nama Barang</th>
                                <th>Tipe Barang</th>
                                <th>Asal Gudang</th>
                                <th>Jumlah Barang</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @include('BarangMasuk.partial.table_item', ['barang_masuk' => $barang_masuk])
                        </tbody>

                    </table>
                    <div class="d-flex justify-content-between p-3">
                        {{-- <div>
                        Menampilkan <b>{{ $barang_masuk->firstItem() }}</b> sampai <b>{{ $barang_masuk->lastItem() }}</b> dari
                        <b>{{ $barang_masuk->total() }}</b> item
                    </div>
                    <div>
                        {{ $barang_masuk->links() }}
                    </div> --}}
                    </div>

                </div>
                <!-- /.card-body -->
            </div>
        </div>
    </div>
    @include('BarangMasuk.modal.form_item')
    @include('Barang.modal.form_item')
    <script>
        $(document).ready(function() {

        });
    </script>
@endsection
