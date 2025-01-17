function Currency(angka) {
    return new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR",
        minimumFractionDigits: 0,
    })
        .format(angka)
        .replace(/Rp\s/g, "");
}

// buat pendapatan dengan chart bar js
$.ajax({
    type: "GET",
    url: "/home/income",
    dataType: "json",
    success: function (data) {
        const ctx = $(".myChart");
        // map/gabungkan setiap data yang diambil dari controller
        let labels = data.result.map((item) => item.nama_sales);
        let income = data.result.map((item) => item.total_pendapatan);
        let totalItem = data.result.map((item) => item.total_barang);
        const incomes = new Chart(ctx, {
            type: "pie",
            data: {
                labels: labels,
                datasets: [
                    {
                        label: "Pendapatan",
                        data: income, // Pendapatan per sales
                        backgroundColor: [
                            "rgb(255, 99, 132)",
                            "rgb(54, 162, 235)",
                            "rgb(255, 205, 86)",
                            "rgb(75, 192, 192)",
                        ],
                        hoverOffset: 4,
                    },
                ],
            },
            options: {
                responsive: true, // buat Chart responsif
                maintainAspectRatio: false, // Nonaktifkan rasio aspek untuk bebas ukuran wajib style di html
                scales: {
                    y: {
                        beginAtZero: true,
                    },
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            label: function (context) {
                                const value = context.raw;
                                return `Pendapatan: Rp ${Currency(
                                    value.toLocaleString()
                                )}`;
                            },
                        },
                    },
                },
            },
        });
    },
});
$(document).on("change", ".filter_month", function (e) {
    e.preventDefault();
    let value = $(this).val();
    if (!value) {
        $("#tabel_penjualan").load(
            "/home/penjualan/unit?query=" + value,
            function (data) {
                window.history.pushState({}, "", "/home");
                $(this).html(data.table);
                $(".pagination").html(data.pagination);
            }
        );
    } else {
        $("#tabel_penjualan").load(
            "/home/penjualan/unit?query=" + value,
            function (data) {
                $(this).html(data.table);
                $(".pagination").html(data.pagination);
            }
        );
    }
});

// Fungsi pencarian keyword
$(document).on("input", "#sales_keyword", function (e) {
    e.preventDefault();
    let query = $(this).val();
    let token = $('meta[name="csrf-token"]').attr("content");
    let url;
    if (!query) {
        url = "/penjualan/filter";
    } else {
        url = "/home/search";
    }
    $.ajax({
        type: "GET",
        url: url,
        data: {
            salesQuery: query,
            _token: token,
            sales: 10,
        },
        success: function (data) {
            if (!query) {
                $("tbody#tabel_penjualan").html(data.table);
                $(".pagination-wrapper-home").html(data.pagination);
                $("#info-home-page").html(
                    `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${
                        data.info.lastItem ?? 0
                    }</b> dari <b>${data.info.total ?? 0}</b> item`
                );
            } else {
                $("tbody#tabel_penjualan").html(data.table);
                $(".pagination-wrapper-home").html(data.pagination);
                $("#info-home-page").html(
                    `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${
                        data.info.lastItem ?? 0
                    }</b> dari <b>${data.info.total ?? 0}</b> item`
                );

                $(
                    "tbody#tabel_penjualan .nama_sales,.nama_barang, .tipe_barang"
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

$(document).on("change", "#filter_penjualan", function (e) {
    e.preventDefault();
    let filter = $(this).val();
    let token = $('meta[name="csrf-token"]').attr("content");
    $.ajax({
        type: "GET",
        url: "/penjualan/filter",
        data: {
            sales: filter,
            _token: token,
        },
        success: function (data) {
            $("tbody#tabel_penjualan").html(data.table);
            $(".pagination-wrapper-home").html(data.pagination);
            $("#info-home-page").html(
                `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${
                    data.info.lastItem ?? 0
                }</b> dari <b>${data.info.total ?? 0}</b> item`
            );
        },
    });
});

$(document).on("click", ".pagination a", function (e) {
    e.preventDefault(); // Cegah reload halaman
    let url = $(this).attr("href"); // Ambil URL dari pagination link
    let offset = $("#filter_penjualan").val(); // Ambil nilai offset dari dropdown

    // Tambahkan parameter offset ke URL
    url = new URL(url);
    url.searchParams.set("sales", offset);
    // Lakukan AJAX
    $.ajax({
        url: url.toString(),
        type: "GET",
        success: function (data) {
            // Perbarui tabel dan pagination
            $("tbody#tabel_penjualan").html(data.table);
            $(".pagination-wrapper-home").html(data.pagination);
            $("#info-home-page").html(
                `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${
                    data.info.lastItem ?? 0
                }</b> dari <b>${data.info.total ?? 0}</b> item`
            );
        },
    });
});
// end atur halaman dan pagination

$("#filter_penjualan").val(10).trigger("change");
