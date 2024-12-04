<div class="modal fade" id="staticBackdrop-brg_masuk1" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span></span></h4>
                <button id="act_close" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="barangmasuk" action="#" method="POST" role="form" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="id_barang" id="id_barang" value="">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="tgl_brg_masuk">Tgl. Barang Masuk</label>
                            <input type="date" class="form-control" name="tgl_brg_masuk" id="tgl_brg_masuk"
                                value="{{ old('tgl_brg_masuk') }}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="no_warehouse">No. Warehouse</label>
                            <input type="text" class="form-control" name="no_warehouse" id="no_warehouse"
                                value="{{ old('no_warehouse') }}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="kode_barang_brg_masuk">Kode Barang</label>
                            <input type="text" class="form-control" name="kode_barang_brg_masuk"
                                id="kode_barang_brg_masuk" value="{{ old('kode_barang_brg_masuk') }}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="nama_barang">Nama Barang</label>
                            <select class="select2 form-control" name="nama_barang" id="nama_barang">
                                <option value="">Pilih Barang</option>
                                @foreach ($allItem as $row)
                                    <option data-id="{{ $row->id_barang }}" value="{{ $row->nama_barang }}">
                                        <span>{{ $row->nama_barang }} - {{ $row->tipe_barang }}</span>
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="tipe_barang_masuk">Tipe Barang</label>
                            <select class="select2 form-control" name="tipe_barang_masuk" id="tipe_barang_masuk">
                                <option value="">Pilih Tipe Barang</option>
                                @foreach ($allItem as $row)
                                    <option value="{{ $row->tipe_barang }}">
                                        <span>{{ $row->tipe_barang }}</span>
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="asal_gdg">Asal Gudang</label>
                            <input type="text" class="form-control" name="asal_gdg" id="asal_gdg"
                                value="Gudang Pusat" value="{{ old('asal_gdg') }}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="jumlah_brg">Jumlah Barang</label>
                            <input type="text" class="form-control" name="jumlah_brg" id="jumlah_brg"
                                value="{{ old('jumlah_brg') }}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="posisi_brg_masuk">Posisi Barang</label>
                            <select class="form-control" name="posisi_brg_masuk" id="posisi_brg_masuk">
                                <option value="">Pilih posisi barang</option>
                                <option value="Kasir">KASIR</option>
                                <option value="Lantai-1">LANTAI-1</option>
                                <option value="Rak-1">RAK-1</option>
                                <option value="Rak-2">RAK-2</option>
                                <option value="Rak-3">RAK-3</option>
                                <option value="Rak-4">RAK-4</option>
                                <option value="Gudang-Lt1">Gudang-LT1</option>
                                <option value="Gudang-Lt2">GUDANG-LT2</option>
                            </select>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="status">Status</label>
                            <select class="form-control" name="status" id="status">
                                <option value="stok">Stok</option>
                                <option value="customer">Customer</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="konsumen">Nama Konsumen</label>
                            <input readonly type="text" class="form-control" name="konsumen" id="konsumen"
                                value="-">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="act_keluar" type="button" class="btn btn-default" data-dismiss="modal">Keluar</button>
                <button disabled onclick="event.preventDefault();document.getElementById('barangmasuk').submit();"
                    id="aksi_brg_masuk" type="button" class="btn btn-primary simpan_barang_masuk"><i
                        class="fas fa-save"></i>
                    <span>Simpan</span></button>
            </div>
        </div>
    </div>
</div>
