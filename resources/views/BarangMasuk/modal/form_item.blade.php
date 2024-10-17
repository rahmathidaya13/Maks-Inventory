<div class="modal fade" id="staticBackdrop1" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
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
                        <div class="form-group col-md-6">
                            <label for="tgl_brg_masuk">Tgl. Barang Masuk</label>
                            <input type="date" class="form-control" name="tgl_brg_masuk" id="tgl_brg_masuk">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="no_warehouse">No. Warehouse</label>
                            <input type="text" class="form-control" name="no_warehouse" id="no_warehouse">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="nama_brg">Nama Barang</label>
                            <select class="select2 form-control" name="nama_brg" id="nama_brg">
                                <option value="">Pilih Barang</option>
                                @foreach ($allItem as $row)
                                <option data-id="{{ $row->id_barang }}" value="{{ $row->nama_barang }}">
                                    <span>{{ $row->nama_barang }} - {{ $row->tipe_barang }}</span>
                                </option>
                                @endforeach
                              </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tipe_brg">Tipe Barang</label>
                            <select class="select2 form-control" name="tipe_brg" id="tipe_brg">
                                <option value="">Pilih Tipe Barang</option>
                                @foreach ($allItem as $row)
                                <option value="{{ $row->tipe_barang }}">
                                    <span>{{ $row->tipe_barang }}</span>
                                </option>
                                @endforeach
                              </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="asal_gdg">Asal Gudang</label>
                            <input type="text" class="form-control" name="asal_gdg" id="asal_gdg" value="Gudang Pusat">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="jumlah_brg">Jumlah Barang</label>
                            <input type="text" class="form-control" name="jumlah_brg" id="jumlah_brg">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="act_keluar" type="button" class="btn btn-default" data-dismiss="modal">keluar</button>
                <button onclick="event.preventDefault();document.getElementById('barangmasuk').submit();" id="aksi_brg_masuk"
                    type="button" class="btn btn-primary"><i class="fas fa-save"></i> <span>Simpan</span></button>
            </div>
        </div>
    </div>
</div>
