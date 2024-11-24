
{{-- tidak pakai --}}
{{-- <div class="modal fade" id="modal-update-stok">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><i class="fas fa-sync-alt"></i> Perbarui Stok</h4>
                <button type="button" class="close act_stok_close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row row-cols-1">
                    <div class="col">
                        <h5>Barang Masuk</h5>
                        <div class="card">
                            <div class="card-body">
                                <form id="update_form_stok" action="" method="POST" role="form">
                                    @csrf
                                    <input type="hidden" name="id_stok" id="id_stok">
                                    <input type="hidden" name="id_masuk_brg">
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <label for="jumlah_barang_masuk">Jumlah Barang Masuk</label>
                                            <input type="text" class="form-control" name="jumlah_barang_masuk"
                                                id="jumlah_barang_masuk" value="">
                                        </div>
                                        <div class="form-group col">
                                            <label for="jumlah_stok_awal">Stok Awal</label>
                                            <input readonly type="text" class="form-control" name="jumlah_stok_awal"
                                                id="jumlah_stok_awal">
                                        </div>
                                        <div class="form-group col">
                                            <label for="jumlah_stok_akhir">Stok Akhir</label>
                                            <input readonly type="text" class="form-control" name="jumlah_stok_akhir"
                                                id="jumlah_stok_akhir">
                                        </div>
                                        <div class="form-group col">
                                            <label for="jumlah_stok_tersedia">Stok Tersedia</label>
                                            <input readonly type="text" class="form-control" name="jumlah_stok_tersedia"
                                                id="jumlah_stok_tersedia">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <h5>Stok Barang</h5>
                        <div class="card">
                            <div class="card-body table-responsive">
                                <table class="table text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>Tanggal</th>
                                            <th>Nama Barang</th>
                                            <th>Tipe Barang</th>
                                            <th>Stok Awal</th>
                                            <th>Stok Akhir</th>
                                            <th>Stok Tersedia</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id="stok_update">
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td class="text-right"></td>
                                            <td class="text-right"></td>
                                            <td class="text-right"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="act_stok_close" type="button" class="btn btn-default" data-dismiss="modal">Keluar</button>
                <button onclick="event.preventDefault();document.getElementById('update_form_stok').submit();"
                    id="act_stok_update" type="button" class="btn btn-primary"><i class="fas fa-sync-alt"></i> Perbarui</button>
            </div>
        </div>
    </div>
</div>
</div> --}}
