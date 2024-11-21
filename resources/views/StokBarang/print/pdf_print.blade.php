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
        background-color: #2fd458;
        /* Warna biru untuk header */
        color: #000000;
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
</style>
<div class="header">
    <img src="{{ public_path('assets/icon/logo.jpg') }}" alt="">
    <div class="title">
        <h1>DATA STOK BARANG TOKO MAKSINDO</h1>
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
            <th>Tanggal</th>
            <th>Nama Barang</th>
            <th>Tipe Barang</th>
            <th>Stok Awal</th>
            <th>Barang Masuk</th>
            <th>Barang Keluar</th>
            <th>Stok Akhir</th>
            <th>Keterangan</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($stok as $data)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ \Carbon\Carbon::parse($data->tanggal)->format('d-M-y') }}</td>
                <td>{{ $data->nama_barang }}</td>
                <td>{{ $data->tipe_barang }}</td>
                <td>{{ $data->stok_awal }}</td>
                <td>{{ $data->barang_masuk }}</td>
                <td>{{ $data->barang_keluar }}</td>
                <td>{{ $data->stok_akhir }}</td>
                <td>{{ $data->keterangan }}</td>
            </tr>
        @endforeach
        @empty($data)
            <tr>
                <td colspan="9" style="text-align: center">Data stok barang tidak ditemukan</td>
            </tr>
        @endempty
    </tbody>
</table>
<div class="divider"></div>
