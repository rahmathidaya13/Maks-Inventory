<div class="pagination-wrapper-home">
    {{ $transaksi->appends(['sales' => request('sales')])->links() }}
</div>
