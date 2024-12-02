function i(t){return new Intl.NumberFormat("id-ID",{style:"currency",currency:"IDR",minimumFractionDigits:0}).format(t).replace(/Rp\s/g,"")}function u(t){let e,a,n,s,l;return s=new Date(t),e=String(s.getDate()).padStart(2,"0"),a=String(s.getMonth()+1).padStart(2,"0"),n=s.getFullYear(),l=e+"-"+a+"-"+n,l}function r(t){return t?parseInt(t.replace(/\./g,"")):0}$(document).on("click","#add_transaksi",function(t){t.preventDefault(),$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$(".modal-title span").text("Buat Transaksi"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-money-bill-wave"),$(".modal-title i").addClass("fas fa-plus-square"),$("#transaksi_aksi span").text("Simpan"),$("#transaksi_aksi i").removeClass("fas fa-edit"),$("#transaksi_aksi i").removeClass("fas fa-money-bill-wave"),$("#transaksi_aksi i").addClass("fas fa-save"),$("#form_transaksi").attr("action","/transaksi/store"),$("input[name='_method']").remove(),$("#transaksi").prop("readonly",!1),$(".nama_brg_transaksi,.status_pembayaran").css("pointerEvents","all")});$(document).on("click",".ubah_transaksi",function(t){t.preventDefault();let e=$(this).data("id");$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$(".modal-title span").text("Ubah Data Transaksi"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-money-bill-wave"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-edit"),$("#transaksi_aksi span").text("Ubah"),$("#transaksi_aksi i").removeClass("fas fa-edit"),$("#transaksi_aksi i").removeClass("fas fa-money-bill-wave"),$("#transaksi_aksi i").removeClass("fas fa-save"),$("#transaksi_aksi i").addClass("fas fa-edit"),$("#form_transaksi").attr("action",`/transaksi/update/${e}`),$("#form_transaksi").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/transaksi/detail/${e}`,function(a){$("#id_barang").val(a.result.id_barang),$("#id_stok").val(a.result.id_stok),$("#transaksi").val(a.result.tgl_transaksi).prop("readonly",!0),$("#kode_transaksi").val(a.result.kode_transaksi),$("#nama_konsumen").val(a.result.nama_konsumen),$("#nohp").val(a.result.no_handphone),$("#alamat").val(a.result.alamat),$("#sales").val(a.result.nama_sales).trigger("change"),$("#kode_barang").val(a.result.kode_barang),$("#nama_brg_transaksi").val(a.result.nama_barang).trigger("change"),$("#posisi_brg_transaksi").val(a.result.posisi).trigger("change"),$(".nama_brg_transaksi,.status_pembayaran").css({pointerEvents:"none"}),$("#tipe_brg_transaksi").val(a.result.tipe_barang),$("#harga_brg_transaksi").val(i(a.result.harga_barang)),$("#jumlah_brg_transaksi").val(a.result.jumlah_barang).prop("readonly",!(a.result.jumlah_barang>0)),$("#status_pembayaran").val(a.result.status_pembayaran).trigger("change"),$("#status_transaksi").val(a.result.status_transaksi).trigger("change"),$("#diskon").val(parseInt(a.result.diskon)).prop("readonly",!(a.result.diskon>0)),$("#dp").val(i(a.result.dana_pertama)),$("#pembayaran").val(i(a.result.pembayaran)).prop("readonly",!(a.result.pembayaran>0)),$("#total_pembayaran").val(i(a.result.total_pembayaran)),$("#selisih").val(i(a.result.selisih_pembayaran))})});$(document).on("click",".hapus_transaksi",function(){let t=$(this).data("id"),e=$(this).data("customer"),a=$(this).data("code"),n=u($(this).data("date")),s=$("#delete_transaksi_"+t);Swal.fire({title:"Apakah kamu yakin?",text:`Data transaksi ( ${n} - ${a} - ${e} ) akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(l=>{l.isConfirmed&&s.submit()})});$(document).on("click","#act_close_pelunasan, #keluar_pelunasan, #act_close_keluar,#keluar_transaksi",function(t){t.preventDefault(),$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$("#pelunasan").attr("action","#"),$("#form_transaksi").attr("action","#"),$("input[name='_method']").remove()});$(document).on("click","#select_all_transaksi",function(){$(".selected").prop("checked",$(this).prop("checked"))});$(document).on("click","#delete_all_transaksi",function(t){t.preventDefault();let e=$(".selected:checked"),a=$('meta[name="csrf-token"]').attr("content");Swal.fire({title:"Apakah Anda yakin?",text:`${e.length} Item yang dipilih akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(n=>{if(n.isConfirmed)if(e.length>0){let s=e.map(function(){return $(this).data("id")}).get();$.ajax({url:"/delete/transaksi",type:"DELETE",data:{ids:s,_token:a},success:function(l){Swal.fire({position:"center",icon:"success",title:`${s.length} Item berhasil dihapus.`,showConfirmButton:!1,timer:1500}).then(()=>{location.reload()})},error:function(l){Swal.fire({icon:"error",title:"Terjadi kesalahan",text:"Saat menghapus item."})}})}else alert("Silakan pilih item yang ingin dihapus.")})});$(document).on("change",".selected,#select_all_transaksi",function(){$(".selected:checked").length>0?$("#delete_all_transaksi").prop("disabled",!1):$("#delete_all_transaksi").prop("disabled",!0)});$(document).on("change","#nama_brg_transaksi",function(){let t=$(this).find("option:selected");$("input[name='id_barang']").val(t.data("id")),$("input[name='tipe_brg_transaksi']").val(t.data("type")??"-"),$("input[name='harga_brg_transaksi']").val(i(t.data("price")??0))});$(document).on("change","#posisi_brg_transaksi",function(){let t=$('meta[name="csrf-token"]').attr("content"),e=$("#id_barang").val(),a=$(this).val(),n=$("#nama_brg_transaksi").val(),s=$("#tipe_brg_transaksi").val();$.ajax({method:"GET",url:"/stok_barang",data:{_token:t,id_barang:e,posisi:a,nama_barang:n,tipe_barang:s},dataType:"json",success:function(l){l&&l.result?($("input[name='stok']").val(l.result.stok_akhir),$("input[name='id_stok']").val(l.result.id_stok)):($("input[name='stok']").val(0),$("input[name='id_stok']").val(""))}})});$(document).on("change","#status_pembayaran",function(){$(this).find("option:selected").val()!=="lunas"?($("#dp").prop("readonly",!1),$("#dp").val(0),$(document).on("input","#pembayaran",function(a){a.preventDefault();let n=r($(this).val()),s=r($("#total_pembayaran").val());s=isNaN(s)?0:s,$("#selisih").val(i(s-n))})):($("#dp").prop("readonly",!0),$("#dp").val(0))});$("#jumlah_brg_transaksi, #stok, #diskon,#nohp, #kode_barang").on("input",function(){let e=$(this).val().replace(/[^,\d]/g,"");$(this).val(e)});$(document).on("input","#pembayaran",function(){let t=r($(this).val());r($("#total_pembayaran").val()),t=isNaN(t)?0:t,$(this).val(i(t))});$(document).on("input","#diskon",function(){let t=r($(this).val()),e=r($("#hasil").val()),a=r($("#dp").val()),n=e-e*(t/100);$("#total_pembayaran").val(i(n));let s=n-a;s=isNaN(s)?0:s,$("#selisih").val(i(s))});$(document).on("input","#jumlah_brg_transaksi",function(){let t=parseInt($(this).val()),e=r($("#harga_brg_transaksi").val()),a=t*e;a=isNaN(a)?0:a,$("#hasil").val(i(a)),$("#total_pembayaran").val(i(a))});$(document).on("input","#dp",function(){let t=$(this).val(),e=r(t),n=r($("#total_pembayaran").val())-e;e===0?n=isNaN(n)?n:0:n=isNaN(n)?0:n,$(this).val(i(e)),$("#selisih").val(i(n))});$(document).on("click",".pelunasan",function(){let t=$(this).data("id");$("#form_transaksi")[0].reset(),$(".modal-title span").text("Pelunasan"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-money-bill-wave"),$("#aksi_pelunasan span").text("Lunasi"),$("#aksi_pelunasan i").removeClass("fas fa-edit"),$("#aksi_pelunasan i").removeClass("fas fa-save"),$("#aksi_pelunasan i").addClass("fas fa-money-bill-wave"),$("#pelunasan").attr("action",`/transaksi/repayment/${t}`),$("#pelunasan").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/transaksi/detail/${t}`,function(e,a,n){$(document).on("input","#pembayaran_pelunasan",function(){let s=r($(this).val()),l=r($("#r_selisih").val());if(s===0)$("#selisih_pembayaran_").val(i(l));else{let o=l-s;o<0&&(o=0),$("#selisih_pembayaran_").val(i(o))}$(this).val(i(s))}),$("#konsumen").val(e.result.nama_konsumen).prop("readonly",!0),$("#hp").val(e.result.no_handphone).prop("readonly",!0),$("#alamat_konsumen").val(e.result.alamat).prop("readonly",!0),$("#dana_pertama").val(i(e.result.dana_pertama)).prop("readonly",!0),$("#hb").val(i(e.result.harga_barang)).prop("readonly",!0),$("#selisih_pembayaran_").val(i(e.result.selisih_pembayaran)).prop("readonly",!0),$("#r_selisih").val(i(e.result.selisih_pembayaran)).prop("readonly",!0)})});$("#filter_transaksi").val(10).trigger("change");$(document).on("change","#filter_transaksi",function(t){t.preventDefault();let e=$(this).val();$.ajax({type:"GET",url:"/transaksi/filter",data:{transaksiLimit:e},success:function(a){$("tbody#tableTransaksi").html(a.table),$(".pagination-wrapper").html(a.pagination),$("#info-transaksi-page").html(`Menampilkan <b>${a.info.firstItem??0}</b> sampai <b>${a.info.lastItem??0}</b> dari <b>${a.info.total??0}</b> item`)}})});$(document).on("click",".pagination a",function(t){t.preventDefault();let e=$(this).attr("href"),a=$("#filter_transaksi").val();e=new URL(e),e.searchParams.set("transaksiLimit",a),$.ajax({url:e.toString(),type:"GET",success:function(n){$("tbody#tableTransaksi").html(n.table),$(".pagination-wrapper").html(n.pagination),$("#info-transaksi-page").html(`Menampilkan <b>${n.info.firstItem??0}</b> sampai <b>${n.info.lastItem??0}</b> dari <b>${n.info.total??0}</b> item`)}})});$(document).on("input","#keyword_transaksi",function(t){t.preventDefault();let e=$(this).val();e===""?$("tbody").load(`/transaksi/search?query=${encodeURIComponent(e)}`,function(){window.history.pushState({},"","/transaksi")}):$("tbody").load("/transaksi/search?query="+encodeURIComponent(e),function(){$("tbody .nama_sales,.kode_transaksi, .nama_konsumen,.nama_barang_transaksi,.tipe_barang_transaksi").each(function(){let a=$(this).text();if(e){let n=new RegExp("("+e+")","gi"),s=a.replace(n,'<span class="highlight">$1</span>');$(this).html(s)}else $(this).html(a)})})});$(document).on("click","#export_transaksi",function(t){t.preventDefault(),$("#form_transaksi")[0].reset(),$("#import_transaksi_file")[0].reset(),$("#filter_date_transaksi")[0].reset(),$(".modal-title span").text("Export File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-download")});$(document).on("click","#set_filter_transaksi",function(t){t.preventDefault();let e=$("#start_date_filter_transaksi").val(),a=$("#end_date_filter_transaksi").val();$.ajax({type:"POST",url:"/transaksi/filter/date",data:{_token:$('meta[name="csrf-token"]').attr("content"),start_date:e,end_date:a},success:function(n){$("tbody").html(n),$(".pagination").html(n.pagination)},error:function(n){if(n.status===422){let s=n.responseJSON.errors,l="";s.start_date&&(l+=s.start_date[0]+"<br>"),s.end_date&&(l+=s.end_date[0]+"<br>"),Swal.fire({icon:"warning",title:"Validasi tanggal gagal",confirmButtonText:"OK"})}}})});$(document).on("change","#import_transaksi_form",function(t){let e=t.target.files[0];if(e){let a=new FileReader;a.onload=function(n){$("#preview").attr("src","assets/icon/excel.png")},a.readAsDataURL(e)}$("#file-name").text(e.name)});
