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

    h1 {
        font-family: 'Arial', sans-serif;
        font-size: 20px;
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
<h1>Laporan Barang Masuk Toko Maksindo</h1>
<h1>Cabang Pekanbaru {{ \Carbon\Carbon::parse($start_date)->format('F Y') }}</h1>

<table>
    <thead>
        <tr>
            <th>No</th>
            <th>Tanggal Barang Masuk</th>
            <th>No Warehouse</th>
            <th>Nama Barang</th>
            <th>Tipe Barang</th>
            <th>Asal Gudang</th>
            <th>Quantity</th>
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
                <td>{{ $data->nama_barang }}</td>
                <td>{{ $data->tipe_barang }}</td>
                <td>{{ $data->asal_gudang }}</td>
                <td>{{ $data->jumlah_barang }}</td>
                <td>{{ $data->status }}</td>
                <td>{{ $data->nama_konsumen }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
