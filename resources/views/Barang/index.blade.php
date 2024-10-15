@extends('layouts.app')
@section('title', 'Daftar Barang')
@section('breadcrumb', 'Daftar Barang')
@section('icon', 'fas fa-box')
@section('content')
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-lg-12 col-12">
            @if ($message = Session::get('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong> <i class="fas fa-check-circle"></i> {{ $message }}</strong>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            @endif

            <div class="card">
                <div class="card-header">
                    <div class="card-tools">
                        <div class="input-group input-group-sm" style="width: 150px;">
                            <input type="text" name="keyword" id="keyword" class="form-control float-right"
                                placeholder="Search">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-default">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Barang</th>
                                <th>Tipe Barang</th>
                                <th>Harga</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($barang as $data)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $data->nama_barang }}</td>
                                    <td>{{ $data->tipe_barang }}</td>
                                    <td>{{ 'Rp ' . $data->harga_barang }}</td>
                                    <td>
                                        <button data-toggle="modal" data-target="#staticBackdrop"
                                            data-id="{{ $data->id_barang }}" type="button"
                                            class="btn btn-warning btn-sm ubah"><i class="fas fa-edit"></i>
                                            <span>Ubah</span></button>
                                        <button data-id="{{ $data->id_barang }}" type="button"
                                            class="btn btn-danger btn-sm hapus" href=""><i class="fas fa-trash"></i>
                                            <span>Hapus</span></button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
    </div>
    @include('Barang.modal.form_item')
    @include('Barang.modal.form_import')
    <script>
        $(document).ready(function() {

            $("#add_item").click(function(e) {
                e.preventDefault();
                $("#form_item")[0].reset();
                $(".modal-title span").text('Tambah Barang')
                $(".modal-title i").removeClass('fas fa-edit').addClass('fas fa-box');
                $("#action span").text("Simpan")
                $("#action i").removeClass('fas fa-edit').addClass('fas fa-save');
                $("#form_item").attr('action', '/list-item/store');
                $("input[name='_method']").remove();

            });
            $(".ubah").click(function(e) {
                e.preventDefault();
                // this variable data
                let id = $(this).data('id');

                $("#form_item")[0].reset();
                $(".modal-title span").text('Ubah Data Barang')
                $(".modal-title i").removeClass('fas fa-plus-square').addClass('fas fa-edit');
                $("#action span").text("Ubah")
                $("#action i").removeClass('fas fa-save').addClass('fas fa-edit');
                $('#form_item').prepend('<input type="hidden" name="_method" value="PUT">');
                $("#form_item").attr('action', '/list-item/update/' + id);

                $.getJSON("/list-item/show/" + id,
                    function(data, textStatus, jqXHR) {
                        $("#nama_brg").val(jqXHR.responseJSON.nama_barang);
                        $("#tipe_brg").val(jqXHR.responseJSON.tipe_barang);
                        $("#harga_brg").val(jqXHR.responseJSON.harga_barang);
                    }
                );
            });
            $("#keluar,.close").click(function (e) {
                e.preventDefault();
                $("#form_item")[0].reset();
                $("input[name='_method']").remove();
                $("#form_item").attr('action', '#');
            });
            $("#keyword").keyup(function (e) {
                let query = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "/item/search/",
                    data: {query : query},
                    success: function (response) {
                        console.log(response);
                    }
                });
            });
        });
    </script>
@endsection
