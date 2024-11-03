<div class="modal fade" id="staticBackdrop_stok_barang_import" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i class="fas fa-upload"></i> <span>Upload File</span></h4>
                <button id="act_import_stok" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="import_stok_file" action="{{ route('import.stok') }}" method="POST" role="form"
                    enctype="multipart/form-data">
                    @csrf
                    <div class="d-flex justify-content-center p-3">
                        <label class="shadow" for="import_stok_form" style="cursor: pointer;">
                            <img id="preview" class="img-fluid img-thumbnail" width="200"
                                src="{{ asset('assets/icon/iconupload.jpg') }}" alt="">
                            <input type="file" class="d-none" name="import_stok_form" id="import_stok_form"
                                accept=".xls, .xlsx,.csv">
                        </label>
                    </div>
                    <div id="file-name" class="text-center mt-2">File not found</div>
                </form>
            </div>
            <div class="modal-footer">
                <button onclick="event.preventDefault();document.getElementById('import_stok_file').submit();" id=""
                    type="button" class="btn btn-primary btn-block rounded-pill"> <span>Upload</span></button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
