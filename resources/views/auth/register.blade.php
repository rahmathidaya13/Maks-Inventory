@include('layouts.header')
<div class="register-box">
    <div class="card card-outline card-primary">
        <div class="card-header text-center">
            <h1 class="h1"><b>MAKS</b>INVENTORY</h1>
        </div>
        <div class="card-body">
            <p class="login-box-msg">Daftar untuk pengguna baru</p>

            <form action="{{ route('register') }}" method="post">
                @csrf
                <div class="input-group mb-3">
                    <input type="text" class="form-control @error('name')
                        is-invalid
                    @enderror" name="name" id="name" placeholder="Name">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                    @error('name')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
                </div>
                <div class="input-group mb-3">
                    <input type="email" class="form-control @error('email')
                        is-invalid
                    @enderror" name="email" id="email" placeholder="Email">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                    @error('email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control @error('password')
                        is-invalid
                    @enderror" name="password" id="password" placeholder="Password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" name="password_confirmation" placeholder="Retype password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="d-grid mb-3">
                    <button type="submit" class="btn btn-primary btn-block">Daftar</button>
                </div>
            </form>


            <div class="text-center">
                Sudah punya akun? <a href="{{ route('login') }}"> Masuk</a>
            </div>
        </div>
        <!-- /.form-box -->
    </div><!-- /.card -->
</div>
@include('layouts.footer')
