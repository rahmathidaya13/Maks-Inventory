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
                        <div class="input-group input-group-sm">
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
                    <table id="table_items" class="table table-hover text-nowrap">
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
                            @include('Barang.partials.table_item', ['barang' => $barang])
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
        $(document).on("click", "#add_item", function(e) {
            e.preventDefault();
            $("#form_item")[0].reset();
            $(".modal-title span").text('Tambah Barang')
            $(".modal-title i").removeClass('fas fa-edit').addClass('fas fa-box');
            $("#action span").text("Simpan")
            $("#action i").removeClass('fas fa-edit').addClass('fas fa-save');
            $("#form_item").attr('action', '/list-item/store');
            $("input[name='_method']").remove();
        });

        $(document).on("click", "#keluar, .close", function(e) {
            e.preventDefault();
            $("#form_item")[0].reset();
            $("input[name='_method']").remove();
            $("#form_item").attr('action', '#');
        });

        // live search
        $(document).on("keyup", "#keyword", function(e) {
            e.preventDefault();
            let query = $(this).val();
            // encodeURIComponent(query): Digunakan untuk memastikan bahwa spasi dan karakter
            $("tbody").load("/item/search?query=" + encodeURIComponent(query), function() {
                $("tbody .nama-barang, .tipe-barang").each(function() {
                    let text = $(this).text();
                    if (query) {
                        // Ganti teks yang cocok dengan teks yang disorot
                        let regex = new RegExp('(' + query + ')', 'gi');
                        let highlightedText = text.replace(regex,
                            '<span class="highlight">$1</span>');
                        $(this).html(highlightedText); // Ganti dengan teks yang disorot
                    } else {
                        $(this).html(text); // Kembalikan ke teks asli
                    }

                });
            });

        });
        $(document).on("click", ".ubah", function(e) {
            e.preventDefault();
            // this variable data
            let id = $(this).data('id');
            console.log(id);
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
        // uji coba
        $(document).on("click", ".hapus", function() {
            let id = $(this).data('id');
            if (confirm('Apakah kamu yakin ingin menghapus data ini?')) {
                $.ajax({
                    type: "DELETE",
                    url: "/list-item/delete/" + id,
                    data: {
                        _token: '{{ csrf_token() }}', // Menyertakan token CSRF
                    },
                    success: function(response) {
                        alert('Item berhasil dihapus.');
                        $('#table_items tr[data-id="' + id + '"]').remove();
                    }
                });
            }

        });
    </script>
@endsection
