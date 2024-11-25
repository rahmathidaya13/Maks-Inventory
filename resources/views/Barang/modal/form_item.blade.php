<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog p-4">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span>TITLE</span></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form_item" action="#" method="POST" role="form">
                    @csrf
                    <div class="form-group">
                        <label for="nama_brg">Nama Barang</label>
                        <input type="text" class="form-control" name="nama_brg" id="nama_brg" value="{{ old('nama_brg') }}">
                    </div>
                    <div class="form-group">
                        <label for="tipe_brg">Tipe Barang</label>
                        <input type="text" class="form-control" name="tipe_brg" id="tipe_brg" value="{{ old('tipe_brg') }}">
                    </div>
                    <div class="form-group">
                        <label for="harga_brg">Harga Barang</label>
                        <input type="text" class="form-control" id="harga_brg" name="harga_brg" value="{{ old('harga_brg') }}">
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="keluar" type="button" class="btn btn-default" data-dismiss="modal">keluar</button>
                <button disabled onclick="event.preventDefault();document.getElementById('form_item').submit();" id="action"
                    type="button" class="btn btn-primary simpan_barang"><i class="fas fa-save"></i> <span>Simpan</span></button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
