$(document).on("click", "#set_filter_item_out", function (e) {
    e.preventDefault();
    let start_date = $("#start_date_item_in").val();
    let end_date = $("#end_date_item_out").val();
    // filter tanggal
    $.ajax({
        type: "POST",
        url: "/barang_keluar/filter/date",
        data: {
            _token: $('meta[name="csrf-token"]').attr("content"),
            start_date: start_date,
            end_date: end_date,
        },
        success: function (data) {
            $("tbody").html(data);
            $(".pagination").html(data.pagination);
        },
    });
});

$(document).on("click", "#export_barang_keluar", function (e) {
    e.preventDefault();

    $("#filter_date_barang_keluar")[0].reset();
    $(".modal-title span").text("Export File");
    $(".modal-title i").removeClass("fas fa-edit");
    $(".modal-title i").removeClass("fas fa-plus-square");
    $(".modal-title i").addClass("fas fa-file-upload");
});

$(document).on("keyup", "#keyword_barang_keluar", function (e) {
    e.preventDefault();
    let query = $(this).val().trim();
    if (query === "") {
        $("tbody").load(
            `/barang_keluar/search?query=${encodeURIComponent(query)}`,
            function (data) {
                // Kembali ke halaman stok tanpa hasil pencarian
                window.history.pushState({}, "", "/barang_keluar");
                $(".pagination").html(data.pagination);
            }
        );
        // location.reload();
    } else {
        // encodeURIComponent(query): Digunakan untuk memastikan bahwa spasi dan karakter
        $("tbody").load(
            `/barang_keluar/search?query=${encodeURIComponent(query)}`,
            function () {
                $("tbody .nama_barang, .tipe_barang,.no_handphone,.nama_konsumen").each(function () {
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

$(document).on("change", "#limit_barang_keluar", function (e) {
    e.preventDefault();
    let offset = $(this).val();
    $("tbody").load("/barang_keluar/filter?offset=" + offset, function (data) {
        $(this).html(data.table);
        $(".pagination").html(data.pagination);
    });
});
