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
        background-color: #63a2ff;
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
        text-align: center;
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

    table tbody tr td:first-child {
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
        font-size: 25px;
        text-align: center;
        margin-bottom: 10px;
        color: #000000;
        text-transform: uppercase;
        letter-spacing: 1px;
        line-height: 15px;
    }

    .header h2 {
        font-family: 'Arial', sans-serif;
        font-size: 16px;
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
        font-family: Arial, sans-serif;

    }

    .date {
        font-size: 16px;
        margin-bottom: 30px;
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
        <h1>LAPORAN TRANSAKSI TOKO MAKSINDO</h1>
        <h1>CABANG PEKANBARU</h1>
        <h2>Jl. Arifin Ahmad, Ruko No.99, Sidomulyo Timur </h2>
        <h2>Kec. Marpoyan Damai, Kota Pekanbaru</h2>
    </div>
</div>
<div class="divider"></div>
<table>
    <thead>
        <tr>
            <th>No</th>
            <th>Tanggal Transaksi</th>
            <th>Kode Transaksi</th>
            <th>Nama Konsumen</th>
            <th>No Handphone</th>
            <th>Alamat</th>
            <th>Sales</th>
            <th>Kode Barang</th>
            <th>Nama Barang</th>
            <th>Tipe Barang</th>
            <th>Status Barang</th>
            <th>Jumlah Barang</th>
            <th>Posisi Barang</th>
            <th>Harga Barang</th>
            <th>Status Pembayaran</th>
            <th>Transaksi</th>
            <th>Dana Pertama (DP)</th>
            <th>Diskon</th>
            <th>Pembayaran</th>
            <th>Total Pembayaran</th>
            <th>Sisa Pembayaran</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($transaksi as $data)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ \Carbon\Carbon::parse($data->tgl_transaksi)->translatedFormat('d F Y') }}</td>
                <td>{{ $data->kode_transaksi }}</td>
                <td>{{ $data->nama_konsumen }}</td>
                <td>{{ $data->no_handphone }}</td>
                <td>{{ $data->alamat }}</td>
                <td>{{ $data->nama_sales }}</td>
                <td>{{ $data->kode_barang }}</td>
                <td>{{ $data->nama_barang }}</td>
                <td>{{ $data->tipe_barang }}</td>
                <td>{{ $data->status_barang }}</td>
                <td>{{ $data->jumlah_barang }}</td>
                <td>{{ $data->posisi }}</td>
                <td>{{ 'Rp ' . number_format($data->harga_barang, 0, ',', '.') }}</td>
                <td>{{ $data->status_pembayaran }}</td>
                <td>{{ $data->status_transaksi }}</td>
                <td>{{ 'Rp ' . number_format($data->dana_pertama, 0, ',', '.') }}</td>
                <td>{{ $data->diskon . '%' }}</td>
                <td>{{ 'Rp ' . number_format($data->pembayaran, 0, ',', '.') }}</td>
                <td>{{ 'Rp ' . number_format($data->total_pembayaran, 0, ',', '.') }}</td>
                <td>{{ 'Rp ' . number_format($data->selisih_pembayaran, 0, ',', '.') }}</td>
            </tr>
        @endforeach
        @empty($data)
            <tr>
                <td colspan="20" style="text-align: center">Data transaksi tidak ditemukan</td>
            </tr>
        @endempty
    </tbody>
</table>
<div class="divider"></div>
{{-- validasi dan tanggal --}}
<div class="signature-container">
    <div class="date">Pekanbaru, {{ \Carbon\Carbon::now()->translatedFormat('d-F-Y') }}</div>
    <div class="signature">
        <div class="username">{{ ucwords(Auth::user()->name) }}</div>
    </div>
</div>
