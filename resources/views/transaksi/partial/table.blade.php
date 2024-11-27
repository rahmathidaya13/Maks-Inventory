@php
    $currentPage = $transaksi->currentPage();
    $perPage = $transaksi->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp
@foreach ($transaksi as $data)
    <tr id="transaksi_{{ $data->id_transaksi }}">
        <td class="text-center align-middle">
            <div class="form-check">
                <input class="form-check-input selected" type="checkbox" name="id_transaksi_all" id="id_transaksi_all"
                    data-id="{{ $data->id_transaksi }}">
                <label class="form-check-label"></label>
            </div>
        </td>
        <td class="align-middle">{{ $startNumbering + $loop->iteration }}</td>
        <td class="align-middle">{{ \Carbon\Carbon::parse($data->tgl_transaksi)->translatedFormat('l, d M Y') }}</td>
        <td class="align-middle kode_transaksi">{{ $data->kode_transaksi }}</td>
        <td class="align-middle nama_konsumen">{{ $data->nama_konsumen }}</td>
        <td class="align-middle nama_sales">{{ $data->nama_sales }}</td>
        <td class="text-wrap align-middle">{{ $data->kode_barang }}</td>
        <td class="text-wrap align-middle nama_barang_transaksi">{{ $data->nama_barang }}</td>
        <td class="align-middle tipe_barang_transaksi">{{ $data->tipe_barang }}</td>
        <td class="text-center align-middle">{{ $data->jumlah_barang }}</td>
        <td class="text-center align-middle">{{ $data->posisi }}</td>
        <td class="align-middle">{{ 'Rp ' . number_format((int) $data->harga_barang, 0, ',', '.') }}</td>
        <td class="align-middle text-center">
            @if ($data->status_pembayaran == 'lunas')
                <span class="badge badge-success">{{ ucwords($data->status_pembayaran) }}</span>
            @else
                <span class="badge badge-danger">{{ ucwords($data->status_pembayaran) . ' / Dp' }}</span>
            @endif
        </td>
        <td class="align-middle">{{ 'Rp ' . number_format((int) $data->pembayaran, 0, ',', '.') }}</td>
        <td class="align-middle">
            <div class="d-flex justify-content-center">
                <div class="dropdown">
                    <button class="btn btn-info btn-sm mx-1" type="button" data-toggle="dropdown"
                        aria-expanded="false">
                        <i class="fas fa-cog"></i>
                    </button>
                    <div class="dropdown-menu">
                        @if ($data->status_pembayaran !== 'lunas')
                            <a title="Pelunasan" data-id="{{ $data->id_transaksi }}"
                                class="dropdown-item pelunasan" type="button"
                                data-toggle="modal" data-target="#staticBackdrop_pelunasan" href="#">
                                <i class="fas fa-money-bill"></i> Pelunasan
                            </a>
                        @endif
                        @if ($data->status_pembayaran !== 'lunas')
                            <a title="Ubah" id="ubah_transaksi" data-toggle="modal"
                                data-target="#staticBackdrop_transaksi" data-id="{{ $data->id_transaksi }}"
                                class="dropdown-item ubah_transaksi" href="#"><i
                                    class="fas fa-edit"></i> Ubah
                            </a>
                        @endif

                        <a title="Hapus" data-date="{{ $data->tgl_transaksi }}"
                            data-code="{{ $data->kode_transaksi }}" data-customer="{{ $data->nama_konsumen }}"
                            data-id="{{ $data->id_transaksi }}" class="dropdown-item hapus_transaksi" href="#"><i
                                class="fas fa-trash"></i> Hapus</a>
                        <form id="delete_transaksi_{{ $data->id_transaksi }}"
                            action="{{ route('transaksi.delete', $data->id_transaksi) }}" method="POST"
                            class="d-inline">
                            @csrf
                            @method('DELETE')
                        </form>
                    </div>
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
