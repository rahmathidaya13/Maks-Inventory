<div class="modal fade" id="staticBackdrop_filter_date" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span></span></h4>
                <button id="act_filter_close" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="filter_date" action="{{ route('export.barang_masuk') }}" method="GET" role="form" enctype="multipart/form-data">
                    @csrf
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <input type="date" class="form-control" name="start_date" id="start_date" value="{{ old('start_date') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="date" class="form-control" name="end_date" id="end_date" value="{{ old('end_date') }}">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="act_filter_keluar" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button onclick="event.preventDefault();document.getElementById('filter_date').submit();" id="act_filter"
                    type="button" class="btn btn-primary"><i class="fas fa-file-export"></i> <span>Export</span></button>
            </div>
        </div>
    </div>
</div>
