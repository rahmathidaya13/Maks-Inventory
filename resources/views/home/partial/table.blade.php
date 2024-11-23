@foreach ($transaksi as $data)
    <tr>
        <td class="text-center">{{ $loop->iteration }}</td>
        <td class="text-center" scope="row">
            {{ \Carbon\Carbon::parse($data->tgl_transaksi)->translatedFormat('d F Y') }}</td>
        <td scope="row"> {{ $data->nama_sales }}</td>
        <td scope="row"> {{ $data->nama_barang }}</td>
        <td class="text-center" scope="row"> {{ $data->tipe_barang }}</td>
        <td class="text-center" scope="row"> {{ $data->total_barang }}</td>
        <td class="text-center" scope="row"> {{ 'Rp ' . number_format((int) $data->total_omset, 0, ',', '.') }}</td>
    </tr>
@endforeach
