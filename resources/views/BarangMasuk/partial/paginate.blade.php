<div class="pagination-wrapper">
    {{ $barang_masuk->appends(['barangMasukLimit' => request('barangMasukLimit')])->links() }}
</div>
