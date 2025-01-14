<div class="modal fade" id="staticBackdrop_data_sparepart" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content bg-light ">
            <div class="modal-header">
                <h4 class="modal-title font-weight-bold text-uppercase"><i></i> <span></span>
                </h4>
                <button id="act_data_sparepart" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body over overflow-auto" style="height: 450px">
                <form action="#" method="POST" role="form" id="form_data_sparepart">
                    @csrf
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tanggal_sparepart">Tanggal</label>
                            <input type="date" class="form-control" name="tanggal_sparepart" id="tanggal_sparepart"
                                value="{{ old('tanggal_sparepart') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="kode_transaksi_sparepart">Kode Transaksi</label>
                            <input type="text" class="form-control" name="kode_transaksi_sparepart"
                                id="kode_transaksi_sparepart" value="{{ old('kode_transaksi_sparepart') }}"
                                placeholder="ex: SI.2024.08.00331">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="nama_cs_sparepart">Nama Konsumen</label>
                            <input readonly type="text" class="form-control" name="nama_cs_sparepart"
                                id="nama_cs_sparepart" value="{{ old('nama_cs_sparepart') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="nohp_cs_sparepart">No Handphone</label>
                            <input readonly type="text" class="form-control" name="nohp_cs_sparepart"
                                id="nohp_cs_sparepart" value="{{ old('nohp_cs_sparepart') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="alamat_cs_sparepart">Alamat</label>
                            <textarea readonly class="form-control" name="alamat_cs_sparepart" id="alamat_cs_sparepart" cols="30"
                                rows="2">{{ old('alamat_cs_sparepart') }}</textarea>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="kode_cs_sparepart">Kode Barang</label>
                            <input readonly type="text" class="form-control" name="kode_cs_sparepart"
                                id="kode_cs_sparepart" value="{{ old('kode_cs_sparepart') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="barang_cs_sparepart">Nama Barang</label>
                            <input readonly type="text" class="form-control" name="barang_cs_sparepart"
                                id="barang_cs_sparepart" value="{{ old('barang_cs_sparepart') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tipe_cs_sparepart">Tipe Barang</label>
                            <input readonly type="text" class="form-control" name="tipe_cs_sparepart"
                                id="tipe_cs_sparepart" value="{{ old('tipe_cs_sparepart') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="jumlah_cs_sparepart">Jumlah Barang</label>
                            <input readonly type="text" class="form-control" name="jumlah_cs_sparepart"
                                id="jumlah_cs_sparepart" value="{{ old('jumlah_cs_sparepart') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="harga_cs_sparepart">Harga Barang</label>
                            <input readonly type="text" class="form-control" name="harga_cs_sparepart"
                                id="harga_cs_sparepart" value="{{ old('harga_cs_sparepart') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="pembayaran_cs_sparepart">Status Pembayaran</label>
                            <input readonly type="text" class="form-control" name="pembayaran_cs_sparepart"
                                id="pembayaran_cs_sparepart" value="{{ old('pembayaran_cs_sparepart') }}">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="out_data_sparepart" type="button" class="btn btn-default"
                    data-dismiss="modal">Keluar</button>
                <button onclick="event.preventDefault();document.getElementById('form_data_sparepart').submit();"
                    id="submit_data_sparepart" type="button" class="btn btn-primary"><i class="fas fa-edit"></i>
                    <span>Ubah</span></button>
            </div>
        </div>
    </div>
</div>
