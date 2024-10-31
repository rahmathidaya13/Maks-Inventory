<div class="modal fade" id="staticBackdrop_pelunasan" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span>Pelunasan</span></h4>
                <button id="act_close" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body over overflow-auto" style="height: 450px">
                <form action="#" method="POST" role="form" id="pelunasan">
                    @csrf
                    @method('PUT')
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tgl_pelunasan">Tgl. Pelunasan</label>
                            <input type="date" class="form-control" name="tgl_pelunasan" id="tgl_pelunasan"
                                value="{{ old('tgl_pelunasan') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="kode_transaksi">Kode Transaksi</label>
                            <input type="text" class="form-control" name="kode_transaksi" id="kode_transaksi"
                                value="{{ old('kode_transaksi') }}" placeholder="ex: SI/SO.2024.08.00331">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="konsumen">Nama Konsumen</label>
                            <input type="text" class="form-control" name="konsumen" id="konsumen"
                                value="{{ old('konsumen') }}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="hp">No Handphone</label>
                            <input type="text" class="form-control" name="hp" id="hp"
                                value="{{ old('hp') }}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="alamat">Alamat</label>
                            <input type="text" class="form-control" name="alamat" id="alamat"
                                value="{{ old('alamat') }}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="stts_transaksi">Status Transaksi</label>
                            <select class="form-control" name="stts_transaksi" id="stts_transaksi">
                                <option value="">Pilih Status Transaksi</option>
                                <option value="tunai">Tunai</option>
                                <option value="non tunai">Non Tunai</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="sttus_pembayaran">Status Pembayaran</label>
                            <input readonly type="text" class="form-control" name="sttus_pembayaran" id="sttus_pembayaran"
                                value="lunas">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="dana_pertama">Dana Pertama</label>
                            <input type="text" class="form-control" name="dana_pertama" id="dana_pertama"
                                value="{{ old('dana_pertama') }}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="total_pembayaran">Total Pembayaran</label>
                            <input type="text" class="form-control" name="total_pembayaran" id="total_pembayaran"
                                value="{{ old('total_pembayaran') }}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="selisih_pembayaran">Selisih Pembayaran</label>
                            <input type="text" class="form-control" name="selisih_pembayaran" id="selisih_pembayaran"
                                value="{{ old('selisih_pembayaran') }}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="pembayaran">Pembayaran</label>
                            <input type="text" class="form-control" name="pembayaran" id="pembayaran"
                                value="{{ old('pembayaran') }}">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="keluar_transaksi" type="button" class="btn btn-default"
                    data-dismiss="modal">keluar</button>
                <button onclick="event.preventDefault();document.getElementById('pelunasan').submit();"
                    id="transaksi_aksi" type="button" class="btn btn-primary"><i class="fas fa-edit"></i>
                    <span>Ubah</span></button>
            </div>
        </div>
    </div>
</div>
