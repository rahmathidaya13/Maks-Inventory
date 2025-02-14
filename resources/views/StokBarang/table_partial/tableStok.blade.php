@php
    $currentPage = $stok->currentPage();
    $perPage = $stok->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($stok as $data)
    <tr class="stok_barang" id="stok_barang_{{ $data->id_stok }}">
        @can('onlyAdmin')
            <td class="align-middle">
                <div class="form-check">
                    <input class="form-check-input selected" type="checkbox" name="id_stok_all" id="id_stok_all"
                        data-id="{{ $data->id_stok }}">
                    <label class="form-check-label"></label>
                </div>
            </td>
        @endcan

        <td class="align-middle">{{ $startNumbering + $loop->iteration }}</td>
        <td class="align-middle">{{ \Carbon\Carbon::parse($data->tanggal)->translatedFormat('d M Y') }}</td>
        <td class="align-middle nama_brg_stok">{{ $data->nama_barang }}</td>
        <td class="align-middle tipe_brg_stok">{{ $data->tipe_barang }}</td>
        <td class="text-center align-middle">{{ $data->stok_awal }}</td>
        <td class="text-center align-middle">{{ $data->barang_masuk }}</td>
        <td class="text-center align-middle">{{ $data->barang_keluar }}</td>
        <td class="text-center align-middle">
            @if ($data && $data->stok_akhir === 0)
                <span class="badge badge-secondary p-1 w-50" style="font-size: 14px">{{ $data->stok_akhir }}</span>
            @elseif($data && $data->stok_akhir === 1)
                <span class="badge badge-warning p-1 w-50" style="font-size: 14px">{{ $data->stok_akhir }}</span>
            @elseif($data && $data->stok_akhir > 1)
                <span class="badge badge-success p-1 w-50" style="font-size: 14px">{{ $data->stok_akhir }}</span>
            @endif
        </td>
        <td class="text-center align-middle posisi_barang">{{ Str::upper($data->posisi) }}</td>
        <td class="text-center align-middle">{{ ucwords($data->keterangan) }}</td>
        @can('onlyAdmin')
            <td>
                <div class="dropdown">
                    <button class="btn btn-info btn-sm" type="button" data-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-cog"></i>
                    </button>
                    <div class="dropdown-menu">
                        <a id="ubah_stok" data-id="{{ $data->id_stok }}" class="dropdown-item ubah_stok" href="#"><i
                                class="fas fa-edit"></i> Ubah</a>

                        <a data-stok-field="{{ $data->tanggal }} / {{ $data->nama_barang }} / {{ $data->tipe_barang }} / {{ $data->posisi }}"
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
        @endcan
    </tr>
@endforeach

@empty($data)
    <tr>
        <td colspan="15" class="text-center">Stok barang tidak ditemukan</td>
    </tr>
@endempty
