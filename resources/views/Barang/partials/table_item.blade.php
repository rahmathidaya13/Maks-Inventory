@php
    $currentPage = $barang->currentPage();
    $perPage = $barang->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($barang as $data)
    <tr>
        <td class="text-center">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="selected" id="selected">
                <label class="form-check-label"></label>
              </div>
        </td>
        <td>{{ $startNumbering + $loop->iteration }}</td>
        <td class="nama-barang">{{ $data->nama_barang }}</td>
        <td class="tipe-barang">{{ $data->tipe_barang }}</td>
        <td>{{ 'Rp ' . number_format($data->harga_barang, 0, ',', '.') }}</td>
        <td>
            <button id="ubah" data-toggle="modal" data-target="#staticBackdrop" data-id="{{ $data->id_barang }}"
                type="button" class="btn btn-info btn-sm ubah"><i class="fas fa-edit"></i>
                <span>Ubah</span></button>
            <button data-id="{{ $data->id_barang }}" class="btn btn-danger btn-sm hapus"><i class="fas fa-trash"></i>
                <span>Hapus</span></button>
            <form id="delete_item_{{ $data->id_barang }}" action="{{ route('list.delete', $data->id_barang) }}"
                method="POST" class="d-inline">
                @csrf
                @method('DELETE')
            </form>
        </td>
    </tr>
@endforeach

@empty($data)
    <tr>
        <td colspan="5" class="text-center">Barang tidak ditemukan</td>
    </tr>
@endempty
