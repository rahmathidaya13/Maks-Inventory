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
    if ($("#form_item").length) {
        $("#form_item")[0].reset();
    }
    $("input[name='_method']").remove();
    $("#form_item").attr('action', '#');

    // item for import
    if ($("#import_s").length) {
        $("#import_s")[0].reset();
    }
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
    let csrfToken = $('meta[name="csrf-token"]').attr('content');
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
                    url: "/delete_all",
                    type: "DELETE",
                    data: {
                        ids: ids,
                        _token: csrfToken
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
});

