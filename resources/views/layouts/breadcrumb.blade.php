<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-3 mt-3 d-flex justify-content-between align-items-center">
            <div class="col-12 col-md-7 mb-3 mb-md-0">
                <h1 class="m-0 text-uppercase font-weight-bold"> <i class="@yield('icon')"></i> @yield('breadcrumb')</h1>
            </div>
            <div class="col-12 col-md-5 d-flex d-lg-block text-lg-right">
                <div class="row">
                    <div class="col">
                        @if (Route::is('list.index'))
                            <a class="btn btn-secondary btn-sm" href="{{ route('barang.pdf') }}"><i
                                    class="fas fa-print"></i>
                                Print</a>

                            <a href="{{ route('export.barang') }}" id="export_barang" class="btn btn-primary btn-sm"><i
                                    class="fas fa-download"></i>
                                Export</a>
                            @can('onlyAdmin')
                                <button data-toggle="modal" data-target="#staticBackdrop2" id="import"
                                    class="btn btn-primary btn-sm"> <i class="fas fa-upload"></i> Import</button>

                                <button data-toggle="modal" data-target="#staticBackdrop" id="add_item"
                                    class="btn btn-sm btn-primary"><i class="fas fa-plus-circle"></i> Tambah Barang</button>
                            @endcan
                        @elseif (Route::is('barang_masuk.index'))
                            <a class="btn btn-secondary btn-sm" href="{{ route('barang_masuk.pdf') }}"><i
                                    class="fas fa-print"></i>
                                Print</a>
                            <button data-toggle="modal" data-target="#staticBackdrop_filter_date"
                                id="export_barang_masuk" class="btn btn-primary btn-sm"><i class="fas fa-download"></i>
                                Export</button>

                            {{-- <button data-toggle="modal" data-target="#staticBackdrop-brg_masuk" id="import_item_list"
                                class="btn btn-primary btn-sm"> <i class="fas fa-upload"></i> Import</button> --}}
                            @can('onlyAdmin')
                                <button data-toggle="modal" data-target="#staticBackdrop-brg_masuk1" id="add_item_list"
                                    class="btn btn-sm btn-primary"><i class="fas fa-plus-circle"></i> Tambah Barang
                                    Masuk</button>
                            @endcan
                        @elseif (Route::is('stok.index'))
                            <a class="btn btn-secondary btn-sm" href="{{ route('stok.pdf') }}"><i
                                    class="fas fa-print"></i>
                                Print</a>
                            <button data-toggle="modal" data-target="#staticBackdrop_filter_date_stok"
                                id="export_stok_barang" class="btn btn-primary btn-sm"><i class="fas fa-download"></i>
                                Export</button>
                            @can('onlyAdmin')
                                <button data-toggle="modal" data-target="#staticBackdrop_stok_barang_import"
                                    id="import_stok" class="btn btn-primary btn-sm"> <i class="fas fa-upload"></i>
                                    Import</button>

                                <button data-toggle="modal" data-target="#staticBackdrop_stok_barang" id="add_stok_barang"
                                    class="btn btn-sm btn-primary"><i class="fas fa-plus-circle"></i> Buat stok
                                    baru</button>
                            @endcan
                        @elseif (Route::is('transaksi.index'))
                            <a class="btn btn-secondary btn-sm" href="{{ route('transaksi.pdf') }}"><i
                                    class="fas fa-print"></i>
                                Print</a>

                            <button data-toggle="modal" data-target="#staticBackdrop_filter_transaksi"
                                id="export_transaksi" class="btn btn-primary btn-sm"><i class="fas fa-download"></i>
                                Export</button>

                            {{-- <button data-toggle="modal" data-target="#staticBackdrop_transaksi_import" id="transaksi_import"
                                class="btn btn-primary btn-sm"> <i class="fas fa-upload"></i> Import</button> --}}
                            @can('onlyAdmin')
                                <button data-toggle="modal" data-target="#staticBackdrop_transaksi" id="add_transaksi"
                                    class="btn btn-sm btn-primary"><i class="fas fa-plus-circle"></i> Buat
                                    Transaksi</button>
                            @endcan
                        @elseif (Route::is('barang_keluar.index'))
                            <a class="btn btn-secondary btn-sm" href="{{ route('barang_keluar.pdf') }}"><i
                                    class="fas fa-print"></i> Print</a>
                            <button data-toggle="modal" data-target="#staticBackdrop_filter_barang_keluar"
                                id="export_barang_keluar" class="btn btn-primary btn-sm"><i class="fas fa-download"></i>
                                Export</button>
                        @endif
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
