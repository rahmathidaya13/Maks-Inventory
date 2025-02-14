export default function transaksi() {
    $(document).ready(function () {
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

            Formated = day + "-" + month + "-" + year;
            return Formated;
        }

        // Fungsi untuk menghilangkan format titik dan ubah ke integer
        function parseCurrency(value) {
            // Jika value kosong atau tidak valid, kembalikan 0
            return value ? parseInt(value.replace(/\./g, "")) : 0; // Hapus titik dan ubah ke angka
        }

        // form untuk stok barang
        $(document).on("click", "#add_transaksi", function (e) {
            e.preventDefault();
            $("#form_transaksi")[0].reset();
            $("#pelunasan")[0].reset();

            $(".modal-title span").text("Buat Transaksi");
            $(".modal-title i").removeClass("fas fa-edit");
            $(".modal-title i").removeClass("fas fa-money-bill-wave");
            $(".modal-title i").addClass("fas fa-plus-square");
            $("#transaksi_aksi span").text("Simpan");
            $("#transaksi_aksi i").removeClass("fas fa-edit");
            $("#transaksi_aksi i").removeClass("fas fa-money-bill-wave");
            $("#transaksi_aksi i").addClass("fas fa-save");

            $("#form_transaksi").attr("action", "/transaksi/store");
            $("input[name='_method']").remove();

            $("#transaksi").prop("readonly", false);
            $(".nama_brg_transaksi,.status_pembayaran").css("pointerEvents", "all");
        });

        $(document).on("click", ".ubah_transaksi", function (e) {
            e.preventDefault();
            let id = $(this).data("id");
            $("#form_transaksi")[0].reset();
            $("#pelunasan")[0].reset();

            $(".modal-title span").text("Ubah Data Transaksi");
            $(".modal-title i").removeClass("fas fa-edit");
            $(".modal-title i").removeClass("fas fa-money-bill-wave");
            $(".modal-title i").removeClass("fas fa-plus-square");
            $(".modal-title i").addClass("fas fa-edit");
            $("#transaksi_aksi span").text("Ubah");
            $("#transaksi_aksi i").removeClass("fas fa-edit");
            $("#transaksi_aksi i").removeClass("fas fa-money-bill-wave");
            $("#transaksi_aksi i").removeClass("fas fa-save");
            $("#transaksi_aksi i").addClass("fas fa-edit");

            $("#form_transaksi").attr("action", `/transaksi/update/${id}`);
            $("#form_transaksi").prepend(
                '<input type="hidden" name="_method" value="PUT">'
            );

            $.getJSON(`/transaksi/detail/${id}`, function (data) {
                let idBarang = data.result.id_barang
                $("#id_barang").val(data.result.id_barang);
                $("#id_stok").val(data.result.id_stok);
                $("#transaksi").val(data.result.tgl_transaksi).prop("readonly", true);
                $("#kode_transaksi").val(data.result.kode_transaksi);
                $("#nama_konsumen").val(data.result.nama_konsumen);
                $("#nohp").val(data.result.no_handphone);
                $("#alamat").val(data.result.alamat);
                $("#sales").val(data.result.nama_sales).trigger("change");
                $("#kode_barang").val(data.result.kode_barang);

                $("#nama_brg_transaksi").val(null);
                $('#nama_brg_transaksi option').filter(function () {
                    return $(this).data('id') == idBarang;
                }).prop('selected', true);
                $('#nama_brg_transaksi').trigger('change');


                $("#posisi_brg_transaksi").val(data.result.posisi).trigger("change");
                $("#stts_barang").val(data.result.status_barang).trigger("change");

                $(".nama_brg_transaksi,.status_pembayaran").css({
                    pointerEvents: "none",
                });
                $("#tipe_brg_transaksi").val(data.result.tipe_barang);
                $("#harga_brg_transaksi").val(Currency(data.result.harga_barang));
                $("#jumlah_brg_transaksi")
                    .val(data.result.jumlah_barang)
                    .prop("readonly", data.result.jumlah_barang > 0 ? false : true);
                $("#status_pembayaran")
                    .val(data.result.status_pembayaran)
                    .trigger("change");
                $("#status_transaksi")
                    .val(data.result.status_transaksi)
                    .trigger("change");
                $("#diskon")
                    .val(parseInt(data.result.diskon))
                    .prop("readonly", data.result.diskon > 0 ? false : true);
                $("#dp").val(Currency(data.result.dana_pertama));
                $("#pembayaran")
                    .val(Currency(data.result.pembayaran))
                    .prop("readonly", data.result.pembayaran > 0 ? false : true);
                $("#total_pembayaran").val(Currency(data.result.total_pembayaran));
                $("#selisih").val(Currency(data.result.selisih_pembayaran));
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
                text: `Data transaksi ${tanggal} - ${kode} - ${customer} akan dihapus!`,
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

        $(document).on(
            "click",
            "#act_close_pelunasan, #keluar_pelunasan, #act_close_keluar,#keluar_transaksi",
            function (e) {
                e.preventDefault();
                $("#form_transaksi")[0].reset();
                $("#pelunasan")[0].reset();
                $("#pelunasan").attr("action", "#");
                $("#form_transaksi").attr("action", "#");
                $("input[name='_method']").remove();
            }
        );

        // trigger button hapus semua item pada tabel
        $(document).on("click", "#select_all_transaksi", function () {
            $(".selected").prop("checked", $(this).prop("checked"));
        });

        $(document).on("click", "#delete_all_transaksi", function (e) {
            e.preventDefault();
            let selectedItem = $(".selected:checked");
            let csrfToken = $('meta[name="csrf-token"]').attr("content");
            Swal.fire({
                title: "Apakah Anda yakin?",
                text: `${selectedItem.length} Item yang dipilih akan dihapus!`,
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Ya, hapus!",
                cancelButtonText: "Batal",
            }).then((result) => {
                if (result.isConfirmed) {
                    if (selectedItem.length > 0) {
                        // map to selected item
                        let ids = selectedItem
                            .map(function () {
                                return $(this).data("id");
                            })
                            .get();
                        $.ajax({
                            url: "/delete/transaksi",
                            type: "DELETE",
                            data: {
                                ids: ids,
                                _token: csrfToken,
                            },
                            success: function (response) {
                                Swal.fire({
                                    position: "center",
                                    icon: "success",
                                    title: `${ids.length} Item berhasil dihapus.`,
                                    showConfirmButton: false,
                                    timer: 1500,
                                }).then(() => {
                                    location.reload();
                                });
                            },
                            error: function (xhr) {
                                Swal.fire({
                                    icon: "error",
                                    title: "Terjadi kesalahan",
                                    text: "Saat menghapus item.",
                                });
                            },
                        });
                    } else {
                        alert("Silakan pilih item yang ingin dihapus.");
                    }
                }
            });
        });
        $(document).on("change", ".selected,#select_all_transaksi", function () {
            // Deteksi perubahan pada checkbox
            let checked = $(".selected:checked").length;
            if (checked > 0) {
                // Jika ada checkbox yang dipilih, aktifkan tombol
                $("#delete_all_transaksi").prop("disabled", false);
            } else {
                // Jika tidak ada checkbox yang dipilih, nonaktifkan tombol
                $("#delete_all_transaksi").prop("disabled", true);
            }
        });
        // end trigger button hapus semua

        // aksi untuk element input dan select
        $(document).on("change", "#nama_brg_transaksi", function () {
            let selected = $(this).find("option:selected");
            $("input[name='id_barang']").val(selected.data("id"));
            $("input[name='tipe_brg_transaksi']").val(selected.data("type") ?? "-");
            $("input[name='harga_brg_transaksi']").val(
                Currency(selected.data("price") ?? 0)
            );
        });

        $(document).on("change", ".posisi_brg_transaksi", function () {
            let token = $('meta[name="csrf-token"]').attr("content");
            let id_barang = $("#id_barang").val();
            let posisi = $(this).val();
            let nama_barang = $("#nama_brg_transaksi").val();
            let tipe_barang = $("#tipe_brg_transaksi").val();

            $.ajax({
                method: "GET",
                url: "/stok_barang",
                data: {
                    _token: token,
                    id_barang: id_barang,
                    posisi: posisi,
                    nama_barang: nama_barang,
                    tipe_barang: tipe_barang,
                },
                contentType: "application/json",
                dataType: "json",
                cache:true,
                success: function (data) {
                    // Cek apakah data ditemukan
                    if (data && data.result) {
                        $("input[name='stok']").val(data.result.stok_akhir);
                        $("input[name='id_stok']").val(data.result.id_stok);
                    } else {
                        $("input[name='stok']").val(0);
                        $("input[name='id_stok']").val("");
                    }
                },
            });
        });

        $(document).on("change", "#status_pembayaran", function () {
            let selected = $(this).find("option:selected");
            let value = selected.val();

            // $("input[name='status_pembayaran']").val(value);
            if (value !== "lunas") {
                $("#dp").prop("readonly", false);
                $("#dp").val(0);
                $(document).on("input", "#pembayaran", function (e) {
                    e.preventDefault();
                    let pembayaran = parseCurrency($(this).val());
                    let selisih_pembayaran = parseCurrency(
                        $("#total_pembayaran").val()
                    );
                    selisih_pembayaran = isNaN(selisih_pembayaran)
                        ? 0
                        : selisih_pembayaran;
                    $("#selisih").val(Currency(selisih_pembayaran - pembayaran));
                });
            } else {
                $("#dp").prop("readonly", true);
                $("#dp").val(0);
            }
        });

        $("#jumlah_brg_transaksi, #stok, #diskon,#nohp, #kode_barang").on(
            "input",
            function () {
                let value = $(this).val();
                let formated = value.replace(/[^,\d]/g, ""); // Hapus karakter selain angka dan koma
                $(this).val(formated); // Set kembali nilai yang telah diformat
            }
        );
        $(document).on("input", "#pembayaran", function () {
            let pembayaran = parseCurrency($(this).val());
            let total_pembayaran = parseCurrency($("#total_pembayaran").val());
            pembayaran = isNaN(pembayaran) ? 0 : pembayaran;
            $(this).val(Currency(pembayaran));
        });

        $(document).on("input", "#diskon", function () {
            let diskon = parseCurrency($(this).val());
            let hasil = parseCurrency($("#hasil").val());
            let dp = parseCurrency($("#dp").val());
            let hargaDiskon = hasil - hasil * (diskon / 100);

            $("#total_pembayaran").val(Currency(hargaDiskon));

            let selisih = hargaDiskon - dp;
            // if (selisih < 0 || diskon === 0) {
            //     selisih = 0;
            // }
            selisih = isNaN(selisih) ? 0 : selisih;
            $("#selisih").val(Currency(selisih));
        });

        $(document).on("input", "#jumlah_brg_transaksi", function () {
            let jumlah_barang = parseInt($(this).val());
            let harga_barang = parseCurrency($("#harga_brg_transaksi").val());
            let count = jumlah_barang * harga_barang;

            count = isNaN(count) ? 0 : count;
            $("#hasil").val(Currency(count));
            $("#total_pembayaran").val(Currency(count));
            // if (!jumlah_barang > 0 || !jumlah_barang === "") {
            //     $("#pembayaran").prop("readonly", true);
            //     $("#diskon").prop("readonly", true);
            // } else {
            //     $("#pembayaran").prop("readonly", false);
            //     $("#diskon").prop("readonly", false);
            // }
        });

        $(document).on("input", "#dp", function () {
            let dpValue = $(this).val();
            let dpFormatted = parseCurrency(dpValue); // Mengonversi input ke format angka

            let total_pembayaran = parseCurrency($("#total_pembayaran").val()); // Mengambil total pembayaran dalam format angka

            // Menghitung selisih antara total pembayaran dan DP
            let count = total_pembayaran - dpFormatted;
            if (dpFormatted === 0) {
                count = isNaN(count) ? count : 0;
            } else {
                count = isNaN(count) ? 0 : count;
            }
            $(this).val(Currency(dpFormatted)); // Format DP sebagai mata uang
            $("#selisih").val(Currency(count)); // Tampilkan selisih yang diformat sebagai mata uang
        });
        // end aksi untuk element input dan select

        $(document).on("click", ".pelunasan", function () {
            let id = $(this).data("id");
            $("#form_transaksi")[0].reset();

            $(".modal-title span").text("Pelunasan & Ambil Barang");
            $(".modal-title i").removeClass("fas fa-edit");
            $(".modal-title i").removeClass("fas fa-plus-square");
            $(".modal-title i").addClass("fas fa-money-bill-wave");
            $("#aksi_pelunasan span").text("Simpan");
            $("#aksi_pelunasan i").removeClass("fas fa-edit");
            $("#aksi_pelunasan i").removeClass("fas fa-save");
            $("#aksi_pelunasan i").addClass("fas fa-money-bill-wave");

            $("#pelunasan").attr("action", `/transaksi/repayment/${id}`);
            $("#pelunasan").prepend('<input type="hidden" name="_method" value="PUT">');

            $.getJSON(`/transaksi/detail/${id}`, function (data, textStatus, jqXHR) {
                $(document).on("input", "#pembayaran_pelunasan", function () {
                    let pembayaran = parseCurrency($(this).val()); // Mengambil nilai pembayaran dari input
                    let selisih = parseCurrency($("#r_selisih").val()); // Mengambil nilai selisih dari input
                    if (pembayaran === 0) {
                        $("#selisih_pembayaran_").val(Currency(selisih));
                    } else {
                        let count = selisih - pembayaran;
                        if (count < 0) {
                            count = 0;
                        }
                        $("#selisih_pembayaran_").val(Currency(count));
                    }

                    // Format kembali nilai pembayaran
                    $(this).val(Currency(pembayaran));
                });

                $("#konsumen").val(data.result.nama_konsumen).prop("readonly", true);

                $("#hp").val(data.result.no_handphone).prop("readonly", true);
                $("#alamat_konsumen").val(data.result.alamat).prop("readonly", true);
                $("#dana_pertama")
                    .val(Currency(data.result.dana_pertama))
                    .prop("readonly", true);

                $("#hb").val(Currency(data.result.harga_barang)).prop("readonly", true);
                $("#nama_brg_lunas").val(data.result.nama_barang);
                $("#tipe_brg_lunas").val(data.result.tipe_barang);
                $("#selisih_pembayaran_")
                    .val(Currency(data.result.selisih_pembayaran))
                    .prop("readonly", true);
                $("#r_selisih")
                    .val(Currency(data.result.selisih_pembayaran))
                    .prop("readonly", true);
            });
        });

        $(document).on("change", "#filter_transaksi", function (e) {
            e.preventDefault();
            let offset = $(this).val();
            let token = $('meta[name="csrf-token"]').attr("content");
            $.ajax({
                type: "GET",
                url: "/transaksi/filter",
                data: {
                    transaksiLimit: offset,
                    _token: token,
                },
                cache:true,
                success: function (data) {
                    $("tbody#tableTransaksi").html(data.table);
                    $(".pagination-wrapper").html(data.pagination);
                    $("#info-transaksi-page").html(
                        `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                        }</b> dari <b>${data.info.total ?? 0}</b> item`
                    );
                },
            });
        });

        $(document).on("click", ".pagination a", function (e) {
            e.preventDefault(); // Cegah reload halaman
            let url = $(this).attr("href"); // Ambil URL dari pagination link
            let offset = $("#filter_transaksi").val(); // Ambil nilai offset dari dropdown

            // Tambahkan parameter offset ke URL
            url = new URL(url);
            url.searchParams.set("transaksiLimit", offset);
            // Lakukan AJAX
            $.ajax({
                type: "GET",
                url: url.toString(),
                cache:true,
                success: function (data) {
                    // Perbarui tabel dan pagination
                    $("tbody#tableTransaksi").html(data.table);
                    $(".pagination-wrapper").html(data.pagination);
                    $("#info-transaksi-page").html(
                        `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                        }</b> dari <b>${data.info.total ?? 0}</b> item`
                    );
                },
            });
        });

        // fungsi untuk pencarian data langsung
        $(document).on("input", "#keyword_transaksi", function (e) {
            e.preventDefault();
            let query = $(this).val();
            let token = $('meta[name="csrf-token"]').attr("content");

            // cek url jika ada kembali ke method pencarian jika tidak kembali ke method filter saja
            let url;
            if (!query) {
                url = "/transaksi/filter";
            } else {
                url = "/transaksi/search";
            }
            $.ajax({
                type: "GET",
                url: url,
                data: {
                    transaksiQuery: query,
                    _token: token,
                    transaksiLimit: 10,
                },
                cache:true,
                success: function (data) {
                    if (!query) {
                        $("tbody#tableTransaksi").html(data.table);
                        $(".pagination-wrapper").html(data.pagination);
                        $("#info-transaksi-page").html(
                            `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                            }</b> dari <b>${data.info.total ?? 0}</b> item`
                        );
                    } else {
                        $("tbody#tableTransaksi").html(data.table);
                        $(".pagination-wrapper").html(data.pagination);
                        $("#info-transaksi-page").html(
                            `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                            }</b> dari <b>${data.info.total ?? 0}</b> item`
                        );

                        $(
                            "tbody#tableTransaksi .nama_sales,.kode_transaksi, .nama_konsumen,.nama_barang_transaksi,.tipe_barang_transaksi"
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

        $(document).on("click", "#export_transaksi", function (e) {
            e.preventDefault();

            $("#form_transaksi")[0].reset();
            $("#import_transaksi_file")[0].reset();
            $("#filter_date_transaksi")[0].reset();

            $(".modal-title span").text("Export File");
            $(".modal-title i").removeClass("fas fa-edit");
            $(".modal-title i").removeClass("fas fa-plus-square");
            $(".modal-title i").addClass("fas fa-download");
        });

        $(document).on("click", "#set_filter_transaksi", function (e) {
            e.preventDefault();
            let start_date = $("#start_date_filter_transaksi").val();
            let end_date = $("#end_date_filter_transaksi").val();
            // filter tanggal
            $.ajax({
                type: "POST",
                url: "/transaksi/filter/date",
                data: {
                    _token: $('meta[name="csrf-token"]').attr("content"),
                    start_date: start_date,
                    end_date: end_date,
                },
                success: function (data) {
                    $("tbody").html(data);
                    $(".pagination").html(data.pagination);
                },
                error: function (xhr) {
                    if (xhr.status === 422) {
                        let errors = xhr.responseJSON.errors;
                        let errorMessage = "";

                        if (errors.start_date) {
                            errorMessage += errors.start_date[0] + "<br>";
                        }
                        if (errors.end_date) {
                            errorMessage += errors.end_date[0] + "<br>";
                        }

                        // Tampilkan pesan error menggunakan SweetAlert
                        Swal.fire({
                            icon: "warning",
                            title: "Validasi tanggal gagal",
                            // html: "Masukan tanggal yang valid", // Tampilkan error dalam format HTML
                            confirmButtonText: "OK",
                        });
                    }
                },
            });
        });
        $(document).on("change", "#import_transaksi_form", function (e) {
            let file = e.target.files[0];
            if (file) {
                let reader = new FileReader();
                reader.onload = function (data) {
                    $("#preview").attr("src", "assets/icon/excel.png");
                };
                reader.readAsDataURL(file);
            }
            $("#file-name").text(file.name);
        });

        // trigger selected posisi harus dibawah
        $("#filter_transaksi").val(10).trigger("change");

        $(document).on("click", ".ambil_barang", function (e) {
            e.preventDefault();
            let id = $(this).data("id");
            $("#form_transaksi")[0].reset();
            $("#pelunasan")[0].reset();

            $(".modal-title span").text("Ambil Barang");
            $(".modal-title i").removeClass("fas fa-edit");
            $(".modal-title i").removeClass("fas fa-plus-square");
            $(".modal-title i").removeClass("fas fa-money-bill-wave");
            $(".modal-title i").addClass("fas fa-people-carry");

            $("#submit_ambil_barang i").removeClass("fas fa-edit");
            $("#submit_ambil_barang i").removeClass("fas fa-save");
            $("#submit_ambil_barang i").removeClass("fas fa-money-bill-wave");
            $("#submit_ambil_barang i").addClass("fas fa-save");

            // button action
            $("#submit_ambil_barang span").text("Simpan");

            $("#form_ambil_barang").attr("action", `/transaksi/takeAway/${id}`);
            $("#form_ambil_barang").prepend(
                '<input type="hidden" name="_method" value="PUT">'
            );

            // ambil data saja
            $.getJSON(`/transaksi/detail/${id}`,
                function (data) {
                    $("#konsumen_ambil_barang").val(data.result.nama_konsumen)
                    $("#hp_ambil_barang").val(data.result.no_handphone)
                    $("#alamat_ambil_barang").val(data.result.alamat)
                    $("#kode_ambil_barang").val(data.result.kode_barang)
                    $("#nama_barang_ambil_barang").val(data.result.nama_barang)
                    $("#tipe_barang_ambil_barang").val(data.result.tipe_barang)
                    $("#jumlah_ambil_barang").val(data.result.jumlah_barang)
                    $("#harga_ambil_barang").val(Currency(data.result.harga_barang))
                    $("#pembayaran_ambil_barang").val(Currency(data.result.pembayaran))
                }
            );

        });

        $(document).on("change", "#stts_pembayaran", function (e) {
            e.preventDefault();
            let query = $(this).val();
            let token = $('meta[name="csrf-token"]').attr("content");

            let url;
            if (!query) {
                url = "/transaksi/filter";
            } else {
                url = "/transaksi/filter/pembayaran";
            }

            $.ajax({
                type: "GET",
                url: url,
                data: {
                    value: query,
                    _token: token,
                    transaksiLimit: 10,
                },
                cache:true,
                success: function (data) {
                    $("tbody#tableTransaksi").html(data.table);
                    $(".pagination-wrapper").html(data.pagination);
                    $("#info-transaksi-page").html(
                        `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                        }</b> dari <b>${data.info.total ?? 0}</b> item`
                    );
                },
            });
        });

        $(document).on("click", ".data_sparepart", function (e) {
            e.preventDefault();
            let id = $(this).data("id");

            $("#form_transaksi")[0].reset();
            $("#pelunasan")[0].reset();

            $(".modal-title span").text("Form Ubah Data Sparepart");
            $(".modal-title i").removeClass("fas fa-plus-square");
            $(".modal-title i").removeClass("fas fa-money-bill-wave");
            $(".modal-title i").remove("fas fa-people-carry");
            $(".modal-title i").addClass("fas fa-edit");

            $("#submit_data_sparepart i").removeClass("fas fa-save");
            $("#submit_data_sparepart i").removeClass("fas fa-money-bill-wave");
            $("#submit_data_sparepart i").removeClass("fas fa-save");
            $("#submit_data_sparepart i").addClass("fas fa-edit");

            // button action
            $("#submit_data_sparepart span").text("Ubah");
            $("#form_data_sparepart").attr("action", `/transaksi/spareparts/${id}`);
            $("#form_data_sparepart").prepend(
                '<input type="hidden" name="_method" value="PUT">'
            );
            // ambil data saja
            $.getJSON(`/transaksi/detail/${id}`,
                function (data) {
                    $("#nama_cs_sparepart").val(data.result.nama_konsumen)
                    $("#nohp_cs_sparepart").val(data.result.no_handphone)
                    $("#alamat_cs_sparepart").val(data.result.alamat)
                    $("#kode_cs_sparepart").val(data.result.kode_barang)
                    $("#barang_cs_sparepart").val(data.result.nama_barang)
                    $("#tipe_cs_sparepart").val(data.result.tipe_barang)
                    $("#jumlah_cs_sparepart").val(data.result.jumlah_barang)
                    $("#harga_cs_sparepart").val(Currency(data.result.harga_barang))
                    $("#pembayaran_cs_sparepart").val(data.result.status_pembayaran)

                }
            );
        });
    });
}
