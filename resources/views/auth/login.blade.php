@section('title', 'Login')
@include('layouts.header')
<div class="login-box">
    <!-- /.login-logo -->
    <div class="card card-outline card-primary">
        <div class="card-header text-center">
            <h1 class="h1"><b>MAKS</b><span class="bg-black px-2">INVENTORY</span></h1>
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
                    <input type="email" class="form-control" name="email" id="email" placeholder="Email">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span id="show_pass" class="fas fa-eye"></span>
                        </div>
                    </div>
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
