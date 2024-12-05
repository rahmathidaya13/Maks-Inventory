<div class="modal fade" id="staticBackdrop_transaksi" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content bg-white">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span></span></h4>
                <button id="act_close_keluar" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body over overflow-auto" style="height: 450px">
                <form id="form_transaksi" action="#" method="POST" role="form" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="id_barang" id="id_barang">
                    <input type="hidden" name="id_stok" id="id_stok">
                    <div class="card" style="border: 1px solid #4d4d4d">
                        <div class="card-body">
                            <h5 class="text-uppercase font-weight-bold bg-dark p-2">Form Transaksi</h5>
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
                                    <select class="form-control" name="sales" id="sales">
                                        <option value="">Pilih Sales</option>
                                        <option value="Tia Saputri">Tia Saputri</option>
                                        <option value="Ade Yolanda">Ade Yolanda</option>
                                        <option value="Muhammad Reza">Muhammad Reza</option>
                                        <option value="Rahmat Hidaya">Rahmat Hidaya</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card" style="border: 1px solid #4d4d4d">
                        <div class="card-body">
                            <h5 class="text-uppercase font-weight-bold bg-dark p-2">Form Barang</h5>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="kode_barang">Kode Barang</label>
                                    <input type="text" class="form-control" name="kode_barang" id="kode_barang"
                                        value="{{ old('kode_barang') }}">
                                </div>
                                <div class="form-group col-md-6 nama_brg_transaksi">
                                    <label for="nama_brg_transaksi">Nama Barang</label>
                                    <select class="form-control select2" name="nama_brg_transaksi"
                                        id="nama_brg_transaksi">
                                        <option value="">Pilih Barang</option>
                                        @foreach ($DaftarBarang as $data)
                                            <option data-id="{{ $data->id_barang }}"
                                                data-name="{{ $data->nama_barang }}"
                                                data-type="{{ $data->tipe_barang }}"
                                                data-price="{{ $data->harga_barang }}"
                                                value="{{ $data->nama_barang }}">
                                                {{ $data->nama_barang }} - {{ $data->tipe_barang }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tipe_brg_transaksi">Tipe Barang</label>
                                    <input readonly type="text" class="form-control" name="tipe_brg_transaksi"
                                        id="tipe_brg_transaksi">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="harga_brg_transaksi">Harga Barang</label>
                                    <input readonly type="text" class="form-control" name="harga_brg_transaksi"
                                        id="harga_brg_transaksi">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="posisi_brg_transaksi">Posisi Barang</label>
                                    <select class="form-control" name="posisi_brg_transaksi"
                                        id="posisi_brg_transaksi">
                                        <option value="">Pilih posisi barang</option>
                                        <option value="Kasir">Kasir</option>
                                        <option value="Promo-Lt1">Bagian Promo Lantai 1</option>
                                        <option value="Lantai-1">Lantai-1</option>
                                        <option value="Rak-1">Rak-1</option>
                                        <option value="Rak-2">Rak-2</option>
                                        <option value="Rak-3">Rak-3</option>
                                        <option value="Rak-4">Rak-4</option>
                                        <option value="Gudang-Lt1">Gudang-LT1</option>
                                        <option value="Gudang-Lt2">Gudang-LT2</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="stok">Stok</label>
                                    <input readonly type="text" class="form-control" name="stok"
                                        id="stok" value="{{ old('stok') }}">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="card" style="border: 1px solid #4d4d4d">
                        <div class="card-body">
                            <h5 class="text-uppercase font-weight-bold bg-dark p-2">Form Pembayaran</h5>
                            <div class="form-row">
                                <div class="form-group col-md-6 status_pembayaran">
                                    <label for="status_pembayaran">Status Pembayaran</label>
                                    <select class="form-control" name="status_pembayaran" id="status_pembayaran">
                                        <option value="belum lunas">Belum Lunas/DP</option>
                                        <option value="lunas">Lunas</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="jumlah_brg_transaksi">Jumlah Barang</label>
                                    <input type="text" class="form-control" name="jumlah_brg_transaksi"
                                        id="jumlah_brg_transaksi" value="{{ old('jumlah_brg_transaksi') }}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="dp">Dana Pertama (DP) - Min: 50%</label>
                                    <input type="text" class="form-control" name="dp" id="dp"
                                        value="{{ old('dp') }}">
                                </div>

                                <div class="form-group col-md-6 status_transaksi">
                                    <label for="status_transaksi">Status Transaksi</label>
                                    <select class="form-control" name="status_transaksi" id="status_transaksi">
                                        <option value="">Pilih Status Transaksi</option>
                                        <option value="tunai">Tunai</option>
                                        <option value="non tunai">Non Tunai</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="diskon">Diskon %</label>
                                    <input type="text" class="form-control" name="diskon" id="diskon"
                                        value="{{ old('diskon') }}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="total_pembayaran">Total Pembayaran</label>
                                    <input readonly type="text" class="form-control" name="total_pembayaran"
                                        id="total_pembayaran" value="{{ old('total_pembayaran') }}">
                                    <input type="hidden" id="hasil">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="pembayaran">Pembayaran</label>
                                    <input type="text" class="form-control" name="pembayaran" id="pembayaran"
                                        value="{{ old('pembayaran') }}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="selisih">Sisa Pembayaran</label>
                                    <input readonly type="text" class="form-control" name="selisih"
                                        id="selisih" value="{{ old('selisih') }}">
                                    <input type="hidden" id="selisih_pembayaran">
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="keluar_transaksi" type="button" class="btn btn-default"
                    data-dismiss="modal">Keluar</button>
                <button onclick="event.preventDefault();document.getElementById('form_transaksi').submit();"
                    id="transaksi_aksi" type="button" class="btn btn-primary simpan_transaksi"><i
                        class="fas fa-save"></i>
                    <span>Simpan</span></button>
            </div>
        </div>
    </div>
</div>
