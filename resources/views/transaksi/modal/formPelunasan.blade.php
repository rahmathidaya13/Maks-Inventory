<div class="modal fade" id="staticBackdrop_pelunasan" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span>Pelunasan</span></h4>
                <button id="act_close_pelunasan" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body over overflow-auto" style="height: 450px">
                <form action="#" method="POST" role="form" id="pelunasan">
                    @csrf

                    <div class="form-group">
                        <label for="tgl_pelunasan">Tgl. Pelunasan</label>
                        <input type="date" class="form-control" name="tgl_pelunasan" id="tgl_pelunasan"
                            value="{{ old('tgl_pelunasan') }}">
                    </div>
                    <div class="form-group">
                        <label for="kode_transaksi_pelunasan">Kode Transaksi</label>
                        <input type="text" class="form-control" name="kode_transaksi_pelunasan"
                            id="kode_transaksi_pelunasan" value="{{ old('kode_transaksi_pelunasan') }}"
                            placeholder="ex: SI/SO.2024.08.00331">
                    </div>
                    <div class="form-group">
                        <label for="konsumen">Nama Konsumen</label>
                        <input type="text" class="form-control" name="konsumen" id="konsumen"
                            value="{{ old('konsumen') }}">
                    </div>
                    <div class="form-group">
                        <label for="hp">No Handphone</label>
                        <input type="text" class="form-control" name="hp" id="hp"
                            value="{{ old('hp') }}">
                    </div>
                    <div class="form-group">
                        <label for="alamat_konsumen">Alamat</label>
                        <input type="text" class="form-control" name="alamat_konsumen" id="alamat_konsumen"
                            value="{{ old('alamat_konsumen') }}">
                    </div>
                    <div class="form-group">
                        <label for="transaksi">Transaksi</label>
                        <select class="form-control" name="transaksi" id="transaksi">
                            <option value="">Pilih Transaksi</option>
                            <option value="tunai">Tunai</option>
                            <option value="non tunai">Non Tunai</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="stts_pembayaran">Status Pembayaran</label>
                        <select class="form-control" name="stts_pembayaran" id="stts_pembayaran">
                            <option value="lunas">Lunas</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="hb">Harga Barang</label>
                        <input type="text" class="form-control" name="hb" id="hb"
                            value="{{ old('hb') }}">
                    </div>
                    <div class="form-group">
                        <label for="dana_pertama">Dana Pertama (DP) - Min: 50%</label>
                        <input type="text" class="form-control" name="dana_pertama" id="dana_pertama"
                        value="{{ old('dana_pertama') }}">
                    </div>
                    <div class="form-group">
                        <label for="selisih_pembayaran_">Sisa Pembayaran</label>
                        <input type="text" class="form-control" name="selisih_pembayaran_" id="selisih_pembayaran_"
                            value="{{ old('selisih_pembayaran_') }}">
                            <input type="hidden" id="r_selisih">
                    </div>
                    <div class="form-group">
                        <label for="pembayaran_pelunasan">Pembayaran</label>
                        <input type="text" class="form-control" name="pembayaran_pelunasan" id="pembayaran_pelunasan"
                            value="{{ old('pembayaran_pelunasan') }}">
                    </div>

                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="keluar_pelunasan" type="button" class="btn btn-default"
                    data-dismiss="modal">keluar</button>
                <button onclick="event.preventDefault();document.getElementById('pelunasan').submit();"
                    id="aksi_pelunasan" type="button" class="btn btn-primary"><i class="fas fa-edit"></i>
                    <span>Ubah</span></button>
            </div>
        </div>
    </div>
</div>
