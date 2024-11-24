@php
    $currentPage = $barang_keluar->currentPage();
    $perPage = $barang_keluar->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($barang_keluar as $data)
    <tr id="barang_keluar_{{ $data->id_barang_keluar }}">
        <td>{{ $startNumbering + $loop->iteration }}</td>
        <td>{{ \Carbon\Carbon::parse($data->tanggal)->translatedFormat('l, d F Y') }}</td>
        <td>{{ $data->kode_transaksi }}</td>
        <td class="nama_konsumen">{{ $data->nama_konsumen }}</td>
        <td class="no_handphone">{{ $data->no_handphone }}</td>
        <td>{{ $data->alamat }}</td>
        <td class="kode_barang">{{ $data->kode_barang }}</td>
        <td class="nama_barang">{{ $data->nama_barang }}</td>
        <td class="tipe_barang">{{ $data->tipe_barang }}</td>
        <td class="text-center">{{ $data->jumlah_barang }}</td>
    </tr>
@endforeach

@empty($data)
    <tr>
        <td colspan="15" class="text-center">Barang Keluar tidak ditemukan</td>
    </tr>
@endempty
