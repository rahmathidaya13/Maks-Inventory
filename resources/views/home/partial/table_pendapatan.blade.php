@foreach ($pendapatanTransaksi as $data)
    <tr>
        <td class="text-center">{{ $loop->iteration }}</td>
        <td class="nama_sales" scope="row"> {{ $data->nama_sales }}</td>
        <td class="nama_sales text-center" scope="row"> {{ $data->total_barang }}</td>
        <td class="text-center" scope="row"> {{ 'Rp ' . number_format((int) $data->total_pendapatan, 0, ',', '.') }}</td>
    </tr>
@endforeach
@if ($transaksi->isEmpty())
<tr>
    <td colspan="7" class="text-center">Data tidak  ditemukan</td>
</tr>

@endif
