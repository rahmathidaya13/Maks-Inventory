function formatCurrency(angka) {
    let number_string, split, sisa, rupiah, ribuan, separator;
    // regex style untuk ubah format teks menjadi angka saja
    number_string = angka.toString().replace(/[^,\d]/g, "");
    split = number_string.split(",");
    sisa = split[0].length % 3;
    rupiah = split[0].substr(0, sisa);
    ribuan = split[0].substr(sisa).match(/\d{3}/gi);

    if (ribuan) {
        separator = sisa ? "." : "";
        rupiah += separator + ribuan.join(".");
    }
    return rupiah;
}

$(document).on("click", "#add_item", function (e) {
    e.preventDefault();
    $("#form_item")[0].reset();
    $(".modal-title span").text("Tambah Barang");
    $(".modal-title i").removeClass("fas fa-edit").addClass("fas fa-box");
    $("#action span").text("Simpan");
    $("#action i").removeClass("fas fa-edit").addClass("fas fa-save");
    $("#form_item").attr("action", "/list-item/store");
    $("input[name='_method']").remove();
});

$(document).on("click", "#keluar, .close", function (e) {
    e.preventDefault();
    if ($("#form_item").length) {
        $("#form_item")[0].reset();
    }
    $("input[name='_method']").remove();
    $("#form_item").attr("action", "#");

    // item for import
    if ($("#import_s").length) {
        $("#import_s")[0].reset();
    }
    $("#preview").attr("src", "assets/icon/iconupload.jpg");
    $("#file-name").text("File not found");
});

// live search
$(document).on("keyup", "#keyword", function (e) {
    e.preventDefault();
    let query = $(this).val();
    if (query === "") {
        $("tbody").load(
            `/item/search?query=${encodeURIComponent(query)}`,
            function () {
                // Kembali ke halaman stok tanpa hasil pencarian
                window.history.pushState({}, "", "/list-item");
            }
        );
        // location.reload();
    } else {
        // encodeURIComponent(query): Digunakan untuk memastikan bahwa spasi dan karakter
        $("tbody").load(
            "/item/search?query=" + encodeURIComponent(query),
            function () {
                $("tbody .nama-barang, .tipe-barang").each(function () {
                    let text = $(this).text();
                    if (query) {
                        // Ganti teks yang cocok dengan teks yang disorot
                        let regex = new RegExp("(" + query + ")", "gi");
                        let highlightedText = text.replace(
                            regex,
                            '<span class="highlight">$1</span>'
                        );
                        $(this).html(highlightedText); // Ganti dengan teks yang disorot
                    } else {
                        $(this).html(text); // Kembalikan ke teks asli
                    }
                });
            }
        );
    }
});

// button edit
$(document).on("click", ".ubah", function (e) {
    e.preventDefault();
    // this variable data
    let id = $(this).data("id");
    $("#form_item")[0].reset();
    $(".modal-title span").text("Ubah Data Barang");
    $(".modal-title i")
        .removeClass("fas fa-plus-square")
        .addClass("fas fa-edit");
    $("#action span").text("Ubah");
    $("#action i").removeClass("fas fa-save").addClass("fas fa-edit");
    $("#form_item").prepend('<input type="hidden" name="_method" value="PUT">');
    $("#form_item").attr("action", "/list-item/update/" + id);

    $.getJSON("/list-item/show/" + id, function (data, textStatus, jqXHR) {
        $("#nama_brg").val(data.result.nama_barang);
        $("#tipe_brg").val(data.result.tipe_barang);
        $("#harga_brg").val(formatCurrency(data.result.harga_barang));
    });
});

// hapuss button
$(document).on("click", ".hapus", function () {
    let id = $(this).data("id");
    let getName = $(this).data("name-type");
    let form = $("#delete_item_" + id);
    // Show SweetAlert confirmation dialog
    Swal.fire({
        title: "Apakah kamu yakin?",
        text: `Data barang ${getName} akan dihapus!`,
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Ya, hapus!",
        cancelButtonText: "Batal",
    }).then((result) => {
        if (result.isConfirmed) {
            // Submit the form if user confirms
            form.submit();
        }
    });
});
// end hapus button

// multiple deleted
$(document).on("click", "#delete_all", function (e) {
    e.preventDefault();
    let selectedItem = $(".selected:checked");
    let csrfToken = $('meta[name="csrf-token"]').attr("content");
    Swal.fire({
        title: "Apakah Anda yakin?",
        text: `${selectedItem.length} Item yang dipilih akan dihapus!`,
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Ya, hapus!",
        cancelButtonText: "Batal",
    }).then((result) => {
        if (result.isConfirmed) {
            if (selectedItem.length > 0) {
                // map to selected item
                let ids = selectedItem
                    .map(function () {
                        return $(this).data("id");
                    })
                    .get();
                $.ajax({
                    url: "/delete_all",
                    type: "DELETE",
                    data: {
                        ids: ids,
                        _token: csrfToken,
                    },
                    success: function (response) {
                        Swal.fire({
                            position: "center",
                            icon: "success",
                            title: `${ids.length} Item berhasil dihapus.`,
                            showConfirmButton: false,
                            timer: 1500,
                        }).then(() => {
                            location.reload();
                        });
                    },
                    error: function (xhr) {
                        Swal.fire({
                            icon: "error",
                            title: "Terjadi kesalahan",
                            text: "Saat menghapus item.",
                        });
                    },
                });
            } else {
                alert("Silakan pilih item yang ingin dihapus.");
            }
        }
    });
});

// set limit row
$(document).on("change", "#offset", function () {
    let offset = $(this).val();
    $("tbody").load("/item/offset?offset=" + offset, function (data) {
        $(this).html(data.table);
        $(".pagination").html(data.pagination);
    });
});
// end set limit

// preview file imports
$(document).on("change", "#imports", function (e) {
    let file = e.target.files[0];
    if (file) {
        let reader = new FileReader();
        reader.onload = function (data) {
            $("#preview").attr("src", "assets/icon/excel.png");
        };
        reader.readAsDataURL(file);
    }
    $("#file-name").text(file.name);
});

// jika dipilih semua maka akan menandai checkbox
$(document).on("click", "#selectAll", function () {
    $(".selected").prop("checked", $(this).prop("checked"));
});

// jika dipilih maka akan mengaktifkan button delete all
$(document).on("change", ".selected,#selectAll", function () {
    // Deteksi perubahan pada checkbox
    let checked = $(".selected:checked").length;
    if (checked > 0) {
        // Jika ada checkbox yang dipilih, aktifkan tombol
        $("#delete_all").prop("disabled", false);
    } else {
        // Jika tidak ada checkbox yang dipilih, nonaktifkan tombol
        $("#delete_all").prop("disabled", true);
    }
});

// format angka input teks agara dapat menjadi format mata uang indonesia
$(document).on("keyup", "#harga_brg", function () {
    let value = $(this).val();
    let formated = value.replace(/[^,\d]/g, "");
    $(this).val(formatCurrency(formated));
});

$(document).on("submit", "#form_item", function () {
    let formatValue = $("#harga_brg").val();
    let unFormated = formatValue.replace(/\./g, "");
    $("#harga_brg").val(unFormated);
});
// end formated value
