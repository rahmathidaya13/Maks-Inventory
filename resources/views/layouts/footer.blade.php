<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

<script src="{{ asset('assets/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- daterangepicker -->
<script src="{{ asset('assets/plugins/moment/moment.min.js') }}"></script>
<!-- overlayScrollbars -->
<script src="{{ asset('assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('assets/dist/js/adminlte.js') }}"></script>
<!-- Select2 -->
<script src="{{ asset('assets/plugins/select2/js/select2.full.min.js') }}"></script>
{{-- <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script> --}}

<script>
    $(document).ready(function() {
        //Initialize Select2 Elements
        $("#staticBackdrop_pelunasan,#staticBackdrop_filter_date_stok,#staticBackdrop-brg_masuk1, #staticBackdrop_transaksi,#staticBackdrop_stok_barang")
            .on(
                'shown.bs.modal',
                function() {
                    $('.select2').select2({
                        dropdownParent: $(this) // This makes it dynamic for the modal that is opened
                    });
                    $("#nama_brg_transaksi").trigger('change');
                    $("#status_pembayaran").trigger('change');
                    $("#stts_pembayaran").trigger('change');

                });

        $(document).on("click", ".logout", function(e) {
            e.preventDefault();
            let form = $("#logout-form")
            form.submit();
            // Swal.fire({
            //     title: 'Anda yakin ingin keluar?',
            //     text: "Pastikan data yang telah diinput sudah benar!",
            //     icon: 'warning',
            //     showCancelButton: true,
            //     cancelButtonText: "Batal",
            //     confirmButtonColor: '#3085d6',
            //     cancelButtonColor: '#d33',
            //     confirmButtonText: 'Keluar'
            // }).then((result) => {
            //     if (result.isConfirmed) {
            //         form.submit();
            //     }
            // });
        });

        //Initialize Select2 Elements
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })

        // effect loading
        $("#loading").fadeOut();

        window.setTimeout(() => {
            $(".alert").fadeTo(500, 0).slideUp(500, () => {
                $(this).remove();
            })
        }, 3000);
    });
</script>
</body>

</html>
