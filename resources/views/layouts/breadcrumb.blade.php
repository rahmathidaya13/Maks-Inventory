<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-3 mt-3 d-flex justify-content-between align-items-center">
            <div class="col-7">
                <h1 class="m-0 text-uppercase"> <i class="@yield('icon')"></i> @yield('breadcrumb')</h1>
            </div>
            <div class="col-5 text-right">
                @if (Route::is('list.index'))
                    <button id="export" class="btn btn-primary btn-sm"><i class="fas fa-download"></i> Export</button>
                    <button data-toggle="modal" data-target="#staticBackdrop2" id="import"
                        class="btn btn-primary btn-sm"> <i class="fas fa-upload"></i> Import</button>
                    <button data-toggle="modal" data-target="#staticBackdrop" id="add_item"
                        class="btn btn-sm btn-primary"><i class="fas fa-plus-circle"></i> Tambah Barang</button>
                @elseif (Route::is('barang_masuk.index'))
                    <button id="export" class="btn btn-primary btn-sm"><i class="fas fa-download"></i>
                        Export</button>
                    <button data-toggle="modal" data-target="#staticBackdrop2" id="import_item_list"
                        class="btn btn-primary btn-sm"> <i class="fas fa-upload"></i> Import</button>
                    <button data-toggle="modal" data-target="#staticBackdrop1" id="add_item_list"
                        class="btn btn-sm btn-primary"><i class="fas fa-plus-circle"></i> Tambah Barang Masuk</button>
                @endif
            </div>
        </div>
    </div>
</div>
