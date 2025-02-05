export default function barang_keluar() {
    $(document).ready(function () {
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
            $(".modal-title i").addClass("fas fa-download");
        });

        $(document).on("input", "#keyword_barang_keluar", function (e) {
            e.preventDefault();
            let query = $(this).val();
            let token = $('meta[name="csrf-token"]').attr("content");

            let url;
            // cek url jika ada kembali ke method pencarian jika tidak kembali ke metok filter saja
            if (!query) {
                url = "/barang_keluar/filter";
            } else {
                url = "/barang_keluar/search";
            }
            $.ajax({
                type: "GET",
                url: url,
                data: {
                    itemOutKeyword: query,
                    _token: token,
                    barangKeluarLimit: 10,
                },
                success: function (data) {
                    if (!query) {
                        $("tbody#tableBarangKeluar").html(data.table);
                        $(".pagination-wrapper").html(data.pagination);
                        $("#info-barang_keluar-page").html(
                            `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                            }</b> dari <b>${data.info.total ?? 0}</b> item`
                        );
                    } else {
                        $("tbody#tableBarangKeluar").html(data.table);
                        $(".pagination-wrapper").html(data.pagination);
                        $("#info-barang_keluar-page").html(
                            `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                            }</b> dari <b>${data.info.total ?? 0}</b> item`
                        );

                        $(
                            "tbody#tableBarangKeluar .nama_barang, .tipe_barang,.no_handphone,.nama_konsumen"
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

        $(document).on("change", "#limit_barang_keluar", function (e) {
            e.preventDefault();
            let offset = $(this).val();
            let token = $('meta[name="csrf-token"]').attr("content");
            $.ajax({
                type: "GET",
                url: "/barang_keluar/filter",
                data: {
                    barangKeluarLimit: offset,
                    _token: token,
                },
                success: function (data) {
                    $("tbody#tableBarangKeluar").html(data.table);
                    $(".pagination-wrapper").html(data.pagination);
                    $("#info-barang_keluar-page").html(
                        `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                        }</b> dari <b>${data.info.total ?? 0}</b> item`
                    );
                },
            });
        });

        $(document).on("click", ".pagination a", function (e) {
            e.preventDefault(); // Cegah reload halaman
            let url = $(this).attr("href"); // Ambil URL dari pagination link
            let offset = $("#limit_barang_keluar").val(); // Ambil nilai offset dari dropdown

            // Tambahkan parameter offset ke URL
            url = new URL(url);
            url.searchParams.set("barangKeluarLimit", offset);
            // Lakukan AJAX
            $.ajax({
                url: url.toString(),
                type: "GET",
                success: function (data) {
                    // Perbarui tabel dan pagination
                    $("tbody#tableBarangKeluar").html(data.table);
                    $(".pagination-wrapper").html(data.pagination);
                    $("#info-barang_keluar-page").html(
                        `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                        }</b> dari <b>${data.info.total ?? 0}</b> item`
                    );
                },
            });
        });
        $("#limit_barang_keluar").val(10).trigger("change");
    });
}

