function Currency(angka) {
    return new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR",
        minimumFractionDigits: 0,
    })
        .format(angka)
        .replace(/Rp\s/g, "");
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

$(document).on("change", "select[name='nama_brg_transaksi']", function () {
    let selected = $(this).find("option:selected");
    $("input[name='tipe_brg_transaksi']").val(selected.data("type"));
    $("input[name='harga_brg_transaksi']").val(
        Currency(selected.data("price"))
    );
    $("input[name='id_barang']").val(selected.data("id"));
    $("input[name='stok']").val(selected.data("stok"));
});

$("#jumlah_brg_transaksi,#stok").on("input", function () {
    this.value = this.value.replace(/[^0-9]/g, "");
});

$(document).on("keyup", "#total_pembayaran", function () {
    let value = $(this).val();
    let formated = value.replace(/[^,\d]/g, "");
    $(this).val(Currency(formated));
});
