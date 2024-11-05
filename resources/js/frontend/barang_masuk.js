function ConvertDate(dates) {
    let day, month, year, dateOriginParsed, Formated;
    dateOriginParsed = new Date(dates);

    day = String(dateOriginParsed.getDate()).padStart(2, "0");
    month = String(dateOriginParsed.getMonth() + 1).padStart(2, "0");
    year = dateOriginParsed.getFullYear();

    Formated = day + "/" + month + "/" + year;
    return Formated;
}

// button untuk menambahkan barang masuk
$(document).on("click", "#add_item_list", function (e) {
    e.preventDefault();
    $("#barangmasuk")[0].reset();
    $("#brg_masuk")[0].reset();

    $(".modal-title span").text("Tambah Barang Masuk");
    $(".modal-title i")
        .removeClass("fas fa-edit")
        .addClass("fas fa-plus-square");
    $("#aksi_brg_masuk span").text("Simpan");
    $("#aksi_brg_masuk i").removeClass("fas fa-edit").addClass("fas fa-save");
    $("#barangmasuk").attr("action", "/barang_masuk/store");
    $("input[name='_method']").remove();
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
        $("#tipe_barang_masuk").trigger("change");
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
        // console.log($("#update_form_stok").length);
    }
);

// get name and get id_barang
$(document).on("change", "#nama_barang", function (e) {
    e.preventDefault();
    let selected = $(this).find(":selected");
    let dataId = selected.data("id");
    $("#id_barang").val(dataId);
});

// set input hanya terima angka saja
$("#jumlah_brg").on("input", function () {
    this.value = this.value.replace(/[^0-9]/g, "");
});

// include action add item from file barang
$(document).on("click", "#add_item", function (e) {
    e.preventDefault();
    $("#form_item")[0].reset();
    $("#brg_masuk")[0].reset();
    $("#barangmasuk")[0].reset();
    $("#filter_date")[0].reset();

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
    let id = $(this).data("id");
    $("#barangmasuk")[0].reset();
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
        // console.log(data);
        $("#id_barang").val(data.result.id_barang);
        $("#tgl_brg_masuk").val(data.result.tgl_brg_masuk);
        $("#no_warehouse").val(data.result.no_warehouse);
        $("#nama_barang").val(data.result.nama_barang).trigger("change");
        $("#tipe_barang_masuk").val(data.result.tipe_barang).trigger("change");
        $("#asal_gdg").val(data.result.asal_gudang);
        $("#jumlah_brg").val(data.result.jumlah_barang);
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
    console.log();
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
$(document).on("keyup", "#keyword_brg_masuk", function (e) {
    e.preventDefault();
    let query = $(this).val();
    if (query === "") {
        $("tbody").load(
            `/barang_masuk/search?query=${encodeURIComponent(query)}`,
            function () {
                // Kembali ke halaman stok tanpa hasil pencarian
                window.history.pushState({}, "", "/barang_masuk");
            }
        );
        // location.reload();
    } else {
        // encodeURIComponent(query): Digunakan untuk memastikan bahwa spasi dan karakter
        $("tbody").load(
            "/barang_masuk/search?query=" + encodeURIComponent(query),
            function () {
                $("tbody .nama_brg_masuk, .tipe_brg_masuk").each(function () {
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

// filter data
$(document).on("change", "#filter_brg_masuk", function () {
    let limit = $(this).val();
    $("tbody").load("/barang_masuk/filter?limit=" + limit, function (data) {
        $(this).html(data.table);
        $(".pagination").html(data.pagination);
    });
});
// end filter data

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

$(document).on("click", ".perbarui_stok", function () {
    let id = $(this).data("id");
    let date = $(this).data("date");
    $("#update_form_stok")[0].reset();
    $("#update_form_stok").prepend(
        '<input type="hidden" name="_method" value="PUT">'
    );

    // $.getJSON("barang_masuk/detail/" + id, function (data, textStatus, jqXHR) {
    //     // console.log(data);
    //     $("input[name='id_masuk_brg']")
    //         .val(data.result.id_brg_masuk)
    //         .attr("readonly", true);
    //     $("input[name='jumlah_barang_masuk']").val(data.result.jumlah_barang);
    //     //
    // });

    $.getJSON(
        "/stok/detail/" + id + "/" + date,
        function (data, textStatus, jqXHR) {
            console.log(data);
            // $("input[name='id_stok']")
            //     .val(data.result.id_stok)
            //     .attr("readonly", true);
            // $("#update_form_stok").attr("action", "/stok/update/" + data.result.id_stok);

            // $("input[name='jumlah_stok_awal']")
            //     .val(data.result.stok_awal)
            //     .attr("readonly", true);
            // $("input[name='jumlah_stok_akhir']")
            //     .val(data.result.stok_akhir)
            //     .attr("readonly", true);
            // $("input[name='jumlah_stok_tersedia']")
            //     .val(data.result.stok_saat_ini)
            //     .attr("readonly", true);

            // $("#stok_update:first td").eq(0).text(data.result.tanggal);
            // $("#stok_update:first td").eq(1).text(data.result.nama_barang);
            // $("#stok_update:first td").eq(2).text(data.result.tipe_barang);
            // $("#stok_update:first td").eq(3).text(data.result.stok_awal);
            // $("#stok_update:first td").eq(4).text(data.result.stok_akhir);
            // $("#stok_update:first td").eq(5).text(data.result.stok_saat_ini);
        }
    );
});

$(document).on("click", "#export_barang_masuk", function (e) {
    e.preventDefault();
    $("#barangmasuk")[0].reset();
    $("#brg_masuk")[0].reset();
    $("#filter_date")[0].reset();
    $(".modal-title span").text("Export Barang Masuk");
    $(".modal-title i").removeClass("fas fa-edit");
    $(".modal-title i").removeClass("fas fa-plus-square");
    $(".modal-title i").addClass("fas fa-file-export");
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
            // console.log(data);
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
    $("#barangmasuk")[0].reset();
    $("#brg_masuk")[0].reset();
    $("#filter_date")[0].reset();
    $(".modal-title span").text("Upload File");
    $(".modal-title i").removeClass("fas fa-edit");
    $(".modal-title i").removeClass("fas fa-plus-square");
    $(".modal-title i").addClass("fas fa-file-upload");
});


