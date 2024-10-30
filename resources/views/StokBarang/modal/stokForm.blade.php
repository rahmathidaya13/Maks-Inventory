<div class="modal fade" id="staticBackdrop_stok_barang" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span></span></h4>
                <button id="stok_close" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="stokBarangForm" action="#" method="POST" role="form" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="id_barang" id="id_barang">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tgl">Tanggal</label>
                            <input type="date" class="form-control" name="tgl" id="tgl"
                                value="{{ old('tgl') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="nama_barang">Nama Barang</label>
                            <select class="form-control select2" name="nama_barang" id="nama_barang">
                                <option value="">Pilih Nama Barang</option>
                                @foreach ($daftarBarang as $data)
                                    <option data-id="{{ $data->id_barang }}" value="{{ $data->nama_barang }}"
                                        @foreach ($data->stokBarang as $data)
                                            data-id-stok="{{ $data->id_stok }}"
                                            data-first-stok="{{ $data->stok_awal }}"
                                            data-last-stok="{{ $data->stok_akhir }}"
                                            data-stok-in="{{ $data->barang_masuk }}"
                                            data-stok-out="{{ $data->barang_keluar }}" @endforeach>
                                        {{ $data->nama_barang }} -
                                        {{ $data->tipe_barang }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tipe_barang">Tipe Barang</label>
                            <select class="form-control select2" name="tipe_barang" id="tipe_barang">
                                <option value="">Pilih Tipe Barang</option>
                                @foreach ($daftarBarang as $data)
                                    <option data-id="{{ $data->id_barang }}" value="{{ $data->tipe_barang }}">
                                        {{ $data->tipe_barang }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="stok_awal">Stok Awal</label>
                            <input type="text" class="form-control" name="stok_awal" id="stok_awal"
                                value="{{ old('stok_awal') }}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="barang_masuk">Barang Masuk</label>
                            <input type="text" class="form-control" name="barang_masuk" id="barang_masuk"
                                value="{{ old('barang_masuk') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="barang_keluar">Barang Keluar</label>
                            <input type="text" class="form-control" name="barang_keluar" id="barang_keluar"
                                value="{{ old('barang_keluar') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="stok_akhir">Stok Akhir</label>
                            <input type="text" class="form-control" name="stok_akhir" id="stok_akhir"
                                value="{{ old('stok_akhir') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="keterangan">Keterangan</label>
                            <input type="text" class="form-control" name="keterangan" id="keterangan"
                                value="{{ old('keterangan') }}">
                        </div>

                    </div>

                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="stok_out" type="button" class="btn btn-default" data-dismiss="modal">keluar</button>
                <button onclick="event.preventDefault();document.getElementById('stokBarangForm').submit();"
                    id="stok_save" type="button" class="btn btn-primary"><i class="fas fa-save"></i>
                    <span>Simpan</span></button>
            </div>
        </div>
    </div>
</div>
