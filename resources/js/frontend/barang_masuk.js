// button untuk menambahkan barang masuk
$(document).on("click", "#add_item_list", function (e) {
    e.preventDefault();
    $("#barangmasuk")[0].reset();
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
$(document).on("click", "#act_keluar, #act_close", function (e) {
    e.preventDefault();
    if ($("#barangmasuk").length) {
        $("#barangmasuk")[0].reset("");
    }
    $("#nama_barang").trigger("change");
    $("#tipe_brg").trigger("change");
    $("input[name='_method']").remove();
    $("#barangmasuk").attr("action", "#");
});

// get name dan get id_barangmasuk
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
        if(konsumen.val() !== '-'){
            $("#konsumen").prop("readonly", false);
        }else{
            $("#konsumen").prop("readonly", true);
        }
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
    if (checked > 0) {
        // Jika ada checkbox yang dipilih, aktifkan tombol
        $("#delete_all").prop("disabled", false);
    } else {
        // Jika tidak ada checkbox yang dipilih, nonaktifkan tombol
        $("#delete_all").prop("disabled", true);
    }
});

// button hapus satu file
$(document).on("click", ".hapus_brg_masuk", function () {
    let id = $(this).data("id");
    let getNameType = $(this).data("name-type");
    let form = $("#delete_items_" + id);
    // Show SweetAlert confirmation dialog
    Swal.fire({
        title: "Apakah kamu yakin?",
        text: `${getNameType} ini akan dihapus!`,
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
