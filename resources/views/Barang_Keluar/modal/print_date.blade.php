<div class="modal fade" id="staticBackdrop_filter_barang_keluar" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span></span></h4>
                <button id="act_filter_barang_kaluar" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="filter_date_barang_keluar" action="{{ route('export.barang_keluar') }}" method="GET" role="form" enctype="multipart/form-data">
                    @csrf
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <input type="date" class="form-control" name="start_date_barang_keluar" id="start_date_barang_keluar" value="{{ old('start_date_barang_keluar') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="date" class="form-control" name="end_date_barang_keluar" id="end_date_barang_keluar" value="{{ old('end_date_barang_keluar') }}">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="act_filter_close_item" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button onclick="event.preventDefault();document.getElementById('filter_date_barang_keluar').submit();" id="act_filter_date_save"
                    type="button" class="btn btn-primary"><i class="fas fa-file-export"></i> <span>Export</span></button>
            </div>
        </div>
    </div>
</div>
