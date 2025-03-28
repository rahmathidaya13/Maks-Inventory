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
</style>
<h1>Laporan Barang Masuk Toko Maksindo</h1>
<h1>Cabang Pekanbaru {{ \Carbon\Carbon::parse($start_date)->translatedFormat('F Y') }}</h1>
<br>
<table style="width:50%">
    <thead>
        <tr>
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
                <td>{{ \Carbon\Carbon::parse($data->tgl_brg_masuk)->translatedFormat('d F Y') }}</td>
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
    </tbody>
</table>
