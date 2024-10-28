<div class="modal fade" id="staticBackdrop_transaksi" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span></span></h4>
                <button id="act_close" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body over overflow-auto" style="height: 450px">
                <form id="form_transaksi" action="#" method="POST" role="form" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="id_barang" id="id_barang">
                    <input type="hidden" name="id_stok" id="id_stok">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="transaksi">Tgl. Transaksi</label>
                            <input type="date" class="form-control" name="transaksi" id="transaksi"
                                value="{{ old('transaksi') }}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="kode_transaksi">Kode Transaksi</label>
                            <input type="text" class="form-control" name="kode_transaksi" id="kode_transaksi"
                                value="{{ old('kode_transaksi') }}" placeholder="ex: SI/SO.2024.08.00331">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="nama_konsumen">Nama Konsumen</label>
                            <input type="text" class="form-control" name="nama_konsumen" id="nama_konsumen"
                                value="{{ old('nama_konsumen') }}" placeholder="ex: Jhon Doe">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="nohp">No Handphone</label>
                            <input type="text" class="form-control" name="nohp" id="nohp"
                                value="{{ old('nohp') }}" placeholder="ex: 081100000">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="alamat">Alamat</label>
                            <input type="text" class="form-control" name="alamat" id="alamat"
                                value="{{ old('alamat') }}" placeholder="ex: Jl.A.yani">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="sales">Nama Sales</label>
                            <input type="text" class="form-control" name="sales" id="sales"
                                value="{{ old('sales') }}" placeholder="ex: Jhon Doe">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="nama_brg_transaksi">Nama Barang</label>
                            <select class="form-control select2" name="nama_brg_transaksi" id="nama_brg_transaksi">
                                <option value="">Pilih Barang</option>
                                @foreach ($DaftarBarang as $data)
                                    <option data-id="{{ $data->id_barang }}" data-name="{{ $data->nama_barang }}"
                                        data-type="{{ $data->tipe_barang }}" data-price="{{ $data->harga_barang }}"
                                        @foreach ($data->stokBarang as $rows)
                                        data-id-stok="{{ $rows->id_stok }}"
                                        data-stok="{{ $rows->stok_akhir }}" @endforeach
                                        value="{{ $data->nama_barang }}">
                                        {{ $data->nama_barang }} - {{ $data->tipe_barang }}</option>
                                    <option value="">{{ $data->stok_akhir }}</option>
                                @endforeach
                            </select>

                        </div>
                        <div class="form-group col-md-4">
                            <label for="tipe_brg_transaksi">Tipe Barang</label>
                            <input readonly type="text" class="form-control" name="tipe_brg_transaksi"
                                id="tipe_brg_transaksi">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="harga_brg_transaksi">Harga Barang</label>
                            <input readonly type="text" class="form-control" name="harga_brg_transaksi"
                                id="harga_brg_transaksi">
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="status_pembayaran">Status Pembayaran</label>
                            <select class="form-control" name="status_pembayaran" id="status_pembayaran">
                                <option value="belum lunas">Belum Lunas/DP</option>
                                <option value="lunas">Lunas</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="dp">Dana Pertama (DP)</label>
                            <input readonly type="text" class="form-control" name="dp" id="dp">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="jumlah_brg_transaksi">Jumlah Barang</label>
                            <input readonly type="text" class="form-control" name="jumlah_brg_transaksi"
                                id="jumlah_brg_transaksi">
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="stok">Stok</label>
                            <input readonly type="text" class="form-control" name="stok" id="stok"
                                value="0">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="diskon">Diskon %</label>
                            <input readonly type="text" class="form-control" name="diskon" id="diskon">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="pembayaran">Pembayaran</label>
                            <input readonly type="text" class="form-control" name="pembayaran" id="pembayaran">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="total_pembayaran">Total Pembayaran</label>
                            <input readonly type="text" class="form-control" name="total_pembayaran"
                                id="total_pembayaran">
                            <input type="hidden" id="hasil">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="selisih">Selisih Pembayaran</label>
                            <input readonly type="text" class="form-control" name="selisih" id="selisih"
                                value="0">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="keluar_transaksi" type="button" class="btn btn-default"
                    data-dismiss="modal">keluar</button>
                <button onclick="event.preventDefault();document.getElementById('form_transaksi').submit();"
                    id="transaksi_aksi" type="button" class="btn btn-primary"><i class="fas fa-save"></i>
                    <span>Simpan</span></button>
            </div>
        </div>
    </div>
</div>
