<style>
    table {
        width: 100%;
        border-collapse: collapse;
        position: relative;
        margin: 0 auto;
        margin-bottom: 20px;
        font-size: 12px;
        font-family: Arial, sans-serif;

        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
        border-radius: 5px;
        overflow-x: auto;
        overflow-y: auto;

    }

    th {
        background-color: #eeff00;
        color: #000000;
    }
    th,
    td {
        border: 1px solid black;
        padding: 15px;
        text-align: center;
        vertical-align: middle;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        word-break: break-all;
    }
    h1{
        font-family: Arial, sans-serif;
        font-size: 24px;
        text-align: center;
        margin-bottom: 20px;
    }

</style>
<h1>Laporan Barang Keluar Toko Maksindo</h1>
<h1>Cabang Pekanbaru {{ \Carbon\Carbon::parse($start_date)->format('M Y') }}</h1>
<br>
<table style="width: 20px">
    <thead>
        <tr>
            <th>No</th>
            <th>Tanggal Barang Keluar</th>
            <th>Kode Transaksi</th>
            <th>Nama Konsumen</th>
            <th>No Handphone</th>
            <th>Alamat</th>
            <th>Nama Barang</th>
            <th>Tipe Barang</th>
            <th>Jumlah Barang</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($barang_keluar as $data)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ \Carbon\Carbon::parse($data->tanggal)->format('d-M-y') }}</td>
                <td>{{ $data->kode_transaksi }}</td>
                <td>{{ $data->nama_konsumen }}</td>
                <td>{{ $data->no_handphone }}</td>
                <td>{{ $data->alamat }}</td>
                <td>{{ $data->nama_barang }}</td>
                <td>{{ $data->tipe_barang }}</td>
                <td>{{ $data->jumlah_barang }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
