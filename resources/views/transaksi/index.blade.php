@extends('layouts.app')
@section('title', 'Transaksi Penjualan')
@section('breadcrumb', 'Transaksi')
@section('icon', 'fas fa-money-bill-wave')
@section('content')

@include('transaksi.modal.formTransaksi')
@endsection
