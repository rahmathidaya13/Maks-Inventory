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
                        <div class="ml-2">
                            <button id="delete_all" class="btn btn-sm btn-danger"> <i class="fas fa-trash"></i> Delete
                                all</button>
                        </div>
                    </div>
                    <div class="input-group input-group-sm w-25">
                        <input type="search" name="keyword" id="keyword" class="form-control" placeholder="Search">
                    </div>


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

                // item for import
                $("#import_s")[0].reset();
                $("#preview").attr("src", 'assets/icon/iconupload.jpg');
                $("#file-name").text("File not found");

            });

            // live search
            $(document).on("keyup", "#keyword", function(e) {
                e.preventDefault();
                let query = $(this).val();
                if (query === "") {
                    window.history.pushState("{}", "", "/list-item");
                    location.reload();
                } else {
                    // encodeURIComponent(query): Digunakan untuk memastikan bahwa spasi dan karakter
                    $("tbody").load("/item/search?query=" + encodeURIComponent(query), function() {
                        $("tbody .nama-barang, .tipe-barang").each(function() {
                            let text = $(this).text();
                            if (query) {
                                // Ganti teks yang cocok dengan teks yang disorot
                                let regex = new RegExp('(' + query + ')', 'gi');
                                let highlightedText = text.replace(regex,
                                    '<span class="highlight">$1</span>');
                                $(this).html(
                                    highlightedText); // Ganti dengan teks yang disorot
                            } else {
                                $(this).html(text); // Kembalikan ke teks asli
                            }

                        });
                    });
                }

            });

            $(document).on("click", ".ubah", function(e) {
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
            // hapuss button
            $(document).on("click", ".hapus", function() {
                let id = $(this).data('id');
                let form = $("#delete_item_" + id);

                // Show SweetAlert confirmation dialog
                Swal.fire({
                    title: 'Apakah kamu yakin?',
                    text: "Data barang ini akan dihapus!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, hapus!',
                    cancelButtonText: 'Batal'
                }).then((result) => {
                    if (result.isConfirmed) {
                        form.submit(); // Submit the form if user confirms
                    }
                });
            });

            // set limit row
            $(document).on("change", "#offset", function() {
                let offset = $(this).val();
                $("tbody").load("/item/offset?offset=" + offset, function(data) {
                    $(this).html(data.table);
                    $('.pagination').html(data.pagination);
                });
            });

            // preview file imports
            $(document).on("change", "#imports", function(e) {
                let file = e.target.files[0];
                if (file) {
                    let reader = new FileReader();
                    reader.onload = function(data) {
                        $("#preview").attr("src", 'assets/icon/excel.png');
                    }
                    reader.readAsDataURL(file);
                }
                $("#file-name").text(file.name);

            });

            $(document).on("click", "#selectAll", function() {
                $(".selected").prop("checked", $(this).prop("checked"));
            });

            // multiple deleted
            $(document).on("click", "#delete_all", function(e) {
                e.preventDefault();
                let selectedItem = $(".selected:checked");
                Swal.fire({
                    title: 'Apakah Anda yakin?',
                    text: "Item yang dipilih akan dihapus!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, hapus!',
                    cancelButtonText: 'Batal'
                }).then((result) => {
                    if (result.isConfirmed) {
                        if (selectedItem.length > 0) {
                            // map to selected item
                            let ids = selectedItem.map(function() {
                                return $(this).data("id");
                            }).get();
                            $.ajax({
                                url: "{{ route('deleteAll') }}",
                                type: "DELETE",
                                data: {
                                    ids: ids,
                                    _token: "{{ csrf_token() }}"
                                },
                                success: function(response) {
                                    Swal.fire({
                                        position: "center",
                                        icon: "success",
                                        title: `${ids.length} Item berhasil dihapus.`,
                                        showConfirmButton: false,
                                        timer: 1500
                                    }).then(() => {
                                        location.reload();

                                        // lakukan perulangan dalam array dan ambil row berdasarkan id
                                        // ids.forEach(function(id) {
                                        //     $("#barang_item" + id)
                                        //         .remove();
                                        // });
                                        // // lakukan didalam perulangan untuk merefresh no tabel
                                        // $("table tbody tr").each(function(
                                        //     index) {
                                        //     $(this).find("#number")
                                        //         .text(index + 1)
                                        // });
                                        // // load data setiap kali ada yang terhapus sesuaikan dengan set offset 10
                                        // $("tbody").load(
                                        //     "/item/offset?offset=" + 10);
                                    });
                                },
                                error: function(xhr) {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Terjadi kesalahan',
                                        text: 'Saat menghapus item.',
                                    });
                                }
                            });
                        } else {
                            alert("Silakan pilih item yang ingin dihapus.");
                        }
                    }
                });
                // console.log(id);
                // $("input:checkbox[name=ids]:checked").each(function() {
                //     ids.push($(this).val());
                // });
            });
            $("#example1").DataTable({
                "responsive": true,
                "lengthChange": false,
                "autoWidth": false,

            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        });
    </script>
@endsection
