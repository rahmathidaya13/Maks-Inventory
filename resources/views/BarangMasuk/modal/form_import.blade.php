<div class="modal fade" id="staticBackdrop-brg_masuk" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i class="fas fa-upload"></i> <span>Upload File</span></h4>
                <button id="act_close" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="brg_masuk" action="{{ route('import.barangMasuk') }}" method="POST" role="form"
                    enctype="multipart/form-data">
                    @csrf
                    <div class="d-flex justify-content-center p-3">
                        <label class="shadow" for="import_brg_masuk" style="cursor: pointer;">
                            <img id="preview" class="img-fluid img-thumbnail" width="200"
                                src="{{ asset('assets/icon/iconupload.jpg') }}" alt="">
                            <input type="file" class="d-none" name="import_brg_masuk" id="import_brg_masuk"
                                accept=".xls, .xlsx,.csv">
                        </label>
                    </div>
                    <div id="file-name" class="text-center mt-2">File not found</div>
                </form>
            </div>
            <div class="modal-footer">
                <button onclick="event.preventDefault();document.getElementById('brg_masuk').submit();" id=""
                    type="button" class="btn btn-primary btn-block rounded-pill"> <span>Upload</span></button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
