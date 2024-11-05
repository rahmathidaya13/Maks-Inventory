<style>
    table,
    th,
    td {
        position: relative;
        border: 1px solid #000000;
        border-collapse: collapse;
        padding: 8px;
        flex-wrap: wrap;
    }
    /* body {
        font-family: Arial, sans-serif;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th,
    td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    } */
</style>
<h1>Laporan Barang Keluar Toko Maksindo</h1>
<h1>Cabang Pekanbaru dari {{ \Carbon\Carbon::parse($start_date)->format('F Y') }} Hingga
    {{ \Carbon\Carbon::parse($end_date)->format('F Y') }}</h1>
<br>
<table style="width:50%">
    <thead>
        <tr>
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
