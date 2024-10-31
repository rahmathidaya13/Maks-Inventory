$(document).on("click", "#select_all_stok", function () {
    $(".selected").prop("checked", $(this).prop("checked"));
});
$(document).on("change", ".selected,#select_all_stok", function () {
    // Deteksi perubahan pada checkbox
    let checked = $(".selected:checked").length;
    if (checked > 0) {
        // Jika ada checkbox yang dipilih, aktifkan tombol
        $("#delete_all_stok").prop("disabled", false);
    } else {
        // Jika tidak ada checkbox yang dipilih, nonaktifkan tombol
        $("#delete_all_stok").prop("disabled", true);
    }
});

$(document).on("click", "#delete_all_stok", function (e) {
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
                    url: "/delete/all/stok",
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
$(document).on("click", "#stok_out, #stok_close", function (e) {
    e.preventDefault();
    $("input[name='_method']").remove();
    $("#stokBarangForm").attr("action", "#");
    $("#stokBarangForm")[0].reset();
});

$(document).on("click", "#add_stok_barang", function (e) {
    e.preventDefault();
    $("#stokBarangForm")[0].reset();
    $(".modal-title span").text("Buat Stok Baru");
    $(".modal-title i")
        .removeClass("fas fa-edit")
        .addClass("fas fa-plus-square");
    $("#stok_save span").text("Simpan");
    $("#stok_save i").removeClass("fas fa-edit").addClass("fas fa-save");
    $("#stokBarangForm").attr("action", "/stok/store");
    $("input[name='_method']").remove();
});

$(document).on("change", "#nama_barang", function () {
    let selected = $(this).find("option:selected");
    let getId = selected.data("id");
    let getFirstStok = selected.data("first-stok");
    let getLastStok = selected.data("last-stok");
    let stok_in = selected.data("stok-in");
    let stok_out = selected.data("stok-out");
    // $("input[name='id_barang']").val(selected.data("id"));

    $("#tipe_barang").val("");
    $("#tipe_barang option").each(function () {
        if ($(this).data("id") === getId) {
            $(this).prop("selected", true).trigger("change");
        }
    });
    $("#stok_awal").val(getFirstStok ?? 0);
    $("#stok_akhir").val(getLastStok ?? 0);
    $("#brg_masuk").val(stok_in ?? 0);
    $("#brg_keluar").val(stok_out ?? 0);
});

$(document).on("click", ".ubah_stok", function (e) {
    e.preventDefault();
    let id = $(this).data("id");
    $("#stokBarangForm")[0].reset();
    $(".modal-title span").text("Ubah Data Stok");
    $(".modal-title i")
        .removeClass("fas fa-plus-square")
        .addClass("fas fa-edit ");
    $("#stok_save span").text("Ubah");
    $("#stok_save i").removeClass("fas fa-save").addClass("fas fa-edit");
    $("#stokBarangForm").attr("action", `/stok/update/${id}`);
    $("#stokBarangForm").prepend(
        '<input type="hidden" name="_method" value="PUT">'
    );
    console.log(id);
    $.getJSON(`/stok/detail/${id}`, function (data, textStatus, jqXHR) {
        $("#id_barang").val(data.result.id_barang);
        $("#tgl").val(data.result.tanggal);
        $("#nama_barang").val(data.result.nama_barang).trigger("change");
        $("#tipe_barang").val(data.result.tipe_barang).trigger("change");
        $("#jumlah_barang").val(data.result.stok_akhir);
        $("#keterangan").val(data.result.keterangan);
    });
});

$(document).on("click", ".hapus_stok", function (e) {
    e.preventDefault();
    let id = $(this).data("id");
    let form = $(`#delete_stok_${id}`);
    Swal.fire({
        title: "Apakah kamu yakin?",
        text: `Data Stok ini akan dihapus!`,
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
