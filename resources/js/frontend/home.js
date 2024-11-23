$(document).on("keyup", "#sales_keyword", function (e) {
    e.preventDefault();
    let query = $(this).val().trim();
    if (query === "") {
        $("#tabel_penjualan").load(
            `/home/search?query=${encodeURIComponent(query)}`,
            function () {
                // Kembali ke halaman awal tanpa hasil pencarian
                window.history.pushState({}, "", "/home");
            }
        );
    } else {
        // encodeURIComponent(query): Digunakan untuk memastikan bahwa spasi dan karakter
        $("#tabel_penjualan").load(
            "/home/search?query=" + encodeURIComponent(query),
            function () {
                $("#tabel_penjualan .nama_sales,.nama-barang, .tipe-barang").each(function () {
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
