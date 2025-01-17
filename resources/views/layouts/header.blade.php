<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
        content="Maks-Inventory adalah solusi sistem manajemen persediaan barang yang membantu mengelola stok barang dan transaksi penjualan dengan mudah dan efisien.">
    <meta name="keywords"
        content="Inventory, Manajemen Persediaan, Stok Barang, Sistem Inventory, Maks-Inventory, Manajemen Barang, Gudang, Penjualan, Transaksi Penjualan">
    <meta name="author" content="Maks-Inventory Team">
    <meta name="robots" content="index, follow">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title')</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta property="og:title" content="Maks-Inventory - Solusi Sistem Manajemen Persediaan Terbaik">
    <meta property="og:description"
        content="Maks-Inventory membantu bisnis Anda mengelola stok, pembelian, dan penjualan dengan mudah dan efisien.">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://maksinventory.shop/login">
    <meta property="og:image" content="https://maksinventory.shop/assets/images/logo.png">
    <meta property="og:site_name" content="Maks-Inventory">
    <meta property="og:locale" content="id_ID">

    <link rel="canonical" href="https://maksinventory.shop/login">

    <link rel="canonical" href="https://maksinventory.shop/">
    <link rel="icon" href="{{ asset('assets/icon/logo2.png') }}" type="image/x-icon">
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=Nunito" rel="stylesheet">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/fontawesome-free/css/all.min.css') }}">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
    <!-- Select2 -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('assets/dist/css/adminlte.min.css') }}">

    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
    <!-- jQuery -->
    <script src="{{ asset('assets/plugins/jquery/jquery.min.js') }}"></script>
    <!-- jQuery UI 1.11.4 -->
    {{-- <script src="{{ asset('assets/plugins/jquery-ui/jquery-ui.min.js') }}"></script> --}}
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body
    class="hold-transition sidebar-mini layout-fixed {{ Route::is('login') ? 'login-page' : '' }} {{ Route::is('register') ? 'register-page' : '' }}">
