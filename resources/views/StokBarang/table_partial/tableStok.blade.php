@php
    $currentPage = $stok->currentPage();
    $perPage = $stok->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($stok as $data)
    <tr class="text-center stok_barang" id="stok_barang_{{ $data->id_stok }}">
        <td class="align-middle">
            <div class="form-check">
                <input class="form-check-input selected" type="checkbox" name="id_stok_all" id="id_stok_all"
                    data-id="{{ $data->id_stok }}">
                <label class="form-check-label"></label>
            </div>
        </td>
        <td class="align-middle">{{ $startNumbering + $loop->iteration }}</td>
        <td class="align-middle">{{ \Carbon\Carbon::parse($data->tanggal)->translatedFormat('l, d F Y') }}</td>
        <td class="align-middle nama_brg_stok">{{ $data->nama_barang }}</td>
        <td class="align-middle tipe_brg_stok">{{ $data->tipe_barang }}</td>
        <td class="text-center align-middle">{{ $data->barang_masuk }}</td>
        <td class="text-center align-middle">{{ $data->barang_keluar }}</td>
        <td class="text-center align-middle">{{ $data->stok_awal }}</td>
        <td class="text-center align-middle">{{ $data->stok_akhir }}</td>
        <td class="text-center align-middle">{{ ucwords($data->keterangan) }}</td>
        <td>
            <div class="dropdown">
                <button class="btn btn-file" type="button" data-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-ellipsis-h"></i>
                </button>
                <div class="dropdown-menu">
                    <a id="ubah_stok" data-toggle="modal" data-target="#staticBackdrop_stok_barang"
                        data-id="{{ $data->id_stok }}" class="dropdown-item ubah_stok" href="#"><i
                            class="fas fa-edit"></i> Ubah</a>


                    <a data-name-type="{{ $data->nama_barang }} - {{ $data->tipe_barang }}"
                        data-id="{{ $data->id_stok }}" class="dropdown-item hapus_stok" href="#"><i
                            class="fas fa-trash"></i> Hapus</a>
                    <form id="delete_stok_{{ $data->id_stok }}" action="{{ route('stok.delete', $data->id_stok) }}"
                        method="POST" class="d-inline">
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
