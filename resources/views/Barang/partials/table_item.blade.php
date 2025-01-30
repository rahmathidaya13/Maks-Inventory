@php
    $currentPage = $barang->currentPage();
    $perPage = $barang->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($barang as $data)
    <tr id="barang_item{{ $data->id_barang }}">
        @can('onlyAdmin')
            <td class="align-middle">
                <div class="form-check">
                    <input class="form-check-input selected" type="checkbox" name="ids" id="ids"
                        data-id="{{ $data->id_barang }}">
                    <label class="form-check-label"></label>
                </div>
            </td>
        @endcan

        <td class="align-middle" id="number">{{ $startNumbering + $loop->iteration }}</td>
        <td class="nama-barang align-middle">{{ $data->nama_barang }}</td>
        <td class="tipe-barang align-middle">{{ $data->tipe_barang }}</td>
        <td class="align-middle">{{ 'Rp ' . number_format((int) $data->harga_barang, 0, ',', '.') }}</td>
        @can('onlyAdmin')
            <td class="align-middle">
                <div class="dropdown">
                    <button class="btn btn-info btn-sm" type="button" data-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-cog"></i>
                    </button>
                    <div class="dropdown-menu">
                        <a id="ubah" data-toggle="modal" data-target="#staticBackdrop" data-id="{{ $data->id_barang }}"
                            class="dropdown-item ubah" href="#"><i class="fas fa-edit"></i> Ubah</a>
                        <a data-name-type="{{ $data->nama_barang }} - {{ $data->tipe_barang }}"
                            data-id="{{ $data->id_barang }}" class="dropdown-item hapus" href="#"><i
                                class="fas fa-trash"></i> Hapus</a>
                        <form id="delete_item_{{ $data->id_barang }}"
                            action="{{ route('list.delete', $data->id_barang) }}" method="POST" class="d-inline">
                            @csrf
                            @method('DELETE')
                        </form>
                    </div>
                </div>
            </td>
        @endcan
    </tr>
@endforeach

@empty($data)
    <tr>
        <td colspan="15" class="text-center">Barang tidak ditemukan</td>
    </tr>
@endempty
