@php
    $currentPage = $stok->currentPage();
    $perPage = $stok->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($stok as $data)
    <tr id="stok_barang_{{ $data->id_stok }}">
        <td class="text-center">
            <div class="form-check">
                <input class="form-check-input selected" type="checkbox" name="id_stok_all" id="id_stok_all"
                    data-id="{{ $data->id_stok }}">
                <label class="form-check-label"></label>
            </div>
        </td>
        <td >{{ $startNumbering + $loop->iteration }}</td>
        <td>{{ \Carbon\Carbon::parse( $data->tanggal)->translatedFormat('l, d F Y') }}</td>
        <td>{{ $data->nama_barang }}</td>
        <td>{{ $data->tipe_barang }}</td>
        <td class="text-right">{{ $data->stok_awal }}</td>
        <td class="text-right">{{ $data->stok_akhir }}</td>
        <td class="text-right">{{ $data->stok_saat_ini }}</td>
        <td>{{ $data->keterangan ?? '-' }}</td>
        <td>
            <div class="dropdown">
                <button class="btn btn-file" type="button" data-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-ellipsis-h"></i>
                </button>
                <div class="dropdown-menu">
                    <a id="ubah_stok" data-toggle="modal" data-target="#staticBackdrop_stok_barang" data-id="{{ $data->id_stok }}"
                        class="dropdown-item ubah_stok" href="#"><i class="fas fa-edit"></i> Ubah</a>
                    <a data-name-type="{{ $data->nama_barang }} - {{ $data->tipe_barang }}" data-id="{{ $data->id_stok }}" class="dropdown-item hapus_stok" href="#"><i
                            class="fas fa-trash"></i> Hapus</a>
                    <form id="delete_stok_{{ $data->id_stok }}"
                        action="{{ route('stok.delete', $data->id_stok) }}" method="POST"
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
