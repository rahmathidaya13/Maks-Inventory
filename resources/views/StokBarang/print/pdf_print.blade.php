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

    h1 {
        font-family: 'Arial', sans-serif;
        font-size: 25px;
        text-align: center;
        margin-bottom: 10px;
        color: #000000;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    tbody tr:nth-child(odd) td {
        background-color: #e6e6e6;
        color: #333333;
    }
    tbody tr:nth-child(even) td {
        background-color: #ffffff;
        color: #333333;
    }
</style>
<h1>DATA STOK BARANG TOKO MAKSINDO</h1>
<h1>CABANG PEKANBARU</h1>
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
    </tbody>
</table>
