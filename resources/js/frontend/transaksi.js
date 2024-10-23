function formatCurrency(angka) {
    var formatRupiah = new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR",
        minimumFractionDigits: 0, // Ubah jika ingin ada pecahan
    }).format(angka).replace(/Rp\s/g, '');;

    return formatRupiah;
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
        formatCurrency(selected.data("price"))
    );
});
$(document).on("submit", "#form_transaksi", function () {
    let formatValue = $("#harga_brg_transaksi").val();
    let unFormated = formatValue.replace(/\./g, "");
    $("#harga_brg_transaksi").val(unFormated);
});
