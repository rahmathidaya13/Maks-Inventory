function ConvertDate(dates) {
    let day, month, year, dateOriginParsed, Formated;
    dateOriginParsed = new Date(dates);

    day = String(dateOriginParsed.getDate()).padStart(2, "0");
    month = String(dateOriginParsed.getMonth() + 1).padStart(2, "0");
    year = dateOriginParsed.getFullYear();

    Formated = day + "/" + month + "/" + year;
    return Formated;
}

// fungsi untuk aktifkan button ketika semua field terisi
function validateForm(form, button) {
    let isValid = true;
    $(form)
        .find("input,select")
        .each(function () {
            if ($(this).val() === "") {
                isValid = false;
                return false;
            }
        });
    $(button).prop("disabled", !isValid);
}
$("#barangmasuk").on("input", function () {
    validateForm("#barangmasuk", ".simpan_barang_masuk");
});
$("#filter_date").on("input", function () {
    validateForm("#filter_date", ".act_filter");
});

// end fungsi aktifkan button
// button untuk menambahkan barang masuk
$(document).on("click", "#add_item_list", function (e) {
    e.preventDefault();
    if ($("#barangmasuk").length > 0) {
        $("#barangmasuk")[0].reset();
    }
    if ($("#brg_masuk").length > 0) {
        $("#brg_masuk")[0].reset();
    }
    $(".modal-title span").text("Tambah Barang Masuk");
    $(".modal-title i")
        .removeClass("fas fa-edit")
        .addClass("fas fa-plus-square");
    $("#aksi_brg_masuk span").text("Simpan");
    $("#aksi_brg_masuk i").removeClass("fas fa-edit").addClass("fas fa-save");
    $("#barangmasuk").attr("action", "/barang_masuk/store");
    $("input[name='_method']").remove();
    $(".simpan_barang_masuk").prop("disabled", true);
});

// fungsi untuk button keluar modal dan mereset form
$(document).on(
    "click",
    ".act_stok_close ,#act_stok_close,#act_close,#act_keluar",
    function (e) {
        e.preventDefault();
        if ($("#barangmasuk").length > 0) {
            $("#barangmasuk")[0].reset();
        }
        $("#nama_barang").trigger("change");
        // $("#tipe_barang_masuk").trigger("change");
        $("input[name='_method']").remove();
        $("#barangmasuk").attr("action", "#");

        if ($("#brg_masuk").length > 0) {
            $("#brg_masuk")[0].reset();
        }
        $("#preview").attr("src", "assets/icon/iconupload.jpg");
        $("#file-name").text("File not found");

        if ($("#update_form_stok").length > 0) {
            $("#update_form_stok")[0].reset();
        }
        $("#update_form_stok").attr("action", "#");
    }
);

// get name and get id_barang
$(document).on("change", "#nama_barang", function (e) {
    e.preventDefault();
    let selected = $(this).find(":selected");
    let dataId = selected.data("id");
    $("#id_barang").val(dataId);
    $("#tipe_barang_masuk").val(selected.data("type") ?? "-");
});

// set input hanya terima angka saja
$("#jumlah_brg,#kode_barang_brg_masuk").on("input", function () {
    this.value = this.value.replace(/[^0-9]/g, "");
});

// include action add item from file barang
$(document).on("click", "#add_item", function (e) {
    e.preventDefault();
    $(".simpan_barang_masuk").prop("disabled", true);
    $("#form_item")[0].reset();
    if ($("#brg_masuk").length > 0) {
        $("#brg_masuk")[0].reset();
    }
    if ($("#barangmasuk").length > 0) {
        $("#barangmasuk")[0].reset();
    }
    if ($("#filter_date").length > 0) {
        $("#filter_date")[0].reset();
    }

    $(".modal-title span").text("Tambah Barang");
    $(".modal-title i").removeClass("fas fa-edit").addClass("fas fa-box");
    $("#aksi_brg_masuk span").text("Simpan");
    $("#aksi_brg_masuk i").removeClass("fas fa-edit").addClass("fas fa-save");
    $("#form_item").attr("action", "/list-item/store");
    $("input[name='_method']").remove();
});

// fungsi untuk button edit barang masuk
$(document).on("click", ".ubah_barang_masuk", function (e) {
    e.preventDefault();
    // this variable data
    $(".simpan_barang_masuk").prop("disabled", false);
    let id = $(this).data("id");
    if ($("#barangmasuk").length > 0) {
        $("#barangmasuk")[0].reset();
    }
    $(".modal-title span").text("Ubah Data Barang Masuk");
    $(".modal-title i")
        .removeClass("fas fa-plus-square")
        .addClass("fas fa-edit");
    $("#aksi_brg_masuk span").text("Ubah");
    $("#aksi_brg_masuk i").removeClass("fas fa-save").addClass("fas fa-edit");
    $("#barangmasuk").prepend(
        '<input type="hidden" name="_method" value="PUT">'
    );
    $("#barangmasuk").attr("action", "/barang_masuk/update/" + id);
    $.getJSON("/barang_masuk/detail/" + id, function (data, textStatus, jqXHR) {
        let idBarang = data.result.id_barang;
        $("#id_barang").val(data.result.id_barang);
        $("#tgl_brg_masuk").val(data.result.tgl_brg_masuk);
        $("#no_warehouse").val(data.result.no_warehouse);
        $("#kode_barang_brg_masuk").val(data.result.kode_barang);

        $("#nama_barang").val(null);
        $('#nama_barang option').filter(function() {
            return $(this).data('id') == idBarang;
        }).prop('selected', true);
        $('#nama_barang').trigger('change');

        $("#tipe_barang_masuk").val(data.result.tipe_barang);
        $("#asal_gdg").val(data.result.asal_gudang);
        $("#jumlah_brg").val(data.result.jumlah_barang);
        $("#posisi_brg_masuk").val(data.result.posisi).trigger("change");
        $("#status").val(data.result.status);
        let konsumen = $("#konsumen").val(data.result.nama_konsumen);
        konsumen.val() !== "-"
            ? $("#konsumen").prop("readonly", false)
            : $("#konsumen").prop("readonly", true);
    });
});

// jika dipilih semua maka akan menandai item checkbox
$(document).on("click", "#selectAllItem", function () {
    $(".selected_").prop("checked", $(this).prop("checked"));
});

// jika dipilih  maka akan mengaktifkan button delete all
$(document).on("change", ".selected_,#selectAllItem", function () {
    // Deteksi perubahan pada checkbox
    let checked = $(".selected_:checked").length;
    // Jika ada checkbox yang dipilih, aktifkan tombol
    checked > 0
        ? $("#delete_all_brg_masuk").prop("disabled", false)
        : $("#delete_all_brg_masuk").prop("disabled", true);
});

// multiple deleted Data
$(document).on("click", "#delete_all_brg_masuk", function (e) {
    e.preventDefault();
    let selectedItem = $(".selected_:checked");
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
                    url: "/delete/barang_masuk",
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

// button hapus satu file
$(document).on("click", ".hapus_brg_masuk", function () {
    let id = $(this).data("id");
    let dates = $(this).data("date");
    let getNameType = $(this).data("name-type");
    let form = $("#delete_items_" + id);
    // Show SweetAlert confirmation dialog
    Swal.fire({
        title: "Apakah kamu yakin?",
        text: `Barang tanggal ${ConvertDate(
            dates
        )} ${getNameType} ini akan dihapus!`,
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Ya, hapus!",
        cancelButtonText: "Batal",
    }).then((result) => {
        if (result.isConfirmed) {
            form.submit();
        }
    });
});

// trigger element status untuk aktifkan input nama konsumen
$(document).on("change", "#status", function (e) {
    e.preventDefault();
    let value = $(this).val();
    if (value == "customer") {
        $("#konsumen").prop("readonly", false).val("");
    } else {
        $("#konsumen").prop("readonly", true).val("-");
    }
});

// fungsi untuk pencarian data langsung
$(document).on("input", "#keyword_brg_masuk", function (e) {
    e.preventDefault();
    let query = $(this).val();
    let token = $('meta[name="csrf-token"]').attr("content");
    let url;
    // cek url jika ada kembali ke method pencarian jika tidak kembali ke metok filter saja
    if (!query) {
        url = "/barang_masuk/filter";
    } else {
        url = "/barang_masuk/search";
    }

    $.ajax({
        type: "GET",
        url: url,
        data: {
            itemInQuery: query,
            _token: token,
            barangMasukLimit: 10,
        },
        success: function (data) {
            if (!query) {
                $("tbody#tableBarangMasuk").html(data.table);
                $(".pagination-wrapper").html(data.pagination);
                $("#info-barang_masuk-page").html(
                    `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${
                        data.info.lastItem ?? 0
                    }</b> dari <b>${data.info.total ?? 0}</b> item`
                );
            } else {
                $("tbody#tableBarangMasuk").html(data.table);
                $(".pagination-wrapper").html(data.pagination);
                $("#info-barang_masuk-page").html(
                    `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${
                        data.info.lastItem ?? 0
                    }</b> dari <b>${data.info.total ?? 0}</b> item`
                );

                $(
                    "tbody#tableBarangMasuk .nama_brg_masuk, .tipe_brg_masuk"
                ).each(function () {
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
        },
    });
});

// filter data

$(document).on("change", "#filter_brg_masuk", function () {
    let offset = $(this).val();
    let token = $('meta[name="csrf-token"]').attr("content");
    $.ajax({
        type: "GET",
        url: "/barang_masuk/filter",
        data: {
            barangMasukLimit: offset,
            _token: token,
        },
        success: function (data) {
            $("tbody#tableBarangMasuk").html(data.table);
            $(".pagination-wrapper").html(data.pagination);
            $("#info-barang_masuk-page").html(
                `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${
                    data.info.lastItem ?? 0
                }</b> dari <b>${data.info.total ?? 0}</b> item`
            );
        },
    });
});
// end filter data

$(document).on("click", ".pagination a", function (e) {
    e.preventDefault(); // Cegah reload halaman
    let url = $(this).attr("href"); // Ambil URL dari pagination link
    let offset = $("#filter_brg_masuk").val(); // Ambil nilai offset dari dropdown

    // Tambahkan parameter offset ke URL
    url = new URL(url);
    url.searchParams.set("barangMasukLimit", offset);
    // Lakukan AJAX
    $.ajax({
        url: url.toString(),
        type: "GET",
        success: function (data) {
            // Perbarui tabel dan pagination
            $("tbody#tableBarangMasuk").html(data.table);
            $(".pagination-wrapper").html(data.pagination);
            $("#info-barang_masuk-page").html(
                `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${
                    data.info.lastItem ?? 0
                }</b> dari <b>${data.info.total ?? 0}</b> item`
            );
        },
    });
});

// preview file imports
$(document).on("change", "#import_brg_masuk", function (e) {
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

$(document).on("click", "#export_barang_masuk", function (e) {
    e.preventDefault();
    if ($("#barangmasuk").length > 0) {
        $("#barangmasuk")[0].reset();
    }
    if ($("#brg_masuk").length > 0) {
        $("#brg_masuk")[0].reset();
    }
    if ($("#filter_date").length > 0) {
        $("#filter_date")[0].reset();
    }
    $(".modal-title span").text("Export File");
    $(".modal-title i").removeClass("fas fa-edit");
    $(".modal-title i").removeClass("fas fa-plus-square");
    $(".modal-title i").addClass("fas fa-download");
});

$(document).on("click", "#set_brg_masuk", function (e) {
    e.preventDefault();
    let start_date = $("#start_date_brg_masuk").val();
    let end_date = $("#end_date_brg_masuk").val();
    // filter tanggal
    $.ajax({
        type: "POST",
        url: "/barang_masuk/filter/date",
        data: {
            _token: $('meta[name="csrf-token"]').attr("content"),
            start_date: start_date,
            end_date: end_date,
        },
        success: function (data) {
            $("tbody").html(data);
            $(".pagination").html(data.pagination);
        },
        error: function (xhr) {
            if (xhr.status === 422) {
                let errors = xhr.responseJSON.errors;
                let errorMessage = "";

                if (errors.start_date) {
                    errorMessage += errors.start_date[0] + "<br>";
                }
                if (errors.end_date) {
                    errorMessage += errors.end_date[0] + "<br>";
                }

                // Tampilkan pesan error menggunakan SweetAlert
                Swal.fire({
                    icon: "warning",
                    title: "Validasi tanggal gagal",
                    // html: "Masukan tanggal yang valid", // Tampilkan error dalam format HTML
                    confirmButtonText: "OK",
                });
            }
        },
    });
});

$(document).on("click", "#import_item_list", function (e) {
    e.preventDefault();
    if ($("#barangmasuk").length > 0) {
        $("#barangmasuk")[0].reset();
    }
    if ($("#brg_masuk").length > 0) {
        $("#brg_masuk")[0].reset();
    }
    if ($("#filter_date").length > 0) {
        $("#filter_date")[0].reset();
    }
    $(".modal-title span").text("Upload File");
    $(".modal-title i").removeClass("fas fa-edit");
    $(".modal-title i").removeClass("fas fa-plus-square");
    $(".modal-title i").addClass("fas fa-file-upload");
});

// trigger filter
$("#filter_brg_masuk").val(10).trigger("change");
