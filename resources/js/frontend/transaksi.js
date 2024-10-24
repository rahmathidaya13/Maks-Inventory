function Currency(angka) {
    return new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR",
        minimumFractionDigits: 0,
    })
        .format(angka)
        .replace(/Rp\s/g, "");
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

$(document).on("change", "select[name='nama_brg_transaksi']", function () {
    let selected = $(this).find("option:selected");
    $("input[name='tipe_brg_transaksi']").val(selected.data("type"));
    $("input[name='harga_brg_transaksi']").val(
        Currency(selected.data("price"))
    );
    $("input[name='id_barang']").val(selected.data("id"));
    $("input[name='stok']").val(selected.data("stok") ?? 0);
});

$(document).on("input", "#total_pembayaran", function () {
    let hargaBarang = $("input[name='harga_brg_transaksi']").val();
    let totalPemBayaran = $(this).val();

    // Hilangkan format mata uang dan lakukan operasi pengurangan
    let selisih = parseCurrency(hargaBarang) - parseCurrency(totalPemBayaran);
    // Jika total pembayaran lebih besar dari harga barang, jadikan selisih 0
    if (selisih < 0) {
        selisih = 0;
    }
    // Pastikan jika selisih NaN atau tidak valid, di-set ke 0
    selisih = isNaN(selisih) ? 0 : selisih;
    $("input[name='selisih']").val(Currency(selisih));
    console.log(selisih);
});

// ubah format input text hanya bisa terima angka saja
$("#jumlah_brg_transaksi,#stok,#diskon,#harga_diskon").on("input", function () {
    this.value = this.value.replace(/[^0-9]/g, "");
});

$(document).on("keyup", "#total_pembayaran", function () {
    let value = $(this).val();
    let formated = value.replace(/[^,\d]/g, "");
    $(this).val(Currency(formated));
});
