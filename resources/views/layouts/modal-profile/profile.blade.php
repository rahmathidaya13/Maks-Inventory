<div class="modal fade" id="modal-default-profile">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            {{-- <div class="modal-header">
                <h4 class="modal-title">Profile</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div> --}}
            <div class="modal-body">
                <div class="row d-flex row-cols-1 row-cols-lg-2">
                    <div class="col col-lg-3">
                        <img class="img-fluid img-thumbnail modal-profile" src="#"
                            alt="">
                    </div>
                    <div class="col col-lg-9">
                        <div class="bg-transparent">
                            <h4 class=" text-uppercase">Profile</h4>

                            <form enctype="multipart/form-data" id="form-profile" class="d-inline" action="{{ route('profile.update',Auth::user()->id) }}" method="POST" role="form" >
                                @csrf
                                @method('PUT')
                                <div class="form-group">
                                    <label for="name-user">Name</label>
                                    <input type="text" class="form-control w-50" name="name-user" id="name-user">
                                </div>
                                <div class="form-group">
                                    <label for="email-user">Email</label>
                                    <input type="email" class="form-control w-50" name="email-user" id="email-user" >
                                </div>
                                <div class="form-group">
                                    <label for="photo-user">Photo</label>
                                    <input accept="image/*" type="file" class="form-control w-50" name="photo-user" id="photo-user" >
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button onclick="event.preventDefault();document.getElementById('form-profile').submit()" id="save-profile" type="button" class="btn btn-primary">Save profile</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
