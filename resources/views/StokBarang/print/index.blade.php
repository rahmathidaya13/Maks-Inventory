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
<h2>DATA STOK BARANG TOKO MAKSINDO</h2>
<h2>CABANG PEKANBARU</h2>
<br>
<table style="width:50%">
    <thead>
        <tr>
            <th>Tanggal</th>
            <th>Nama Barang</th>
            <th>Tipe Barang</th>
            <th>Stok Awal</th>
            <th>Barang Masuk</th>
            <th>Barang Keluar</th>
            <th>Stok Akhir</th>
            <th>Posisi Barang</th>
            <th>Keterangan</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($stok as $data)
            <tr>
                <td>{{ \Carbon\Carbon::parse($data->tanggal)->format('d-M-y') }}</td>
                <td>{{ $data->nama_barang }}</td>
                <td>{{ $data->tipe_barang }}</td>
                <td>{{ $data->stok_awal }}</td>
                <td>{{ $data->barang_masuk }}</td>
                <td>{{ $data->barang_keluar }}</td>
                <td>{{ $data->stok_akhir }}</td>
                <td>{{ $data->posisi }}</td>
                <td>{{ $data->keterangan }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
