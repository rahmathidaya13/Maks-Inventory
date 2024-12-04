<style>
    table {
        width: 100%;
        border-collapse: collapse;
        position: relative;
        margin: 20px auto;
        margin-bottom: 20px;
        font-size: 12px;
        font-family: Arial, sans-serif;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
        overflow: hidden;
    }

    th {
        background-color: #5e80dd;
        /* Warna biru untuk header */
        color: #ffffff;
        font-weight: bold;
        text-transform: uppercase;
        padding: 10px;
        font-size: 12px;
    }

    td {
        background-color: #f9f9f9;
        color: #000000;
    }

    th,
    td {
        border: 1px solid black;
        padding: 10px;
        text-align: start;
        vertical-align: middle;
        white-space: wrap;
        overflow: hidden;
        text-overflow: ellipsis;
        word-break: break-all;
        word-wrap: break-word;
    }

    tbody tr:nth-child(odd) td {
        background-color: #e6e6e6;
        color: #000000;
    }

    tbody tr:nth-child(even) td {
        background-color: #ffffff;
        color: #000000;
    }

    tbody tr td:nth-child(1),
    tbody tr td:nth-child(7),
    tbody tr td:nth-child(8) {
        text-align: center;
    }

    .header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 20px;
        background-color: #f1f1f1;
        padding: 20px;
        border: 1px solid #000000;
    }

    .header img {
        width: 200px;
        height: auto;
        position: absolute;
        padding: 1px;
        margin: 5px;
        margin-top: 15px;
        border: 1px solid #5e5e5e;

    }

    .header .title {
        flex-grow: 1;
        text-align: center;
        margin-top: 19px;
    }

    .header h1 {
        font-family: 'Arial', sans-serif;
        font-size: 22px;
        text-align: center;
        margin-bottom: 10px;
        color: #000000;
        text-transform: uppercase;
        letter-spacing: 1px;
        line-height: 15px;
    }

    .header h2 {
        font-family: 'Arial', sans-serif;
        font-size: 15px;
        text-align: center;
        margin-bottom: 10px;
        color: #808080;
        line-height: 8px;
        padding-top: 0;

        word-wrap: break-word;
        white-space: normal;
        overflow-wrap: break-word;
    }

    .divider {
        border-bottom: 2px solid #000;
        margin-bottom: 20px;
    }

    /* tanda tangan dan validasi */
    .signature-container {
        text-align: right;
        margin-top: 50px;
    }

    .date {
        font-size: 16px;
        margin-bottom: 60px;
    }

    .signature {
        font-size: 16px;
        font-weight: bold;
        text-align: center;
        text-align: right;
    }

    .username {
        margin-top: 60px;
        border-top: 1px solid black;
        display: inline-block;
        width: 200px;
        text-align: center;
    }
</style>
<div class="header">
    <img src="{{ public_path('assets/icon/logo.jpg') }}" alt="">
    <div class="title">
        <h1>Laporan Barang Masuk Toko Maksindo</h1>
        <h1>Cabang Pekanbaru {{ \Carbon\Carbon::parse($start_date)->format('F Y') }}</h1>
        <h2>Jl. Arifin Ahmad, Ruko No.99, Sidomulyo Timur </h2>
        <h2>Kec. Marpoyan Damai, Kota Pekanbaru</h2>
    </div>
</div>
<div class="divider"></div>

<table>
    <thead>
        <tr>
            <th>No</th>
            <th>Tanggal Barang Masuk</th>
            <th>No Warehouse</th>
            <th>Kode Barang</th>
            <th>Nama Barang</th>
            <th>Tipe Barang</th>
            <th>Asal Gudang</th>
            <th>Quantity</th>
            <th>Posisi Barang</th>
            <th>Status</th>
            <th>Customer</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($barang_masuk as $data)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ \Carbon\Carbon::parse($data->tgl_brg_masuk)->format('d-M-y') }}</td>
                <td>{{ $data->no_warehouse }}</td>
                <td>{{ $data->kode_barang }}</td>
                <td>{{ $data->nama_barang }}</td>
                <td>{{ $data->tipe_barang }}</td>
                <td>{{ $data->asal_gudang }}</td>
                <td>{{ $data->jumlah_barang }}</td>
                <td>{{ $data->posisi }}</td>
                <td>{{ $data->status }}</td>
                <td>{{ $data->nama_konsumen }}</td>
            </tr>
        @endforeach
        @empty($data)
            <tr>
                <td colspan="11" style="text-align: center">Data barang masuk tidak ditemukan</td>
            </tr>
        @endempty
    </tbody>
</table>
<div class="divider"></div>
{{-- validasi dan tanggal --}}
<div class="signature-container">
    <div class="date">Pekanbaru, {{ \Carbon\Carbon::now()->format('d-F-y') }}</div>
    <div class="signature">
        <div class="username">{{ ucwords(Auth::user()->name) }}</div>
    </div>
</div>
