$(document).on("keyup","#sales_keyword",function(a){a.preventDefault();let e=$(this).val().trim();e===""?$("#tabel_penjualan").load(`/home/search?query=${encodeURIComponent(e)}`,function(){window.history.pushState({},"","/home")}):$("#tabel_penjualan").load("/home/search?query="+encodeURIComponent(e),function(){$("#tabel_penjualan .nama_sales,.nama-barang, .tipe-barang").each(function(){let t=$(this).text();if(e){let n=new RegExp("("+e+")","gi"),l=t.replace(n,'<span class="highlight">$1</span>');$(this).html(l)}else $(this).html(t)})})});