@php
    $currentPage = $barang_keluar->currentPage();
    $perPage = $barang_keluar->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($barang_keluar as $data)
    <tr id="stok_barang_{{ $data->id_barang_keluar }}">
        <td class="text-center">
            <div class="form-check">
                <input class="form-check-input selected" type="checkbox" name="id_barang_keluar_all"
                    id="id_barang_keluar_all" data-id="{{ $data->id_barang_keluar }}">
                <label class="form-check-label"></label>
            </div>
        </td>
        <td>{{ $startNumbering + $loop->iteration }}</td>
        <td>{{ \Carbon\Carbon::parse($data->tanggal)->translatedFormat('l, d F Y') }}</td>
        <td>{{ $data->kode_transaksi }}</td>
        <td>{{ $data->nama_konsumen }}</td>
        <td>{{ $data->no_handphone }}</td>
        <td>{{ $data->alamat }}</td>
        <td>{{ $data->nama_barang }}</td>
        <td>{{ $data->tipe_barang }}</td>
        <td>{{ $data->jumlah_barang }}</td>
    </tr>
@endforeach

@empty($data)
    <tr>
        <td colspan="15" class="text-center">Barang tidak ditemukan</td>
    </tr>
@endempty
