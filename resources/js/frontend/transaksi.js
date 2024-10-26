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

$(document).on("change", "select[name='nama_brg_transaksi']", function () {
    let selected = $(this).find("option:selected");
    $("input[name='tipe_brg_transaksi']").val(selected.data("type"));
    $("input[name='harga_brg_transaksi']").val(
        Currency(selected.data("price"))
    );
    $("input[name='id_barang']").val(selected.data("id"));
    $("input[name='stok']").val(selected.data("stok"));
    $("input[name='id_stok']").val(selected.data("id-stok"));
});

$(document).on("input", "#pembayaran", function () {
    // let hargaBarang = parseCurrency($("input[name='harga_brg_transaksi']").val());
    let total_pembayaran = parseCurrency($("#total_pembayaran").val());
    let pembayaran = parseCurrency($(this).val());

    // Hilangkan format mata uang dan lakukan operasi pengurangan
    let selisih = total_pembayaran - pembayaran;
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

$(document).on("keyup", "#pembayaran", function () {
    let value = $(this).val();
    let formated = value.replace(/[^,\d]/g, "");
    $(this).val(Currency(formated));
});

$(document).on("input", "#diskon", function () {
    let hargaBarang = parseCurrency(
        $("input[name='harga_brg_transaksi']").val()
    );
    let total_pembayaran = parseCurrency($("#total_pembayaran").val());
    let diskon = parseCurrency($(this).val());
    let pembayaran = hargaBarang - hargaBarang * (diskon / 100);

    pembayaran < 0 ? 0 : pembayaran;
    let final = pembayaran - total_pembayaran;
    final = isNaN(final) || final < 0 ? 0 : final;
    $("#total_pembayaran").val(Currency(pembayaran));
    $("#selisih").val(Currency(final));

    if ($(this).val().length > 0) {
        $("#pembayaran").prop("readonly", false);
    } else {
        $("#pembayaran").prop("readonly", true);
    }
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
    $("#form_transaksi").attr("action", `/transaksi/update/${id}`);
    $("#form_transaksi").prepend(
        '<input type="hidden" name="_method" value="PUT">'
    );

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
        $("#harga_brg_transaksi").val(data.result.harga_barang);
        $("#jumlah_brg_transaksi").val(data.result.jumlah_barang);
        $("#status_pembayaran").val(data.result.status_pembayaran).trigger("change");
        $("#diskon").val(data.result.diskon);
        $("#pembayaran").val(data.result.pembayaran);
        $("#total_pembayaran").val(data.result.total_pembayaran);
        $("#selisih").val(data.result.selisih_pembayaran);
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
