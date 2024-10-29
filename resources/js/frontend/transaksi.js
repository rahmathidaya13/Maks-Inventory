function Currency(angka) {
    return new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR",
        minimumFractionDigits: 0,
    })
        .format(angka)
        .replace(/Rp\s/g, "");
}

function ConvertDate(dates) {
    let day, month, year, dateOriginParsed, Formated;
    dateOriginParsed = new Date(dates);

    day = String(dateOriginParsed.getDate()).padStart(2, "0");
    month = String(dateOriginParsed.getMonth() + 1).padStart(2, "0");
    year = dateOriginParsed.getFullYear();

    Formated = day + "/" + month + "/" + year;
    return Formated;
}

// Fungsi untuk menghilangkan format titik dan ubah ke integer
function parseCurrency(value) {
    // Jika value kosong atau tidak valid, kembalikan 0
    return value ? parseInt(value.replace(/\./g, "")) : 0; // Hapus titik dan ubah ke angka
}
$(document).on("click", "#add_transaksi", function (e) {
    e.preventDefault();
    $("#form_transaksi")[0].reset();
    $(".modal-title span").text("Buat Transaksi");
    $(".modal-title i")
        .removeClass("fas fa-edit")
        .addClass("fas fa-plus-square");
    $("#transaksi_aksi span").text("Simpan");
    $("#transaksi_aksi i").removeClass("fas fa-edit").addClass("fas fa-save");
    $("#form_transaksi").attr("action", "/transaksi/store");
    $("input[name='_method']").remove();
});

$(document).on("click", ".ubah_transaksi", function (e) {
    e.preventDefault();
    let id = $(this).data("id");
    $("#form_transaksi")[0].reset();
    $(".modal-title span").text("Ubah Data Transaksi");
    $(".modal-title i")
        .removeClass("fas fa-plus-square")
        .addClass("fas fa-edit ");
    $("#transaksi_aksi span").text("Ubah");
    $("#transaksi_aksi i").removeClass("fas fa-save").addClass("fas fa-edit");
    $("#form_transaksi").attr("action", `/transaksi/store`);
    // $("#form_transaksi").prepend(
    //     '<input type="hidden" name="_method" value="PUT">'
    // );

    $.getJSON(`/transaksi/detail/${id}`, function (data, textStatus, jqXHR) {
        console.log(data);
        $("#id_barang").val(data.result.id_barang);
        $("#id_stok").val(data.result.id_stok);
        $("#transaksi").val(data.result.tgl_transaksi);
        $("#kode_transaksi").val(data.result.kode_transaksi);
        $("#nama_konsumen").val(data.result.nama_konsumen);
        $("#nohp").val(data.result.no_handphone);
        $("#alamat").val(data.result.alamat);
        $("#sales").val(data.result.nama_sales);
        $("#nama_brg_transaksi").val(data.result.nama_barang).trigger("change");
        $("#tipe_brg_transaksi").val(data.result.tipe_barang);
        $("#harga_brg_transaksi").val(Currency(data.result.harga_barang));
        $("#jumlah_brg_transaksi")
            .val(data.result.jumlah_barang)
            .prop("readonly", data.result.jumlah_barang > 0 ? false : true);
        $("#status_pembayaran")
            .val(data.result.status_pembayaran)
            .trigger("change");
        $("#diskon")
            .val(parseInt(data.result.diskon))
            .prop("readonly", data.result.diskon > 0 ? false : true);
        $("#dp").val(Currency(data.result.dana_pertama));
        $("#pembayaran")
            .val(Currency(data.result.pembayaran))
            .prop("readonly", data.result.pembayaran > 0 ? false : true);
        $("#total_pembayaran").val(Currency(data.result.total_pembayaran));
        $("#selisih").val(Currency(data.result.selisih_pembayaran));
    });
});

$(document).on("click", ".hapus_transaksi", function () {
    let id = $(this).data("id");
    let customer = $(this).data("customer");
    let kode = $(this).data("code");
    let tanggal = ConvertDate($(this).data("date"));
    let form = $("#delete_transaksi_" + id);
    // Show SweetAlert confirmation dialog
    Swal.fire({
        title: "Apakah kamu yakin?",
        text: `Data transaksi ( ${tanggal} - ${kode} - ${customer} ) akan dihapus!`,
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

// trigger button hapus semua item pada tabel
$(document).on("click", "#select_all_transaksi", function () {
    $(".selected").prop("checked", $(this).prop("checked"));
});

$(document).on("click", "#delete_all_transaksi", function (e) {
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
                    url: "/delete/transaksi",
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
$(document).on("change", ".selected,#select_all_transaksi", function () {
    // Deteksi perubahan pada checkbox
    let checked = $(".selected:checked").length;
    if (checked > 0) {
        // Jika ada checkbox yang dipilih, aktifkan tombol
        $("#delete_all_transaksi").prop("disabled", false);
    } else {
        // Jika tidak ada checkbox yang dipilih, nonaktifkan tombol
        $("#delete_all_transaksi").prop("disabled", true);
    }
});
// end trigger button hapus semua

// aksi untuk element input dan select
$(document).on("change", "#nama_brg_transaksi", function () {
    let selected = $(this).find("option:selected");
    let value = selected.val();
    $("input[name='tipe_brg_transaksi']").val(selected.data("type") ?? "-");
    $("input[name='harga_brg_transaksi']").val(
        Currency(selected.data("price") ?? 0)
    );
    $("input[name='id_barang']").val(selected.data("id"));
    $("input[name='stok']").val(selected.data("stok"));
    $("input[name='id_stok']").val(selected.data("id-stok"));
});

$(document).on("input", "#pembayaran", function () {
    let pembayaran = parseCurrency($(this).val());
    let total_pembayaran = parseCurrency($("#total_pembayaran").val());

    // Hilangkan format mata uang dan lakukan operasi pengurangan
    let selisih = total_pembayaran - pembayaran;
    // Jika total pembayaran lebih besar dari harga barang, jadikan selisih 0
    if (selisih < 0) {
        selisih = 0;
    }
    // Pastikan jika selisih NaN atau tidak valid, di-set ke 0
    selisih = isNaN(selisih) ? 0 : selisih;
    $("input[name='selisih']").val(Currency(selisih));
});

// ubah format input text hanya bisa terima angka saja
$("#jumlah_brg_transaksi,#stok,#diskon,#harga_diskon,#dp").on(
    "input",
    function () {
        this.value = this.value.replace(/[^0-9]/g, "");
    }
);

$(document).on("keyup", "#pembayaran", function () {
    let value = $(this).val();
    let formated = value.replace(/[^,\d]/g, "");
    $(this).val(Currency(formated));
    console.log(value);
});

$(document).on("input", "#diskon", function () {
    let diskon = parseCurrency($(this).val());
    let hasil = parseCurrency($("#hasil").val());
    let hargaDiskon = hasil - hasil * (diskon / 100);
    $("#total_pembayaran").val(Currency(hargaDiskon));
    console.log(hargaDiskon);
    if ($(this).val().length > 0) {
        $("#pembayaran").prop("readonly", false);
    } else {
        $("#pembayaran").prop("readonly", true);
    }
});

$(document).on("input", "#jumlah_brg_transaksi", function () {
    let jumlah_barang = parseInt($(this).val());
    let harga_barang = parseCurrency($("#harga_brg_transaksi").val());
    let count = jumlah_barang * harga_barang;

    count = isNaN(count) ? 0 : count;
    $("#hasil").val(Currency(count));
    $("#total_pembayaran").val(Currency(count));
    if (!jumlah_barang > 0 || !jumlah_barang === "") {
        $("#pembayaran").prop("readonly", true);
        $("#diskon").prop("readonly", true);
    } else {
        $("#pembayaran").prop("readonly", false);
        $("#diskon").prop("readonly", false);
    }
});

$(document).on("change", "#status_pembayaran", function () {
    let selected = $(this).find("option:selected");
    let value = selected.val();
    if (value !== "lunas") {
        $("#jumlah_brg_transaksi").prop("readonly", true);
        $("#dp").prop("readonly", false);
        $("#dp").val(0);
        // $("#diskon").prop("readonly", false);
    } else {
        $("#jumlah_brg_transaksi").prop("readonly", false);
        $("#dp").val(0);
        $("#dp").prop("readonly", true);
        // $("#diskon").prop("readonly", true);
    }
});

$(document).on("input", "#dp", function () {
    let value = $(this).val();
    let formated = value.replace(/[^,\d]/g, "");
    $(this).val(Currency(formated));
    if (value.length > 0) {
        $("#jumlah_brg_transaksi").prop("readonly", false);
    } else {
        $("#jumlah_brg_transaksi").prop("readonly", true);
    }
});
// end aksi untuk element input dan select
