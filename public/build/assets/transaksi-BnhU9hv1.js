function p(){$(document).ready(function(){function r(t){return new Intl.NumberFormat("id-ID",{style:"currency",currency:"IDR",minimumFractionDigits:0}).format(t).replace(/Rp\s/g,"")}function m(t){let e,a,n,s,i;return s=new Date(t),e=String(s.getDate()).padStart(2,"0"),a=String(s.getMonth()+1).padStart(2,"0"),n=s.getFullYear(),i=e+"-"+a+"-"+n,i}function l(t){return t?parseInt(t.replace(/\./g,"")):0}$(document).on("click","#add_transaksi",function(t){t.preventDefault(),$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$(".modal-title span").text("Buat Transaksi"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-money-bill-wave"),$(".modal-title i").addClass("fas fa-plus-square"),$("#transaksi_aksi span").text("Simpan"),$("#transaksi_aksi i").removeClass("fas fa-edit"),$("#transaksi_aksi i").removeClass("fas fa-money-bill-wave"),$("#transaksi_aksi i").addClass("fas fa-save"),$("#form_transaksi").attr("action","/transaksi/store"),$("input[name='_method']").remove(),$("#transaksi").prop("readonly",!1),$(".nama_brg_transaksi,.status_pembayaran").css("pointerEvents","all")}),$(document).on("click",".ubah_transaksi",function(t){t.preventDefault();let e=$(this).data("id");$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$(".modal-title span").text("Ubah Data Transaksi"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-money-bill-wave"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-edit"),$("#transaksi_aksi span").text("Ubah"),$("#transaksi_aksi i").removeClass("fas fa-edit"),$("#transaksi_aksi i").removeClass("fas fa-money-bill-wave"),$("#transaksi_aksi i").removeClass("fas fa-save"),$("#transaksi_aksi i").addClass("fas fa-edit"),$("#form_transaksi").attr("action",`/transaksi/update/${e}`),$("#form_transaksi").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/transaksi/detail/${e}`,function(a){let n=a.result.id_barang;$("#id_barang").val(a.result.id_barang),$("#id_stok").val(a.result.id_stok),$("#transaksi").val(a.result.tgl_transaksi).prop("readonly",!0),$("#kode_transaksi").val(a.result.kode_transaksi),$("#nama_konsumen").val(a.result.nama_konsumen),$("#nohp").val(a.result.no_handphone),$("#alamat").val(a.result.alamat),$("#sales").val(a.result.nama_sales).trigger("change"),$("#kode_barang").val(a.result.kode_barang),$("#nama_brg_transaksi").val(null),$("#nama_brg_transaksi option").filter(function(){return $(this).data("id")==n}).prop("selected",!0),$("#nama_brg_transaksi").trigger("change"),$("#posisi_brg_transaksi").val(a.result.posisi).trigger("change"),$("#stts_barang").val(a.result.status_barang).trigger("change"),$(".nama_brg_transaksi,.status_pembayaran").css({pointerEvents:"none"}),$("#tipe_brg_transaksi").val(a.result.tipe_barang),$("#harga_brg_transaksi").val(r(a.result.harga_barang)),$("#jumlah_brg_transaksi").val(a.result.jumlah_barang).prop("readonly",!(a.result.jumlah_barang>0)),$("#status_pembayaran").val(a.result.status_pembayaran).trigger("change"),$("#status_transaksi").val(a.result.status_transaksi).trigger("change"),$("#diskon").val(parseInt(a.result.diskon)).prop("readonly",!(a.result.diskon>0)),$("#dp").val(r(a.result.dana_pertama)),$("#pembayaran").val(r(a.result.pembayaran)).prop("readonly",!(a.result.pembayaran>0)),$("#total_pembayaran").val(r(a.result.total_pembayaran)),$("#selisih").val(r(a.result.selisih_pembayaran))})}),$(document).on("click",".hapus_transaksi",function(){let t=$(this).data("id"),e=$(this).data("customer"),a=$(this).data("code"),n=m($(this).data("date")),s=$("#delete_transaksi_"+t);Swal.fire({title:"Apakah kamu yakin?",text:`Data transaksi ${n} - ${a} - ${e} akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(i=>{i.isConfirmed&&s.submit()})}),$(document).on("click","#act_close_pelunasan, #keluar_pelunasan, #act_close_keluar,#keluar_transaksi",function(t){t.preventDefault(),$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$("#pelunasan").attr("action","#"),$("#form_transaksi").attr("action","#"),$("input[name='_method']").remove()}),$(document).on("click","#select_all_transaksi",function(){$(".selected").prop("checked",$(this).prop("checked"))}),$(document).on("click","#delete_all_transaksi",function(t){t.preventDefault();let e=$(".selected:checked"),a=$('meta[name="csrf-token"]').attr("content");Swal.fire({title:"Apakah Anda yakin?",text:`${e.length} Item yang dipilih akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(n=>{if(n.isConfirmed)if(e.length>0){let s=e.map(function(){return $(this).data("id")}).get();$.ajax({url:"/delete/transaksi",type:"DELETE",data:{ids:s,_token:a},success:function(i){Swal.fire({position:"center",icon:"success",title:`${s.length} Item berhasil dihapus.`,showConfirmButton:!1,timer:1500}).then(()=>{location.reload()})},error:function(i){Swal.fire({icon:"error",title:"Terjadi kesalahan",text:"Saat menghapus item."})}})}else alert("Silakan pilih item yang ingin dihapus.")})}),$(document).on("change",".selected,#select_all_transaksi",function(){$(".selected:checked").length>0?$("#delete_all_transaksi").prop("disabled",!1):$("#delete_all_transaksi").prop("disabled",!0)}),$(document).on("change","#nama_brg_transaksi",function(){let t=$(this).find("option:selected");$("input[name='id_barang']").val(t.data("id")),$("input[name='tipe_brg_transaksi']").val(t.data("type")??"-"),$("input[name='harga_brg_transaksi']").val(r(t.data("price")??0))}),$(document).on("change",".posisi_brg_transaksi",function(){let t=$('meta[name="csrf-token"]').attr("content"),e=$("#id_barang").val(),a=$(this).val(),n=$("#nama_brg_transaksi").val(),s=$("#tipe_brg_transaksi").val();$.ajax({method:"GET",url:"/stok_barang",data:{_token:t,id_barang:e,posisi:a,nama_barang:n,tipe_barang:s},dataType:"json",success:function(i){i&&i.result?($("input[name='stok']").val(i.result.stok_akhir),$("input[name='id_stok']").val(i.result.id_stok)):($("input[name='stok']").val(0),$("input[name='id_stok']").val(""))}})}),$(document).on("change","#status_pembayaran",function(){$(this).find("option:selected").val()!=="lunas"?($("#dp").prop("readonly",!1),$("#dp").val(0),$(document).on("input","#pembayaran",function(a){a.preventDefault();let n=l($(this).val()),s=l($("#total_pembayaran").val());s=isNaN(s)?0:s,$("#selisih").val(r(s-n))})):($("#dp").prop("readonly",!0),$("#dp").val(0))}),$("#jumlah_brg_transaksi, #stok, #diskon,#nohp, #kode_barang").on("input",function(){let e=$(this).val().replace(/[^,\d]/g,"");$(this).val(e)}),$(document).on("input","#pembayaran",function(){let t=l($(this).val());l($("#total_pembayaran").val()),t=isNaN(t)?0:t,$(this).val(r(t))}),$(document).on("input","#diskon",function(){let t=l($(this).val()),e=l($("#hasil").val()),a=l($("#dp").val()),n=e-e*(t/100);$("#total_pembayaran").val(r(n));let s=n-a;s=isNaN(s)?0:s,$("#selisih").val(r(s))}),$(document).on("input","#jumlah_brg_transaksi",function(){let t=parseInt($(this).val()),e=l($("#harga_brg_transaksi").val()),a=t*e;a=isNaN(a)?0:a,$("#hasil").val(r(a)),$("#total_pembayaran").val(r(a))}),$(document).on("input","#dp",function(){let t=$(this).val(),e=l(t),n=l($("#total_pembayaran").val())-e;e===0?n=isNaN(n)?n:0:n=isNaN(n)?0:n,$(this).val(r(e)),$("#selisih").val(r(n))}),$(document).on("click",".pelunasan",function(){let t=$(this).data("id");$("#form_transaksi")[0].reset(),$(".modal-title span").text("Pelunasan & Ambil Barang"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-money-bill-wave"),$("#aksi_pelunasan span").text("Simpan"),$("#aksi_pelunasan i").removeClass("fas fa-edit"),$("#aksi_pelunasan i").removeClass("fas fa-save"),$("#aksi_pelunasan i").addClass("fas fa-money-bill-wave"),$("#pelunasan").attr("action",`/transaksi/repayment/${t}`),$("#pelunasan").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/transaksi/detail/${t}`,function(e,a,n){$(document).on("input","#pembayaran_pelunasan",function(){let s=l($(this).val()),i=l($("#r_selisih").val());if(s===0)$("#selisih_pembayaran_").val(r(i));else{let o=i-s;o<0&&(o=0),$("#selisih_pembayaran_").val(r(o))}$(this).val(r(s))}),$("#konsumen").val(e.result.nama_konsumen).prop("readonly",!0),$("#hp").val(e.result.no_handphone).prop("readonly",!0),$("#alamat_konsumen").val(e.result.alamat).prop("readonly",!0),$("#dana_pertama").val(r(e.result.dana_pertama)).prop("readonly",!0),$("#hb").val(r(e.result.harga_barang)).prop("readonly",!0),$("#nama_brg_lunas").val(e.result.nama_barang),$("#tipe_brg_lunas").val(e.result.tipe_barang),$("#selisih_pembayaran_").val(r(e.result.selisih_pembayaran)).prop("readonly",!0),$("#r_selisih").val(r(e.result.selisih_pembayaran)).prop("readonly",!0)})}),$(document).on("change","#filter_transaksi",function(t){t.preventDefault();let e=$(this).val(),a=$('meta[name="csrf-token"]').attr("content");$.ajax({type:"GET",url:"/transaksi/filter",data:{transaksiLimit:e,_token:a},success:function(n){$("tbody#tableTransaksi").html(n.table),$(".pagination-wrapper").html(n.pagination),$("#info-transaksi-page").html(`Menampilkan <b>${n.info.firstItem??0}</b> sampai <b>${n.info.lastItem??0}</b> dari <b>${n.info.total??0}</b> item`)}})}),$(document).on("click",".pagination a",function(t){t.preventDefault();let e=$(this).attr("href"),a=$("#filter_transaksi").val();e=new URL(e),e.searchParams.set("transaksiLimit",a),$.ajax({type:"GET",url:e.toString(),success:function(n){$("tbody#tableTransaksi").html(n.table),$(".pagination-wrapper").html(n.pagination),$("#info-transaksi-page").html(`Menampilkan <b>${n.info.firstItem??0}</b> sampai <b>${n.info.lastItem??0}</b> dari <b>${n.info.total??0}</b> item`)}})}),$(document).on("input","#keyword_transaksi",function(t){t.preventDefault();let e=$(this).val(),a=$('meta[name="csrf-token"]').attr("content"),n;e?n="/transaksi/search":n="/transaksi/filter",$.ajax({type:"GET",url:n,data:{transaksiQuery:e,_token:a,transaksiLimit:10},success:function(s){e?($("tbody#tableTransaksi").html(s.table),$(".pagination-wrapper").html(s.pagination),$("#info-transaksi-page").html(`Menampilkan <b>${s.info.firstItem??0}</b> sampai <b>${s.info.lastItem??0}</b> dari <b>${s.info.total??0}</b> item`),$("tbody#tableTransaksi .nama_sales,.kode_transaksi, .nama_konsumen,.nama_barang_transaksi,.tipe_barang_transaksi").each(function(){let i=$(this).text();if(e){let o=new RegExp("("+e+")","gi"),u=i.replace(o,'<span class="highlight">$1</span>');$(this).html(u)}else $(this).html(i)})):($("tbody#tableTransaksi").html(s.table),$(".pagination-wrapper").html(s.pagination),$("#info-transaksi-page").html(`Menampilkan <b>${s.info.firstItem??0}</b> sampai <b>${s.info.lastItem??0}</b> dari <b>${s.info.total??0}</b> item`))}})}),$(document).on("click","#export_transaksi",function(t){t.preventDefault(),$("#form_transaksi")[0].reset(),$("#import_transaksi_file")[0].reset(),$("#filter_date_transaksi")[0].reset(),$(".modal-title span").text("Export File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-download")}),$(document).on("click","#set_filter_transaksi",function(t){t.preventDefault();let e=$("#start_date_filter_transaksi").val(),a=$("#end_date_filter_transaksi").val();$.ajax({type:"POST",url:"/transaksi/filter/date",data:{_token:$('meta[name="csrf-token"]').attr("content"),start_date:e,end_date:a},success:function(n){$("tbody").html(n),$(".pagination").html(n.pagination)},error:function(n){if(n.status===422){let s=n.responseJSON.errors,i="";s.start_date&&(i+=s.start_date[0]+"<br>"),s.end_date&&(i+=s.end_date[0]+"<br>"),Swal.fire({icon:"warning",title:"Validasi tanggal gagal",confirmButtonText:"OK"})}}})}),$(document).on("change","#import_transaksi_form",function(t){let e=t.target.files[0];if(e){let a=new FileReader;a.onload=function(n){$("#preview").attr("src","assets/icon/excel.png")},a.readAsDataURL(e)}$("#file-name").text(e.name)}),$("#filter_transaksi").val(10).trigger("change"),$(document).on("click",".ambil_barang",function(t){t.preventDefault();let e=$(this).data("id");$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$(".modal-title span").text("Ambil Barang"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").removeClass("fas fa-money-bill-wave"),$(".modal-title i").addClass("fas fa-people-carry"),$("#submit_ambil_barang i").removeClass("fas fa-edit"),$("#submit_ambil_barang i").removeClass("fas fa-save"),$("#submit_ambil_barang i").removeClass("fas fa-money-bill-wave"),$("#submit_ambil_barang i").addClass("fas fa-save"),$("#submit_ambil_barang span").text("Simpan"),$("#form_ambil_barang").attr("action",`/transaksi/takeAway/${e}`),$("#form_ambil_barang").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/transaksi/detail/${e}`,function(a){$("#konsumen_ambil_barang").val(a.result.nama_konsumen),$("#hp_ambil_barang").val(a.result.no_handphone),$("#alamat_ambil_barang").val(a.result.alamat),$("#kode_ambil_barang").val(a.result.kode_barang),$("#nama_barang_ambil_barang").val(a.result.nama_barang),$("#tipe_barang_ambil_barang").val(a.result.tipe_barang),$("#jumlah_ambil_barang").val(a.result.jumlah_barang),$("#harga_ambil_barang").val(r(a.result.harga_barang)),$("#pembayaran_ambil_barang").val(r(a.result.pembayaran))})}),$(document).on("change","#stts_pembayaran",function(t){t.preventDefault();let e=$(this).val(),a=$('meta[name="csrf-token"]').attr("content"),n;e?n="/transaksi/filter/pembayaran":n="/transaksi/filter",$.ajax({type:"GET",url:n,data:{value:e,_token:a,transaksiLimit:10},success:function(s){$("tbody#tableTransaksi").html(s.table),$(".pagination-wrapper").html(s.pagination),$("#info-transaksi-page").html(`Menampilkan <b>${s.info.firstItem??0}</b> sampai <b>${s.info.lastItem??0}</b> dari <b>${s.info.total??0}</b> item`)}})}),$(document).on("click",".data_sparepart",function(t){t.preventDefault();let e=$(this).data("id");$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$(".modal-title span").text("Form Ubah Data Sparepart"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").removeClass("fas fa-money-bill-wave"),$(".modal-title i").remove("fas fa-people-carry"),$(".modal-title i").addClass("fas fa-edit"),$("#submit_data_sparepart i").removeClass("fas fa-save"),$("#submit_data_sparepart i").removeClass("fas fa-money-bill-wave"),$("#submit_data_sparepart i").removeClass("fas fa-save"),$("#submit_data_sparepart i").addClass("fas fa-edit"),$("#submit_data_sparepart span").text("Ubah"),$("#form_data_sparepart").attr("action",`/transaksi/spareparts/${e}`),$("#form_data_sparepart").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/transaksi/detail/${e}`,function(a){$("#nama_cs_sparepart").val(a.result.nama_konsumen),$("#nohp_cs_sparepart").val(a.result.no_handphone),$("#alamat_cs_sparepart").val(a.result.alamat),$("#kode_cs_sparepart").val(a.result.kode_barang),$("#barang_cs_sparepart").val(a.result.nama_barang),$("#tipe_cs_sparepart").val(a.result.tipe_barang),$("#jumlah_cs_sparepart").val(a.result.jumlah_barang),$("#harga_cs_sparepart").val(r(a.result.harga_barang)),$("#pembayaran_cs_sparepart").val(a.result.status_pembayaran)})})})}export{p as default};
