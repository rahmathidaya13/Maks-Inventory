$(document).on("click","#set_filter_item_out",function(n){n.preventDefault();let e=$("#start_date_item_in").val(),i=$("#end_date_item_out").val();$.ajax({type:"POST",url:"/barang_keluar/filter/date",data:{_token:$('meta[name="csrf-token"]').attr("content"),start_date:e,end_date:i},success:function(t){$("tbody").html(t),$(".pagination").html(t.pagination)}})});$(document).on("click","#export_barang_keluar",function(n){n.preventDefault(),$("#filter_date_barang_keluar")[0].reset(),$(".modal-title span").text("Export File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-download")});$(document).on("input","#keyword_barang_keluar",function(n){n.preventDefault();let e=$(this).val().trim(),i=$('meta[name="csrf-token"]').attr("content"),t;e?t="/barang_keluar/search":t="/barang_keluar/filter",$.ajax({type:"GET",url:t,data:{itemOutKeyword:encodeURIComponent(e),_token:i,barangKeluarLimit:10},success:function(a){e?($("tbody#tableBarangKeluar").html(a.table),$(".pagination-wrapper").html(a.pagination),$("#info-barang_keluar-page").html(`Menampilkan <b>${a.info.firstItem??0}</b> sampai <b>${a.info.lastItem??0}</b> dari <b>${a.info.total??0}</b> item`),$("tbody#tableBarangKeluar .nama_barang, .tipe_barang,.no_handphone,.nama_konsumen").each(function(){let l=$(this).text();if(e){let r=new RegExp("("+e+")","gi"),o=l.replace(r,'<span class="highlight">$1</span>');$(this).html(o)}else $(this).html(l)})):($("tbody#tableBarangKeluar").html(a.table),$(".pagination-wrapper").html(a.pagination),$("#info-barang_keluar-page").html(`Menampilkan <b>${a.info.firstItem??0}</b> sampai <b>${a.info.lastItem??0}</b> dari <b>${a.info.total??0}</b> item`))}})});$(document).on("change","#limit_barang_keluar",function(n){n.preventDefault();let e=$(this).val(),i=$('meta[name="csrf-token"]').attr("content");$.ajax({type:"GET",url:"/barang_keluar/filter",data:{barangKeluarLimit:e,_token:i},success:function(t){$("tbody#tableBarangKeluar").html(t.table),$(".pagination-wrapper").html(t.pagination),$("#info-barang_keluar-page").html(`Menampilkan <b>${t.info.firstItem??0}</b> sampai <b>${t.info.lastItem??0}</b> dari <b>${t.info.total??0}</b> item`)}})});$(document).on("click",".pagination a",function(n){n.preventDefault();let e=$(this).attr("href"),i=$("#limit_barang_keluar").val();e=new URL(e),e.searchParams.set("barangKeluarLimit",i),$.ajax({url:e.toString(),type:"GET",success:function(t){$("tbody#tableBarangKeluar").html(t.table),$(".pagination-wrapper").html(t.pagination),$("#info-barang_keluar-page").html(`Menampilkan <b>${t.info.firstItem??0}</b> sampai <b>${t.info.lastItem??0}</b> dari <b>${t.info.total??0}</b> item`)}})});$("#limit_barang_keluar").val(10).trigger("change");