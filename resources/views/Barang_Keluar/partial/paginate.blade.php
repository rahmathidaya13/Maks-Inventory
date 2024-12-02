<div class="pagination-wrapper">
    {{ $barang_keluar->appends(['barangKeluarLimit' => request('barangKeluarLimit')])->links() }}
</div>
