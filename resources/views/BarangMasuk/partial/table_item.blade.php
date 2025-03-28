@php
    $currentPage = $barang_masuk->currentPage();
    $perPage = $barang_masuk->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($barang_masuk as $data)
    <tr id="barang_masuk_{{ $data->id_brg_masuk }}">
        @can('onlyAdmin')
            <td class=" align-middle">
                <div class="form-check">
                    <input class="form-check-input selected_" type="checkbox" name="id_brg_masuk" id="id_brg_masuk"
                        data-id="{{ $data->id_brg_masuk }}">
                    <label class="form-check-label"></label>
                </div>
            </td>
        @endcan
        <td class="align-middle ">{{ $startNumbering + $loop->iteration }}</td>
        <td class="align-middle">{{ \Carbon\Carbon::parse($data->tgl_brg_masuk)->translatedFormat('d M Y') }}</td>
        <td class="align-middle">{{ $data->no_warehouse }}</td>
        <td class="align-middle">{{ $data->kode_barang }}</td>
        <td class="nama_brg_masuk align-middle">{{ $data->nama_barang }}</td>
        <td class="tipe_brg_masuk align-middle ">{{ $data->tipe_barang }}</td>
        <td class="align-middle ">{{ $data->asal_gudang }}</td>
        <td class="align-middle text-center"> {{ $data->jumlah_barang }}</td>
        <td class="align-middle text-center"> {{ $data->posisi }}</td>
        <td class="align-middle text-center">{{ $data->status }}</td>

        @if ($data && $data->nama_konsumen == '-')
            <td class="align-middle text-center">{{ $data->nama_konsumen }}</td>
        @else
            <td class="align-middle">{{ $data->nama_konsumen }}</td>
        @endif
        @can('onlyAdmin')
            <td class="align-middle">
                <div class="dropdown">
                    <button class="btn btn-sm btn-info" type="button" data-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-cog"></i>
                    </button>
                    <div class="dropdown-menu">
                        <a data-toggle="modal" data-target="#staticBackdrop-brg_masuk1" data-id="{{ $data->id_brg_masuk }}"
                            class="dropdown-item ubah_barang_masuk" href="#"><i class="fas fa-edit"></i> Ubah</a>

                        <a data-date="{{ $data->tgl_brg_masuk }}"
                            data-name-type="{{ $data->nama_barang }} - {{ $data->tipe_barang }}"
                            data-id="{{ $data->id_brg_masuk }}" class="dropdown-item hapus_brg_masuk" href="#"><i
                                class="fas fa-trash"></i> Hapus</a>

                        <form id="delete_items_{{ $data->id_brg_masuk }}"
                            action="{{ route('barang_masuk.delete', [$data->id_brg_masuk, $data->tgl_brg_masuk]) }}"
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
        <td colspan="15" class="text-center">Barang masuk tidak ditemukan</td>
    </tr>
@endempty
