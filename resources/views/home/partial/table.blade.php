@foreach ($transaksi as $data)
    <tr>
        <td class="text-center">{{ $loop->iteration }}</td>
        <td class="text-center" scope="row">
            {{ \Carbon\Carbon::parse($data->tgl_transaksi)->translatedFormat('d F Y') }}</td>
        <td class="nama_sales" scope="row"> {{ $data->nama_sales }}</td>
        <td class="nama_barang" scope="row"> {{ $data->nama_barang }}</td>
        <td class="text-center tipe_barang" scope="row"> {{ $data->tipe_barang }}</td>
        <td class="text-center" scope="row"> {{ $data->total_barang }}</td>
        <td class="text-center" scope="row"> {{ 'Rp ' . number_format((int) $data->total_pendapatan, 0, ',', '.') }}</td>
    </tr>
@endforeach
@if ($transaksi->isEmpty())
<tr>
    <td colspan="7" class="text-center">Data tidak  ditemukan</td>
</tr>
@endif
