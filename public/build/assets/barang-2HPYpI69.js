function s(t){let e,n,a,i,l,o;return e=t.toString().replace(/[^,\d]/g,""),n=e.split(","),a=n[0].length%3,i=n[0].substr(0,a),l=n[0].substr(a).match(/\d{3}/gi),l&&(o=a?".":"",i+=o+l.join(".")),i}function m(t,e){let n=!0;$(t).each(function(){if($(this).val().trim()==="")return n=!1,!1}),$(e).prop("disabled",!n)}function c(t){return new Intl.NumberFormat("id-ID",{style:"currency",currency:"IDR",minimumFractionDigits:0}).format(t).replace(/Rp\s/g,"")}$("#form_item").on("input",function(){m("#form_item input",".simpan_barang")});$(document).on("click","#add_item",function(t){t.preventDefault(),$("#form_item")[0].reset(),$(".modal-title span").text("Tambah Barang"),$(".modal-title i").removeClass("fas fa-edit").addClass("fas fa-box"),$("#action span").text("Simpan"),$("#action i").removeClass("fas fa-edit").addClass("fas fa-save"),$("#form_item").attr("action","/list-item/store"),$("input[name='_method']").remove(),$(".simpan_barang").prop("disabled",!0)});$(document).on("click","#keluar, .close",function(t){t.preventDefault(),$("#form_item").length&&$("#form_item")[0].reset(),$("input[name='_method']").remove(),$("#form_item").attr("action","#"),$("#import_s").length&&$("#import_s")[0].reset(),$("#preview").attr("src","assets/icon/iconupload.jpg"),$("#file-name").text("File not found")});$(document).on("input","#keyword",function(t){t.preventDefault();let e=$(this).val(),n=$('meta[name="csrf-token"]').attr("content"),a;e?a="/item/search":a="/item/offset",$.ajax({method:"GET",url:a,data:{itemQuery:e,_token:n,barangLimit:10},success:function(i){e?($("tbody#tableBarang").html(i.table),$(".pagination-wrapper").html(i.pagination),$("#info-barang-page").html(`Menampilkan <b>${i.info.firstItem??0}</b> sampai <b>${i.info.lastItem??0}</b> dari <b>${i.info.total??0}</b> item`),$("tbody#tableBarang .nama-barang, .tipe-barang").each(function(){let l=$(this).text();if(e){let o=new RegExp("("+e+")","gi"),r=l.replace(o,'<span class="highlight">$1</span>');$(this).html(r)}else $(this).html(l)})):($("tbody#tableBarang").html(i.table),$(".pagination-wrapper").html(i.pagination),$("#info-barang-page").html(`Menampilkan <b>${i.info.firstItem??0}</b> sampai <b>${i.info.lastItem??0}</b> dari <b>${i.info.total??0}</b> item`))}})});$(document).on("click",".ubah",function(t){t.preventDefault();let e=$(this).data("id");$("#form_item")[0].reset(),$(".modal-title span").text("Ubah Data Barang"),$(".modal-title i").removeClass("fas fa-plus-square").addClass("fas fa-edit"),$("#action span").text("Ubah"),$("#action i").removeClass("fas fa-save").addClass("fas fa-edit"),$("#form_item").prepend('<input type="hidden" name="_method" value="PUT">'),$("#form_item").attr("action","/list-item/update/"+e),$(".simpan_barang").prop("disabled",!1),$.getJSON("/list-item/show/"+e,function(n,a,i){$("#nama_brg").val(n.result.nama_barang),$("#tipe_brg").val(n.result.tipe_barang),$("#harga_brg").val(c(n.result.harga_barang))})});$(document).on("click",".hapus",function(t){t.preventDefault();let e=$(this).data("id"),n=$(this).data("name-type"),a=$("#delete_item_"+e);Swal.fire({title:"Apakah kamu yakin?",text:`Data barang ${n} akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(i=>{i.isConfirmed&&a.submit()})});$(document).on("click","#delete_all",function(t){t.preventDefault();let e=$(".selected:checked"),n=$('meta[name="csrf-token"]').attr("content");Swal.fire({title:"Apakah Anda yakin?",text:`${e.length} Item yang dipilih akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(a=>{if(a.isConfirmed)if(e.length>0){let i=e.map(function(){return $(this).data("id")}).get();$.ajax({url:"/delete_all",type:"DELETE",data:{ids:i,_token:n},success:function(l){Swal.fire({position:"center",icon:"success",title:`${i.length} Item berhasil dihapus.`,showConfirmButton:!1,timer:1500}).then(()=>{location.reload()})},error:function(l){Swal.fire({icon:"error",title:"Terjadi kesalahan",text:"Saat menghapus item."})}})}else alert("Silakan pilih item yang ingin dihapus.")})});$(document).on("change","#offset",function(t){t.preventDefault();let e=$(this).val(),n=$('meta[name="csrf-token"]').attr("content");$.ajax({type:"GET",url:"/item/offset",data:{barangLimit:e,_token:n},success:function(a){$("tbody#tableBarang").html(a.table),$(".pagination-wrapper").html(a.pagination),$("#info-barang-page").html(`Menampilkan <b>${a.info.firstItem??0}</b> sampai <b>${a.info.lastItem??0}</b> dari <b>${a.info.total??0}</b> item`)}})});$(document).on("click",".pagination a",function(t){t.preventDefault();let e=$(this).attr("href"),n=$("#offset").val();e=new URL(e),e.searchParams.set("barangLimit",n),$.ajax({url:e.toString(),type:"GET",success:function(a){$("tbody#tableBarang").html(a.table),$(".pagination-wrapper").html(a.pagination),$("#info-barang-page").html(`Menampilkan <b>${a.info.firstItem??0}</b> sampai <b>${a.info.lastItem??0}</b> dari <b>${a.info.total??0}</b> item`)}})});$(document).on("change","#imports",function(t){t.preventDefault();let e=t.target.files[0];if(e){let n=new FileReader;n.onload=function(a){$("#preview").attr("src","assets/icon/excel.png")},n.readAsDataURL(e)}$("#file-name").text(e.name)});$(document).on("click","#selectAll",function(t){$(".selected").prop("checked",$(this).prop("checked"))});$(document).on("change",".selected,#selectAll",function(){$(".selected:checked").length>0?$("#delete_all").prop("disabled",!1):$("#delete_all").prop("disabled",!0)});$(document).on("keyup","#harga_brg",function(){let e=$(this).val().replace(/[^,\d]/g,"");$(this).val(s(e))});$(document).on("submit","#form_item",function(){let e=$("#harga_brg").val().replace(/\./g,"");$("#harga_brg").val(e)});$("#offset").val(10).trigger("change");
