<div class="modal fade" id="staticBackdrop_filter_date_stok" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span></span></h4>
                <button id="act_filter_close_stok" type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="mb-2" id="filter_date_stok" action="{{ route('export.stok') }}" method="GET"
                    role="form" enctype="multipart/form-data">
                    @csrf
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Tanggal Awal</label>
                            <input type="date" class="form-control" name="start_date_stok" id="start_date_stok"
                                value="{{ old('start_date_stok') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Tanggal Akhir</label>
                            <div class="input-group">
                                <input type="date" class="form-control" name="end_date_stok" id="end_date_stok"
                                    value="{{ old('end_date_stok') }}">
                                <div class="input-group-prepend">
                                    <button disabled
                                        onclick="event.preventDefault();document.getElementById('filter_date_stok').submit();"
                                        id="act_filter_stok" type="button" class="btn btn-primary act_filter_stok"><i
                                            class="fas fa-download"></i></button>
                                </div>
                            </div>


                        </div>
                    </div>
                </form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <form id="unduh_position" action="{{ route('export.stok.position') }}" method="GET"
                            role="form" enctype="multipart/form-data">
                            @csrf
                            <label for="posisi_barang_export">Posisi Barang</label>
                            <div class="input-group mb-3">
                                <select class="form-control" name="posisi_barang_export" id="posisi_barang_export">
                                    <option value="">Pilih posisi barang</option>
                                    <option value="Kasir">Kasir</option>
                                    <option value="Lantai-1">Lantai-1</option>
                                    <option value="Rak-1">Rak-1</option>
                                    <option value="Rak-2">Rak-2</option>
                                    <option value="Rak-3">Rak-3</option>
                                    <option value="Rak-4">Rak-4</option>
                                    <option value="Gudang-Lt1">Gudang-LT1</option>
                                    <option value="Gudang-Lt2">Gudang-Lt2</option>
                                </select>
                                <div class="input-group-prepend">
                                    <button
                                        onclick="event.preventDefault();document.getElementById('unduh_position').submit();"
                                        class="btn btn-primary"> <i class="fas fa-download"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                    {{-- print berdasarkan nama barang dan tipe barang --}}
                    <div class="form-group col-md-6">
                        <form id="unduh_by_name_type" action="{{ route('export.stok.position') }}" method="GET"
                            role="form" enctype="multipart/form-data">
                            @csrf
                            <label for="nama_barang_filter">Nama Barang</label>
                            <div class="input-group mb-3">
                                <select class="form-control select2" name="nama_barang_filter" id="nama_barang_filter">
                                    <option value="">Pilih Barang</option>
                                    @foreach ($daftarBarang as $data)
                                        <option value="{{ $data->id_barang }}">{{ $data->nama_barang }} -
                                            {{ $data->tipe_barang }}</option>
                                    @endforeach
                                </select>
                                <div class="input-group-prepend">
                                    <button
                                        onclick="event.preventDefault();document.getElementById('unduh_by_name_type').submit();"
                                        class="btn btn-primary"> <i class="fas fa-download"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="mb-2">
                    <a class="btn btn-primary" href="{{ route('export.stok.all') }}"><i class="fas fa-download"></i>
                        Unduh semua</a>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="act_filter_keluar_stok" type="button" class="btn btn-default"
                    data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
