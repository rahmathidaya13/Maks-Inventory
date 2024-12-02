<div class="pagination-wrapper-stok">
    {{ $stok->appends(['stokLimit' => request('stokLimit')])->links() }}
</div>
