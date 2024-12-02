<div class="pagination-wrapper">
    {{ $barang->appends(['barangLimit' => request('barangLimit')])->links() }}
</div>
