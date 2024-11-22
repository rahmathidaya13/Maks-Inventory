@include('layouts.header')
<div class="wrapper">
    @include('layouts.navbar')
    @include('layouts.sidebar')
    <div class="content-wrapper">
        @include('layouts.breadcrumb')
        <section class="content">
            <div class="container-fluid">
                @yield('content')
            </div>
        </section>
    </div>
    <footer class="main-footer">
        <strong>Copyright &copy; 2024 <a href="{{ route("dashboard") }}">MaksInventory</a>.</strong>
        All rights reserved.
        <div class="float-right d-none d-sm-inline-block">
            <b>Version</b> 3.2.0
        </div>
    </footer>
</div>
@include('layouts.modal-profile.profile')
@include('layouts.footer')
