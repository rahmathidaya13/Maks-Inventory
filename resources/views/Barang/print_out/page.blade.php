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
<h1>Daftar Barang Toko Maksindo Cabang Pekanbaru</h1>
<br>
<table style="width:50%">
    <thead>
        <tr>
            <th>Nama Barang</th>
            <th>Tipe Barang</th>
            <th>Harga Barang</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($barang as $data)
            <tr>
                <td>{{ $data->nama_barang }}</td>
                <td>{{ $data->tipe_barang }}</td>
                <td>{{ $data->harga_barang }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
