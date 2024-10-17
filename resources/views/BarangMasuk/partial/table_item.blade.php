{{-- @php
    $currentPage = $barang->currentPage();
    $perPage = $barang->perPage();
    $startNumbering = ($currentPage - 1) * $perPage;
@endphp


@empty($data)
    <tr>
        <td colspan="15" class="text-center">Barang tidak ditemukan</td>
    </tr>
@endempty --}}
