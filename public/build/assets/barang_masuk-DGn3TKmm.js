function u(e){let t,a,s,n,i;return n=new Date(e),t=String(n.getDate()).padStart(2,"0"),a=String(n.getMonth()+1).padStart(2,"0"),s=n.getFullYear(),i=t+"/"+a+"/"+s,i}function r(e,t){let a=!0;$(e).find("input,select").each(function(){if($(this).val().trim()==="")return a=!1,!1}),$(t).prop("disabled",!a)}$("#barangmasuk").on("input",function(){r("#barangmasuk",".simpan_barang_masuk")});$("#filter_date").on("input",function(){r("#filter_date",".act_filter")});$(document).on("click","#add_item_list",function(e){e.preventDefault(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$(".modal-title span").text("Tambah Barang Masuk"),$(".modal-title i").removeClass("fas fa-edit").addClass("fas fa-plus-square"),$("#aksi_brg_masuk span").text("Simpan"),$("#aksi_brg_masuk i").removeClass("fas fa-edit").addClass("fas fa-save"),$("#barangmasuk").attr("action","/barang_masuk/store"),$("input[name='_method']").remove(),$(".simpan_barang_masuk").prop("disabled",!0)});$(document).on("click",".act_stok_close ,#act_stok_close,#act_close,#act_keluar",function(e){e.preventDefault(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#nama_barang").trigger("change"),$("#tipe_barang_masuk").trigger("change"),$("input[name='_method']").remove(),$("#barangmasuk").attr("action","#"),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$("#preview").attr("src","assets/icon/iconupload.jpg"),$("#file-name").text("File not found"),$("#update_form_stok").length>0&&$("#update_form_stok")[0].reset(),$("#update_form_stok").attr("action","#")});$(document).on("change","#nama_barang",function(e){e.preventDefault();let a=$(this).find(":selected").data("id");$("#id_barang").val(a)});$("#jumlah_brg").on("input",function(){this.value=this.value.replace(/[^0-9]/g,"")});$(document).on("click","#add_item",function(e){e.preventDefault(),$(".simpan_barang_masuk").prop("disabled",!0),$("#form_item")[0].reset(),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#filter_date").length>0&&$("#filter_date")[0].reset(),$(".modal-title span").text("Tambah Barang"),$(".modal-title i").removeClass("fas fa-edit").addClass("fas fa-box"),$("#aksi_brg_masuk span").text("Simpan"),$("#aksi_brg_masuk i").removeClass("fas fa-edit").addClass("fas fa-save"),$("#form_item").attr("action","/list-item/store"),$("input[name='_method']").remove()});$(document).on("click",".ubah_barang_masuk",function(e){e.preventDefault(),$(".simpan_barang_masuk").prop("disabled",!1);let t=$(this).data("id");$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$(".modal-title span").text("Ubah Data Barang Masuk"),$(".modal-title i").removeClass("fas fa-plus-square").addClass("fas fa-edit"),$("#aksi_brg_masuk span").text("Ubah"),$("#aksi_brg_masuk i").removeClass("fas fa-save").addClass("fas fa-edit"),$("#barangmasuk").prepend('<input type="hidden" name="_method" value="PUT">'),$("#barangmasuk").attr("action","/barang_masuk/update/"+t),$.getJSON("/barang_masuk/detail/"+t,function(a,s,n){$("#id_barang").val(a.result.id_barang),$("#tgl_brg_masuk").val(a.result.tgl_brg_masuk),$("#no_warehouse").val(a.result.no_warehouse),$("#nama_barang").val(a.result.nama_barang).trigger("change"),$("#tipe_barang_masuk").val(a.result.tipe_barang).trigger("change"),$("#asal_gdg").val(a.result.asal_gudang),$("#jumlah_brg").val(a.result.jumlah_barang),$("#posisi_brg_masuk").val(a.result.posisi).trigger("change"),$("#status").val(a.result.status),$("#konsumen").val(a.result.nama_konsumen).val()!=="-"?$("#konsumen").prop("readonly",!1):$("#konsumen").prop("readonly",!0)})});$(document).on("click","#selectAllItem",function(){$(".selected_").prop("checked",$(this).prop("checked"))});$(document).on("change",".selected_,#selectAllItem",function(){$(".selected_:checked").length>0?$("#delete_all_brg_masuk").prop("disabled",!1):$("#delete_all_brg_masuk").prop("disabled",!0)});$(document).on("click","#delete_all_brg_masuk",function(e){e.preventDefault();let t=$(".selected_:checked"),a=$('meta[name="csrf-token"]').attr("content");Swal.fire({title:"Apakah Anda yakin?",text:`${t.length} Item yang dipilih akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(s=>{if(s.isConfirmed)if(t.length>0){let n=t.map(function(){return $(this).data("id")}).get();$.ajax({url:"/delete/barang_masuk",type:"DELETE",data:{ids:n,_token:a},success:function(i){Swal.fire({position:"center",icon:"success",title:`${n.length} Item berhasil dihapus.`,showConfirmButton:!1,timer:1500}).then(()=>{location.reload()})},error:function(i){Swal.fire({icon:"error",title:"Terjadi kesalahan",text:"Saat menghapus item."})}})}else alert("Silakan pilih item yang ingin dihapus.")})});$(document).on("click",".hapus_brg_masuk",function(){let e=$(this).data("id"),t=$(this).data("date"),a=$(this).data("name-type"),s=$("#delete_items_"+e);Swal.fire({title:"Apakah kamu yakin?",text:`Barang tanggal ${u(t)} ${a} ini akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(n=>{n.isConfirmed&&s.submit()})});$(document).on("change","#status",function(e){e.preventDefault(),$(this).val()=="customer"?$("#konsumen").prop("readonly",!1).val(""):$("#konsumen").prop("readonly",!0).val("-")});$(document).on("input","#keyword_brg_masuk",function(e){e.preventDefault();let t=$(this).val(),a=$('meta[name="csrf-token"]').attr("content"),s;t?s="/barang_masuk/search":s="/barang_masuk/filter",$.ajax({type:"GET",url:s,data:{itemInQuery:t,_token:a,barangMasukLimit:10},success:function(n){t?($("tbody#tableBarangMasuk").html(n.table),$(".pagination-wrapper").html(n.pagination),$("#info-barang_masuk-page").html(`Menampilkan <b>${n.info.firstItem??0}</b> sampai <b>${n.info.lastItem??0}</b> dari <b>${n.info.total??0}</b> item`),$("tbody#tableBarangMasuk .nama_brg_masuk, .tipe_brg_masuk").each(function(){let i=$(this).text();if(t){let l=new RegExp("("+t+")","gi"),o=i.replace(l,'<span class="highlight">$1</span>');$(this).html(o)}else $(this).html(i)})):($("tbody#tableBarangMasuk").html(n.table),$(".pagination-wrapper").html(n.pagination),$("#info-barang_masuk-page").html(`Menampilkan <b>${n.info.firstItem??0}</b> sampai <b>${n.info.lastItem??0}</b> dari <b>${n.info.total??0}</b> item`))}})});$(document).on("change","#filter_brg_masuk",function(){let e=$(this).val(),t=$('meta[name="csrf-token"]').attr("content");$.ajax({type:"GET",url:"/barang_masuk/filter",data:{barangMasukLimit:e,_token:t},success:function(a){$("tbody#tableBarangMasuk").html(a.table),$(".pagination-wrapper").html(a.pagination),$("#info-barang_masuk-page").html(`Menampilkan <b>${a.info.firstItem??0}</b> sampai <b>${a.info.lastItem??0}</b> dari <b>${a.info.total??0}</b> item`)}})});$(document).on("click",".pagination a",function(e){e.preventDefault();let t=$(this).attr("href"),a=$("#filter_brg_masuk").val();t=new URL(t),t.searchParams.set("barangMasukLimit",a),$.ajax({url:t.toString(),type:"GET",success:function(s){$("tbody#tableBarangMasuk").html(s.table),$(".pagination-wrapper").html(s.pagination),$("#info-barang_masuk-page").html(`Menampilkan <b>${s.info.firstItem??0}</b> sampai <b>${s.info.lastItem??0}</b> dari <b>${s.info.total??0}</b> item`)}})});$(document).on("change","#import_brg_masuk",function(e){let t=e.target.files[0];if(t){let a=new FileReader;a.onload=function(s){$("#preview").attr("src","assets/icon/excel.png")},a.readAsDataURL(t)}$("#file-name").text(t.name)});$(document).on("click","#export_barang_masuk",function(e){e.preventDefault(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$("#filter_date").length>0&&$("#filter_date")[0].reset(),$(".modal-title span").text("Export File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-download")});$(document).on("click","#set_brg_masuk",function(e){e.preventDefault();let t=$("#start_date_brg_masuk").val(),a=$("#end_date_brg_masuk").val();$.ajax({type:"POST",url:"/barang_masuk/filter/date",data:{_token:$('meta[name="csrf-token"]').attr("content"),start_date:t,end_date:a},success:function(s){$("tbody").html(s),$(".pagination").html(s.pagination)},error:function(s){if(s.status===422){let n=s.responseJSON.errors,i="";n.start_date&&(i+=n.start_date[0]+"<br>"),n.end_date&&(i+=n.end_date[0]+"<br>"),Swal.fire({icon:"warning",title:"Validasi tanggal gagal",confirmButtonText:"OK"})}}})});$(document).on("click","#import_item_list",function(e){e.preventDefault(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$("#filter_date").length>0&&$("#filter_date")[0].reset(),$(".modal-title span").text("Upload File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-file-upload")});$("#filter_brg_masuk").val(10).trigger("change");
