<div class="modal fade" id="staticBackdrop_stok_barang" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span></span></h4>
                <button id="stok_close" type="button" class="close stok_close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body overflow-auto" style="height: 450px">
                <form id="stokBarangForm" action="#" method="POST" role="form" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="id_barang" id="id_barang">
                    <div class="">
                        <div class="form-group">
                            <label for="tgl">Tanggal</label>
                            <input type="date" class="form-control" name="tgl" id="tgl"
                                value="{{ old('tgl') }}">
                        </div>
                        <div class="form-group nama_barang">
                            <label for="nama_barang">Nama Barang</label>
                            <select class="form-control select2" name="nama_barang" id="nama_barang">
                                <option value="">Pilih Nama Barang</option>
                                @foreach ($daftarBarang as $data)
                                    <option data-type="{{ $data->tipe_barang }}" data-id="{{ $data->id_barang }}"
                                        value="{{ $data->nama_barang }}"
                                        @foreach ($data->stokBarang as $rows)
                                            data-id-stok="{{ $rows->id_stok }}"
                                            data-first-stok="{{ $rows->stok_awal }}"
                                            data-last-stok="{{ $rows->stok_akhir }}"
                                            data-stok-in="{{ $rows->barang_masuk }}"
                                            data-stok-out="{{ $rows->barang_keluar }}" @endforeach>
                                        {{ $data->nama_barang . ' - ' . $data->tipe_barang }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tipe_barang">Tipe Barang</label>
                            <input readonly type="text" class="form-control" name="tipe_barang" id="tipe_barang"
                                value="{{ old('tipe_barang') }}">
                        </div>

                        <div class="form-group">
                            <label for="jumlah_barang">Jumlah Barang</label>
                            <input type="text" class="form-control" name="jumlah_barang" id="jumlah_barang"
                                value="{{ old('jumlah_barang') }}">
                        </div>
                        <div class="form-group">
                            <label for="posisi_barang">Posisi Barang</label>
                            <select class="form-control" name="posisi_barang" id="posisi_barang">
                                <option value="">Pilih posisi barang</option>
                                <option value="Kasir">Kasir</option>
                                <option value="Promo-Lt1">Bagian Promo Lantai 1</option>
                                <option value="Lantai-1">Lantai-1</option>
                                <option value="Rak-1">Rak-1</option>
                                <option value="Rak-2">Rak-2</option>
                                <option value="Rak-3">Rak-3</option>
                                <option value="Rak-4">Rak-4</option>
                                <option value="Gudang-Lt1">Gudang-LT1</option>
                                <option value="Gudang-Lt2">Gudang-Lt2</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="keterangan">Keterangan</label>
                            <input type="text" class="form-control" name="keterangan" id="keterangan"
                                value="{{ old('keterangan') }}">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="stok_out" type="button" class="btn btn-default stok_out"
                    data-dismiss="modal">Keluar</button>
                <button onclick="event.preventDefault();document.getElementById('stokBarangForm').submit();"
                    id="stok_save" type="button" class="btn btn-primary simpan_stok"><i class="fas fa-save"></i>
                    <span>Simpan</span></button>
            </div>
        </div>
    </div>
</div>
