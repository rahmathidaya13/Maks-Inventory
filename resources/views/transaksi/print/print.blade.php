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
<h2>LAPORAN TRANSAKSI TOKO MAKSINDO</h2>
<h2>CABANG PEKANBARU</h2>
<br>
<table style="width:100%">
    <thead>
        <tr>
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
                <td>{{ \Carbon\Carbon::parse($data->tgl_transaksi)->format('d-M-y') }}</td>
                <td>{{ $data->kode_transaksi }}</td>
                <td>{{ $data->nama_konsumen }}</td>
                <td>{{ $data->no_handphone }}</td>
                <td>{{ $data->alamat }}</td>
                <td>{{ $data->nama_sales }}</td>
                <td>{{ $data->nama_barang }}</td>
                <td>{{ $data->tipe_barang }}</td>
                <td>{{ $data->jumlah_barang }}</td>
                <td>{{ $data->harga_barang }}</td>
                <td>{{ $data->status_pembayaran }}</td>
                <td>{{ $data->status_transaksi }}</td>
                <td>{{ $data->dana_pertama }}</td>
                <td>{{ $data->diskon }}</td>
                <td>{{ $data->pembayaran }}</td>
                <td>{{ $data->total_pembayaran }}</td>
                <td>{{ $data->selisih_pembayaran }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
