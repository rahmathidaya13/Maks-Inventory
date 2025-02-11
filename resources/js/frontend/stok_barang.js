export default function stok() {
    $(document).ready(function () {
        function ConvertDate(dates) {
            let day, month, year, dateOriginParsed, Formated;
            dateOriginParsed = new Date(dates);

            day = String(dateOriginParsed.getDate()).padStart(2, "0");
            month = String(dateOriginParsed.getMonth() + 1).padStart(2, "0");
            year = dateOriginParsed.getFullYear();

            Formated = day + "-" + month + "-" + year;
            return Formated;
        }
        function validateForm(form, button) {
            let isValid = true;
            $(form)
                .find("input,select")
                .each(function () {
                    if ($(this).val().trim() === "") {
                        isValid = false;
                        return false;
                    }
                });
            $(button).prop("disabled", !isValid);
        }
        // form untuk stok barang
        // $("#stokBarangForm").on("input", function () {
        //     validateForm("#stokBarangForm", ".simpan_stok");
        // });

        // form untuk filter data barang by date
        // $("#filter_date_stok").on("input", function () {
        //     validateForm("#filter_date_stok", ".act_filter_stok");
        // });

        $(document).on("click", "#select_all_stok", function () {
            $(".selected").prop("checked", $(this).prop("checked"));
        });
        $(document).on("change", ".selected,#select_all_stok", function () {
            // Deteksi perubahan pada checkbox
            let checked = $(".selected:checked").length;
            if (checked > 0) {
                // Jika ada checkbox yang dipilih, aktifkan tombol
                $("#delete_all_stok").prop("disabled", false);
            } else {
                // Jika tidak ada checkbox yang dipilih, nonaktifkan tombol
                $("#delete_all_stok").prop("disabled", true);
            }
        });

        $(document).on("click", "#delete_all_stok", function (e) {
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
                            url: "/delete/all/stok",
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
        $(document).on(
            "click",
            "#stok_out, #stok_close,#act_import_stok,#act_filter_keluar_stok,#act_filter_close_stok",
            function (e) {
                e.preventDefault();
                $("input[name='_method']").remove();
                $("#stokBarangForm").attr("action", "#");
                $("#stokBarangForm")[0].reset();
                $("#filter_date_stok")[0].reset();
                $("#import_stok_file")[0].reset();
                $("#preview").attr("src", "assets/icon/iconupload.jpg");
                $("#file-name").text("File not found");
                // $(".simpan_stok").prop("disabled", true);
                // $(".act_filter_stok").prop("disabled", true);
            }
        );

        $(document).on("click", "#add_stok_barang", function (e) {
            e.preventDefault();
            $("#stokBarangForm")[0].reset();
            $("#filter_date_stok")[0].reset();
            $("#import_stok_file")[0].reset();

            $(".modal-title span").text("Buat Stok Baru");
            $(".modal-title i").removeClass("fas fa-edit");
            $(".modal-title i").removeClass("fas fa-download");
            $(".modal-title i").addClass("fas fa-plus-square");
            $("#stok_save span").text("Simpan");
            $("#stok_save i").removeClass("fas fa-edit").addClass("fas fa-save");
            $("#stokBarangForm").attr("action", "/stok/store");
            $("input[name='_method']").remove();
            // $(".simpan_stok").prop("disabled", true);
            $("#tgl").attr("readonly", false);
            $(".nama_barang").css({
                pointerEvents: "all",
            });
        });

        $(document).on("change", "#nama_barang", function () {
            let selected = $(this).find("option:selected");
            let getType = selected.data("type");
            let getId = selected.data("id");
            let getFirstStok = selected.data("first-stok");
            let getLastStok = selected.data("last-stok");
            let stok_in = selected.data("stok-in");
            let stok_out = selected.data("stok-out");
            // $("input[name='id_barang']").val(selected.data("id"));

            $("#tipe_barang").val(getType);
            // $("#tipe_barang option").each(function () {
            //     if ($(this).data("id") === getId) {
            //         $(this).prop("selected", true).trigger("change");
            //     }
            // });
            $("#stok_awal").val(getFirstStok ?? 0);
            $("#stok_akhir").val(getLastStok ?? 0);
            $("#brg_masuk").val(stok_in ?? 0);
            $("#brg_keluar").val(stok_out ?? 0);
        });

        $(document).on("click", ".ubah_stok", function (e) {
            e.preventDefault();
            Swal.fire({
                icon: "warning",
                title: "Ingin melakukan perubahan?",
                text: "Mengubah data ini dapat berdampak besar pada nilai yang ada. Pastikan kamu benar-benar yakin sebelum melanjutkan! Tindakan ini tidak dapat dibatalkan.",
                showCancelButton: true,
                cancelButtonText: "Batal",
                cancelButtonColor: "#c82333",
                confirmButtonText: "Ya, Tetap ubah", // Tombol Yes
            }).then((result) => {
                if (result.isConfirmed) {
                    // Menunggu konfirmasi dan kemudian menampilkan modal
                    // $(".simpan_stok").prop("disabled", false);
                    $("#staticBackdrop_stok_barang").modal("show");
                    $(".stok_out,.stok_close").click(function (e) {
                        e.preventDefault();
                        $("#staticBackdrop_stok_barang").modal("hide");
                    }); // Menampilkan modal

                    let id = $(this).data("id");
                    $("#stokBarangForm")[0].reset();
                    $("#filter_date_stok")[0].reset();
                    $("#import_stok_file")[0].reset();

                    $(".modal-title span").text("Ubah Data Stok");
                    $(".modal-title i").removeClass("fas fa-plus-square");
                    $(".modal-title i").removeClass("fas fa-download");
                    $(".modal-title i").addClass("fas fa-edit ");

                    $("#stok_save span").text("Ubah");
                    $("#stok_save i")
                        .removeClass("fas fa-save")
                        .addClass("fas fa-edit");
                    $("#stokBarangForm").attr("action", `/stok/update/${id}`);
                    $("#stokBarangForm").prepend(
                        '<input type="hidden" name="_method" value="PUT">'
                    );

                    $.getJSON(`/stok/detail/${id}`, function (data) {
                        let idBarang = data.result.id_barang;
                        $(".nama_barang").css({
                            pointerEvents: "none",
                        });
                        $("#id_barang").val(data.result.id_barang);
                        $("#tgl").val(data.result.tanggal).attr("readonly", true);

                        $("#nama_barang").val(null);
                        $('#nama_barang option').filter(function () {
                            return $(this).data('id') == idBarang;
                        }).prop('selected', true);
                        $('#nama_barang').trigger('change');

                        $("#tipe_barang")
                            .val(data.result.tipe_barang);
                        $("#posisi_barang").val(data.result.posisi).trigger("change");
                        $("#jumlah_barang").val(data.result.stok_awal);
                        $("#keterangan").val(data.result.keterangan);
                    });
                } else if (result.isDenied) {
                    // Menampilkan pesan jika tombol "No" ditekan
                    Swal.fire("Changes are not saved", "", "info");
                }
            });
        });

        $(document).on("click", ".hapus_stok", function (e) {
            e.preventDefault();
            let id = $(this).data("id");
            let form = $(`#delete_stok_${id}`);
            let stokField = $(this).data("stok-field");

            let stokFieldSplit = stokField.split("/");
            let getDate = ConvertDate(stokFieldSplit[0]);
            Swal.fire({
                title: "Apakah kamu yakin?",
                text: `Data  ${getDate +
                    " / " +
                    stokFieldSplit[1] +
                    " / " +
                    stokFieldSplit[2] +
                    " / " +
                    stokFieldSplit[3]
                    } Akan dihapus!`,
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

        $(document).on("change", "#import_stok_form", function (e) {
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

        $(document).on("change", "#filter_stok", function (e) {
            e.preventDefault();
            let offset = $(this).val();
            $.ajax({
                type: "GET",
                url: "/stok/filter",
                cache: true,
                data: {
                    stokLimit: offset,
                },
                success: function (data) {
                    $("tbody#tableStokBarang").html(data.table);
                    $(".pagination-wrapper-stok").html(data.pagination);
                    $("#info-stok-page").html(
                        `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                        }</b> dari <b>${data.info.total ?? 0}</b> item`
                    );
                },
            });
        });
        $(document).on("click", ".pagination a", function (e) {
            e.preventDefault(); // Cegah reload halaman
            let url = $(this).attr("href"); // Ambil URL dari pagination link
            let offset = $("#filter_stok").val(); // Ambil nilai offset dari dropdown
            // Tambahkan parameter offset ke URL
            url = new URL(url);
            url.searchParams.set("stokLimit", encodeURIComponent(offset));
            // Lakukan AJAX
            $.ajax({
                url: url.toString(),
                type: "GET",
                cache: true,
                success: function (data) {
                    // Perbarui tabel dan pagination
                    $("tbody#tableStokBarang").html(data.table);
                    $(".pagination-wrapper-stok").html(data.pagination);
                    $("#info-stok-page").html(
                        `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                        }</b> dari <b>${data.info.total ?? 0}</b> item`
                    );
                },
            });
        });

        // live search
        $(document).on("input", "#keyword_stok", function (e) {
            e.preventDefault();
            let query = $(this).val();
            let token = $('meta[name="csrf-token"]').attr("content");
            // cek url jika ada kembali ke method pencarian jika tidak kembali ke metok filter saja
            let url;
            if (!query) {
                url = "/stok/filter";
            } else {
                url = "/stok/search";
            }
            $.ajax({
                method: "GET",
                url: url,
                data: {
                    stokKeyword: query,
                    _token: token,
                    stokLimit: 10,
                },
                cache: true,
                success: function (data) {
                    if (!query) {
                        $("tbody#tableStokBarang").html(data.table);
                        $(".pagination-wrapper-stok").html(data.pagination);
                        $("#info-stok-page").html(
                            `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                            }</b> dari <b>${data.info.total ?? 0}</b> item`
                        );
                    } else {
                        $("tbody#tableStokBarang").html(data.table);
                        $(".pagination-wrapper-stok").html(data.pagination);
                        $("#info-stok-page").html(
                            `Menampilkan <b>${data.info.firstItem ?? 0}</b> sampai <b>${data.info.lastItem ?? 0
                            }</b> dari <b>${data.info.total ?? 0}</b> item`
                        );
                        $("tbody .posisi_barang,.nama_brg_stok, .tipe_brg_stok").each(
                            function () {
                                let text = $(this).text();
                                if (query) {
                                    // Ganti teks yang cocok dengan teks yang disorot
                                    let regex = new RegExp("(" + query + ")", "gi");
                                    let highlightedText = text.replace(
                                        regex,
                                        '<span class="highlight">$1</span>'
                                    );
                                    // Ganti dengan teks yang disorot
                                    $(this).html(highlightedText);
                                } else {
                                    // Kembalikan ke teks asli
                                    $(this).html(text);
                                }
                            }
                        );
                    }
                },
            });
        });

        $(document).on("click", "#set_filter_stok", function (e) {
            e.preventDefault();
            let start_date = $("#start_date_filter_stok").val();
            let end_date = $("#end_date_filter_stok").val();
            // filter tanggal
            $.ajax({
                type: "POST",
                url: "/stok/filter/date",
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

        // include action add item from file barang
        $(document).on("click", "#add_item", function (e) {
            e.preventDefault();
            // $(".simpan_barang_masuk").prop("disabled", true);
            $("#form_item")[0].reset();
            if ($("#brg_masuk").length > 0) {
                $("#brg_masuk")[0].reset();
            }
            if ($("#barangmasuk").length > 0) {
                $("#barangmasuk")[0].reset();
            }
            if ($("#filter_date").length > 0) {
                $("#filter_date")[0].reset();
            }

            $(".modal-title span").text("Tambah Barang");
            $(".modal-title i").removeClass("fas fa-edit").addClass("fas fa-box");
            $("#aksi_brg_masuk span").text("Simpan");
            $("#aksi_brg_masuk i").removeClass("fas fa-edit").addClass("fas fa-save");
            $("#form_item").attr("action", "/list-item/store");
            $("input[name='_method']").remove();
        });

        $(document).on("click", "#export_stok_barang", function (e) {
            e.preventDefault();
            $("#stokBarangForm")[0].reset();
            $("#import_stok_file")[0].reset();
            $("#filter_date_stok")[0].reset();
            $(".modal-title span").text("Export File");
            $(".modal-title i").removeClass("fas fa-edit");
            $(".modal-title i").removeClass("fas fa-plus-square");
            $(".modal-title i").addClass("fas fa-download");
        });

        $(document).on("click", "#import_stok", function (e) {
            e.preventDefault();

            $("#stokBarangForm")[0].reset();
            $("#import_stok_file")[0].reset();
            $("#filter_date_stok")[0].reset();
            $(".modal-title span").text("Upload File");
            $(".modal-title i").removeClass("fas fa-edit");
            $(".modal-title i").removeClass("fas fa-plus-square");
            $(".modal-title i").addClass("fas fa-download");
        });

        // trigger filter
        $("#filter_stok").val(10).trigger("change");
    });
}
