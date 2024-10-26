@section('title', 'Login')
@include('layouts.header')
<div class="login-box">
    @if ($errors->has('error'))
        <div class="alert alert-danger">
            {{ $errors->first('error') }}
        </div>
    @endif
    @if ($message = Session::get('success'))
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            {{ $message }}
        </div>
    @endif
    <div class="card card-outline card-primary">
        <div class="card-header text-center">
            <h1 class="h1"><b>MAKS</b><span class="bg-dark px-2 rounded-pill">INVENTORY</span></h1>
        </div>
        <div class="card-body">
            <p class="login-box-msg">Masuk untuk menggunakan aplikasi ini</p>

            <form action="{{ route('login') }}" method="post">
                @csrf
                <div class="input-group mb-3">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                    <input type="email" class="form-control @error('email')
                        is-invalid
                    @enderror" name="email" id="email" placeholder="Email">
                    @error('email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    <input type="password" class="form-control @error('password')
                        is-invalid
                    @enderror" name="password" id="password" placeholder="Password">
                    <div class="input-group-append">
                        <div class="input-group-text password-text">
                            <span class="fas fa-eye password"></span>
                        </div>
                    </div>
                    @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary btn-block">Masuk</button>
                </div>
            </form>


            <p class="mb-0 text-center">
                Belum punya akun? <a href="{{ route('register') }}" class="text-center">Daftar</a>
            </p>
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
</div>
@include('layouts.footer')
