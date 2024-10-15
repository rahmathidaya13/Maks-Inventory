@if ($barang->count() > 0)
    @foreach ($barang as $data)
        <tr>
            <td>{{ $loop->iteration }}</td>
            <td class="nama-barang">{{ $data->nama_barang }}</td>
            <td class="tipe-barang">{{ $data->tipe_barang }}</td>
            <td>{{ 'Rp ' . $data->harga_barang }}</td>
            <td>
                <button id="ubah" data-toggle="modal" data-target="#staticBackdrop" data-id="{{ $data->id_barang }}"
                    type="button" class="btn btn-warning btn-sm ubah"><i class="fas fa-edit"></i>
                    <span>Ubah</span></button>
                <button data-id="{{ $data->id_barang }}" class="btn btn-danger btn-sm hapus"><i class="fas fa-trash"></i>
                    <span>Hapus</span></button>
            </td>
        </tr>
    @endforeach
@else
    <tr>
        <td colspan="5" class="text-center">Barang tidak ditemukan</td>
    </tr>
@endif
