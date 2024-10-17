@php
    $currentPage = $barang_masuk->currentPage();
    $perPage = $barang_masuk->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($barang_masuk as $data)
<tr id="barang_masuk_{{$data->id_brg_masuk}}">
    <td class="text-center">
        <div class="form-check">
            <input class="form-check-input selected_" type="checkbox" name="id_brg_masuk" id="id_brg_masuk" data-id="{{ $data->id_brg_masuk }}">
            <label class="form-check-label"></label>
          </div>
    </td>
    <td>{{ $startNumbering + $loop->iteration }}</td>
    <td>{{ \Carbon\Carbon::parse($data->tgl_brg_masuk)->translatedFormat('l, d F Y') }}</td>
    <td >{{ $data->no_warehouse }}</td>
    <td>{{ $data->nama_barang }}</td>
    <td>{{ $data->tipe_barang }}</td>
    <td>{{ $data->asal_gudang }}</td>
    <td>{{ $data->jumlah_barang }}</td>
    <td>
        <button data-toggle="modal" data-target="#staticBackdrop1" data-id="{{ $data->id_brg_masuk }}"
            type="button" class="btn btn-info btn-sm ubah_barang_masuk"><i class="fas fa-edit"></i>
            <span>Ubah</span></button>
        <button data-id="{{ $data->id_brg_masuk }}" class="btn btn-danger btn-sm hapus_brg_masuk"><i class="fas fa-trash"></i>
            <span>Hapus</span></button>
        <form id="delete_item_{{ $data->id_brg_masuk }}" action="{{ route('barang_masuk.delete', $data->id_brg_masuk) }}"
            method="POST" class="d-inline">
            @csrf
            @method('DELETE')
        </form>
    </td>
</tr>
@endforeach

@empty($data)
    <tr>
        <td colspan="15" class="text-center">Barang tidak ditemukan</td>
    </tr>
@endempty
