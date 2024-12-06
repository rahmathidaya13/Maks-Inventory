function Currency(angka) {
    return new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR",
        minimumFractionDigits: 0,
    })
        .format(angka)
        .replace(/Rp\s/g, "");
}

$(document).on("input", "#sales_keyword", function (e) {
    e.preventDefault();
    let query = $(this).val();
    if (query === "") {
        $("#tabel_penjualan").load(
            `/home/search?query=${query}`,
            function () {
                // Kembali ke halaman awal tanpa hasil pencarian
                window.history.pushState({}, "", "/home");
            }
        );
    } else {
        // encodeURIComponent(query): Digunakan untuk memastikan bahwa spasi dan karakter
        $("#tabel_penjualan").load(
            "/home/search?query=" + query,
            function () {
                $(
                    "#tabel_penjualan .nama_sales,.nama-barang, .tipe-barang"
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
        );
    }
});

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
    if (value == "") {
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
