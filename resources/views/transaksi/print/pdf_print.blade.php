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
        background-color: #f1f1f1;
        color: #333333;
    }
    tbody tr:nth-child(even) td {
        background-color: #ffffff;
        color: #333333;
    }
</style>
<div>
    <h1>LAPORAN TRANSAKSI TOKO MAKSINDO</h1>
    <h1>CABANG PEKANBARU</h1>
</div>
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
            <th>Nama Barang</th>
            <th>Tipe Barang</th>
            <th>Jumlah Barang</th>
            <th>Harga Barang</th>
            <th>Status Pembayaran</th>
            <th>Transaksi</th>
            <th>Dana Pertama (DP)</th>
            <th>Diskon</th>
            <th>Pembayaran</th>
            <th>Total Pembayaran</th>
            <th>Selisih Pembayaran</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($transaksi as $data)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ \Carbon\Carbon::parse($data->tgl_transaksi)->format('d-M-y') }}</td>
                <td>{{ $data->kode_transaksi }}</td>
                <td>{{ $data->nama_konsumen }}</td>
                <td>{{ $data->no_handphone }}</td>
                <td>{{ $data->alamat }}</td>
                <td>{{ $data->nama_sales }}</td>
                <td>{{ $data->nama_barang }}</td>
                <td>{{ $data->tipe_barang }}</td>
                <td>{{ $data->jumlah_barang }}</td>
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
    </tbody>
</table>
