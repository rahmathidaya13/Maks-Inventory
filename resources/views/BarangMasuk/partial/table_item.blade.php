@php
    $currentPage = $barang_masuk->currentPage();
    $perPage = $barang_masuk->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($barang_masuk as $data)
    <tr id="barang_masuk_{{ $data->id_brg_masuk }}">
        <td class="text-center">
            <div class="form-check">
                <input class="form-check-input selected_" type="checkbox" name="id_brg_masuk" id="id_brg_masuk"
                    data-id="{{ $data->id_brg_masuk }}">
                <label class="form-check-label"></label>
            </div>
        </td>
        <td>{{ $startNumbering + $loop->iteration }}</td>
        <td>{{ \Carbon\Carbon::parse($data->tgl_brg_masuk)->translatedFormat('l, d F Y') }}</td>
        <td>{{ $data->no_warehouse }}</td>
        <td>{{ $data->nama_barang }}</td>
        <td>{{ $data->tipe_barang }}</td>
        <td>{{ $data->asal_gudang }}</td>
        <td class="text-right">{{ $data->jumlah_barang }}</td>
        <td>
            <div class="dropdown">
                <button class="btn btn-secondary" type="button" data-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-eye"></i>
                </button>
                <div class="dropdown-menu">
                    <a data-toggle="modal" data-target="#staticBackdrop1" data-id="{{ $data->id_brg_masuk }}"
                        class="dropdown-item ubah_barang_masuk" href="#"><i class="fas fa-edit"></i> Ubah</a>
                    <a data-id="{{ $data->id_brg_masuk }}" class="dropdown-item hapus_brg_masuk" href="#"><i
                            class="fas fa-trash"></i> Hapus</a>
                    <form id="delete_items_{{ $data->id_brg_masuk }}"
                        action="{{ route('barang_masuk.delete', $data->id_brg_masuk) }}" method="POST"
                        class="d-inline">
                        @csrf
                        @method('DELETE')
                    </form>
                </div>
            </div>
        </td>
    </tr>
@endforeach

@empty($data)
    <tr>
        <td colspan="15" class="text-center">Barang tidak ditemukan</td>
    </tr>
@endempty
