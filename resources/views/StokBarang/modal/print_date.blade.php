<div class="modal fade" id="staticBackdrop_filter_date_brg_masuk" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content bg-light">
            <div class="modal-header">
                <h4 class="modal-title"><i></i> <span></span></h4>
                <button id="act_filter_close_stok" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="mb-2" id="filter_date_stok" action="{{ route('export.stok') }}" method="GET" role="form" enctype="multipart/form-data">
                    @csrf
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Tanggal Awal</label>
                            <input type="date" class="form-control" name="start_date_stok" id="start_date_stok" value="{{ old('start_date_stok') }}">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Tanggal Akhir</label>
                            <input type="date" class="form-control" name="end_date_stok" id="end_date_stok" value="{{ old('end_date_stok') }}">
                        </div>
                    </div>
                </form>
                <div class="mb-2">
                    <a class="btn btn-primary" href="{{ route('export.stok.all') }}"><i class="fas fa-download"></i> Unduh semua</a>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button id="act_filter_keluar_stok" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button onclick="event.preventDefault();document.getElementById('filter_date_stok').submit();" id="act_filter_stok"
                    type="button" class="btn btn-primary"><i class="fas fa-file-export"></i> <span>Export</span></button>
            </div>
        </div>
    </div>
</div>
