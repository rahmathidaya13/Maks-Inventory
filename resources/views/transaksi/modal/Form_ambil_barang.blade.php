<div class="modal fade" id="staticBackdrop_ambil_barang" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content bg-light ">
            <div class="modal-header">
                <h4 class="modal-title  font-weight-bold text-uppercase"><i></i> <span>Pelunasan & Ambil Barang</span>
                </h4>
                <button id="act_ambil_barang" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body over overflow-auto" style="height: 450px">
                <form action="#" method="POST" role="form" id="form_ambil_barang">
                    @csrf
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tanggal_ambil">Tanggal Pengambilan</label>
                            <input type="date" class="form-control" name="tanggal_ambil" id="tanggal_ambil"
                                value="{{ old('tanggal_ambil') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="kode_transaksi_ambil_brg">Kode Transaksi</label>
                            <input type="text" class="form-control" name="kode_transaksi_ambil_brg"
                                id="kode_transaksi_ambil_brg" value="{{ old('kode_transaksi_ambil_brg') }}"
                                placeholder="ex: SI.2024.08.00331">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="konsumen_ambil_barang">Nama Konsumen</label>
                        <input readonly type="text" class="form-control" name="konsumen_ambil_barang"
                            id="konsumen_ambil_barang" value="{{ old('konsumen_ambil_barang') }}">
                    </div>
                    <div class="form-group">
                        <label for="hp_ambil_barang">No Handphone</label>
                        <input readonly type="text" class="form-control" name="hp_ambil_barang" id="hp_ambil_barang"
                            value="{{ old('hp_ambil_barang') }}">
                    </div>
                    <div class="form-group">
                        <label for="alamat_ambil_barang">Alamat</label>
                        <input readonly type="text" class="form-control" name="alamat_ambil_barang"
                            id="alamat_ambil_barang" value="{{ old('alamat_ambil_barang') }}">
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="kode_ambil_barang">Kode Barang</label>
                            <input readonly type="text" class="form-control" name="kode_ambil_barang"
                                id="kode_ambil_barang" value="{{ old('kode_ambil_barang') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="nama_barang_ambil_barang">Nama Barang</label>
                            <input readonly type="text" class="form-control" name="nama_barang_ambil_barang"
                                id="nama_barang_ambil_barang" value="{{ old('nama_barang_ambil_barang') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tipe_barang_ambil_barang">Tipe Barang</label>
                            <input readonly type="text" class="form-control" name="tipe_barang_ambil_barang"
                                id="tipe_barang_ambil_barang" value="{{ old('tipe_barang_ambil_barang') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="jumlah_ambil_barang">Jumlah Barang</label>
                            <input readonly type="text" class="form-control" name="jumlah_ambil_barang"
                                id="jumlah_ambil_barang" value="{{ old('jumlah_ambil_barang') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="harga_ambil_barang">Harga Barang</label>
                            <input readonly type="text" class="form-control" name="harga_ambil_barang"
                                id="harga_ambil_barang" value="{{ old('harga_ambil_barang') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="pembayaran_ambil_barang">Pembayaran</label>
                            <input readonly type="text" class="form-control" name="pembayaran_ambil_barang"
                                id="pembayaran_ambil_barang" value="{{ old('pembayaran_ambil_barang') }}">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="out_ambil_barang" type="button" class="btn btn-default"
                    data-dismiss="modal">Keluar</button>
                <button onclick="event.preventDefault();document.getElementById('form_ambil_barang').submit();"
                    id="submit_ambil_barang" type="button" class="btn btn-primary"><i class="fas fa-edit"></i>
                    <span>Ubah</span></button>
            </div>
        </div>
    </div>
</div>
