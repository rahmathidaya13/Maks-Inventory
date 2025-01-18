function d(t){let e,o,a,n,i;return n=new Date(t),e=String(n.getDate()).padStart(2,"0"),o=String(n.getMonth()+1).padStart(2,"0"),a=n.getFullYear(),i=e+"-"+o+"-"+a,i}function l(t,e){let o=!0;$(t).find("input,select").each(function(){if($(this).val().trim()==="")return o=!1,!1}),$(e).prop("disabled",!o)}$("#stokBarangForm").on("input",function(){l("#stokBarangForm",".simpan_stok")});$("#filter_date_stok").on("input",function(){l("#filter_date_stok",".act_filter_stok")});$(document).on("click","#select_all_stok",function(){$(".selected").prop("checked",$(this).prop("checked"))});$(document).on("change",".selected,#select_all_stok",function(){$(".selected:checked").length>0?$("#delete_all_stok").prop("disabled",!1):$("#delete_all_stok").prop("disabled",!0)});$(document).on("click","#delete_all_stok",function(t){t.preventDefault();let e=$(".selected:checked"),o=$('meta[name="csrf-token"]').attr("content");Swal.fire({title:"Apakah Anda yakin?",text:`${e.length} Item yang dipilih akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(a=>{if(a.isConfirmed)if(e.length>0){let n=e.map(function(){return $(this).data("id")}).get();$.ajax({url:"/delete/all/stok",type:"DELETE",data:{ids:n,_token:o},success:function(i){Swal.fire({position:"center",icon:"success",title:`${n.length} Item berhasil dihapus.`,showConfirmButton:!1,timer:1500}).then(()=>{location.reload()})},error:function(i){Swal.fire({icon:"error",title:"Terjadi kesalahan",text:"Saat menghapus item."})}})}else alert("Silakan pilih item yang ingin dihapus.")})});$(document).on("click","#stok_out, #stok_close,#act_import_stok,#act_filter_keluar_stok,#act_filter_close_stok",function(t){t.preventDefault(),$("input[name='_method']").remove(),$("#stokBarangForm").attr("action","#"),$("#stokBarangForm")[0].reset(),$("#filter_date_stok")[0].reset(),$("#import_stok_file")[0].reset(),$("#preview").attr("src","assets/icon/iconupload.jpg"),$("#file-name").text("File not found"),$(".simpan_stok").prop("disabled",!0),$(".act_filter_stok").prop("disabled",!0)});$(document).on("click","#add_stok_barang",function(t){t.preventDefault(),$("#stokBarangForm")[0].reset(),$("#filter_date_stok")[0].reset(),$("#import_stok_file")[0].reset(),$(".modal-title span").text("Buat Stok Baru"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-download"),$(".modal-title i").addClass("fas fa-plus-square"),$("#stok_save span").text("Simpan"),$("#stok_save i").removeClass("fas fa-edit").addClass("fas fa-save"),$("#stokBarangForm").attr("action","/stok/store"),$("input[name='_method']").remove(),$(".simpan_stok").prop("disabled",!0),$("#tgl").attr("readonly",!1),$(".nama_barang").css({pointerEvents:"all"})});$(document).on("change","#nama_barang",function(){let t=$(this).find("option:selected"),e=t.data("type");t.data("id");let o=t.data("first-stok"),a=t.data("last-stok"),n=t.data("stok-in"),i=t.data("stok-out");$("#tipe_barang").val(e),$("#stok_awal").val(o??0),$("#stok_akhir").val(a??0),$("#brg_masuk").val(n??0),$("#brg_keluar").val(i??0)});$(document).on("click",".ubah_stok",function(t){t.preventDefault(),Swal.fire({icon:"warning",title:"Ingin melakukan perubahan?",text:"Mengubah data ini dapat berdampak besar pada nilai yang ada. Pastikan kamu benar-benar yakin sebelum melanjutkan! Tindakan ini tidak dapat dibatalkan.",showCancelButton:!0,cancelButtonText:"Batal",cancelButtonColor:"#c82333",confirmButtonText:"Ya, Tetap ubah"}).then(e=>{if(e.isConfirmed){$(".simpan_stok").prop("disabled",!1),$("#staticBackdrop_stok_barang").modal("show"),$(".stok_out,.stok_close").click(function(a){a.preventDefault(),$("#staticBackdrop_stok_barang").modal("hide")});let o=$(this).data("id");$("#stokBarangForm")[0].reset(),$("#filter_date_stok")[0].reset(),$("#import_stok_file")[0].reset(),$(".modal-title span").text("Ubah Data Stok"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").removeClass("fas fa-download"),$(".modal-title i").addClass("fas fa-edit "),$("#stok_save span").text("Ubah"),$("#stok_save i").removeClass("fas fa-save").addClass("fas fa-edit"),$("#stokBarangForm").attr("action",`/stok/update/${o}`),$("#stokBarangForm").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/stok/detail/${o}`,function(a){let n=a.result.id_barang;$(".nama_barang").css({pointerEvents:"none"}),$("#id_barang").val(a.result.id_barang),$("#tgl").val(a.result.tanggal).attr("readonly",!0),$("#nama_barang").val(null),$("#nama_barang option").filter(function(){return $(this).data("id")==n}).prop("selected",!0),$("#nama_barang").trigger("change"),$("#tipe_barang").val(a.result.tipe_barang),$("#posisi_barang").val(a.result.posisi).trigger("change"),$("#jumlah_barang").val(a.result.stok_awal),$("#keterangan").val(a.result.keterangan)})}else e.isDenied&&Swal.fire("Changes are not saved","","info")})});$(document).on("click",".hapus_stok",function(t){t.preventDefault();let e=$(this).data("id"),o=$(`#delete_stok_${e}`),n=$(this).data("stok-field").split("/"),i=d(n[0]);Swal.fire({title:"Apakah kamu yakin?",text:`Data  ${i+" / "+n[1]+" / "+n[2]+" / "+n[3]} Akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(s=>{s.isConfirmed&&o.submit()})});$(document).on("change","#import_stok_form",function(t){let e=t.target.files[0];if(e){let o=new FileReader;o.onload=function(a){$("#preview").attr("src","assets/icon/excel.png")},o.readAsDataURL(e)}$("#file-name").text(e.name)});$(document).on("change","#filter_stok",function(t){t.preventDefault();let e=$(this).val();$.ajax({type:"GET",url:"/stok/filter",data:{stokLimit:e},success:function(o){$("tbody#tableStokBarang").html(o.table),$(".pagination-wrapper-stok").html(o.pagination),$("#info-stok-page").html(`Menampilkan <b>${o.info.firstItem??0}</b> sampai <b>${o.info.lastItem??0}</b> dari <b>${o.info.total??0}</b> item`)}})});$(document).on("click",".pagination a",function(t){t.preventDefault();let e=$(this).attr("href"),o=$("#filter_stok").val();e=new URL(e),e.searchParams.set("stokLimit",encodeURIComponent(o)),$.ajax({url:e.toString(),type:"GET",success:function(a){$("tbody#tableStokBarang").html(a.table),$(".pagination-wrapper-stok").html(a.pagination),$("#info-stok-page").html(`Menampilkan <b>${a.info.firstItem??0}</b> sampai <b>${a.info.lastItem??0}</b> dari <b>${a.info.total??0}</b> item`)}})});$(document).on("input","#keyword_stok",function(t){t.preventDefault();let e=$(this).val(),o=$('meta[name="csrf-token"]').attr("content"),a;e?a="/stok/search":a="/stok/filter",$.ajax({method:"GET",url:a,data:{stokKeyword:e,_token:o,stokLimit:10},success:function(n){e?($("tbody#tableStokBarang").html(n.table),$(".pagination-wrapper-stok").html(n.pagination),$("#info-stok-page").html(`Menampilkan <b>${n.info.firstItem??0}</b> sampai <b>${n.info.lastItem??0}</b> dari <b>${n.info.total??0}</b> item`),$("tbody .posisi_barang,.nama_brg_stok, .tipe_brg_stok").each(function(){let i=$(this).text();if(e){let s=new RegExp("("+e+")","gi"),r=i.replace(s,'<span class="highlight">$1</span>');$(this).html(r)}else $(this).html(i)})):($("tbody#tableStokBarang").html(n.table),$(".pagination-wrapper-stok").html(n.pagination),$("#info-stok-page").html(`Menampilkan <b>${n.info.firstItem??0}</b> sampai <b>${n.info.lastItem??0}</b> dari <b>${n.info.total??0}</b> item`))}})});$(document).on("click","#set_filter_stok",function(t){t.preventDefault();let e=$("#start_date_filter_stok").val(),o=$("#end_date_filter_stok").val();$.ajax({type:"POST",url:"/stok/filter/date",data:{_token:$('meta[name="csrf-token"]').attr("content"),start_date:e,end_date:o},success:function(a){$("tbody").html(a),$(".pagination").html(a.pagination)},error:function(a){if(a.status===422){let n=a.responseJSON.errors,i="";n.start_date&&(i+=n.start_date[0]+"<br>"),n.end_date&&(i+=n.end_date[0]+"<br>"),Swal.fire({icon:"warning",title:"Validasi tanggal gagal",confirmButtonText:"OK"})}}})});$(document).on("click","#export_stok_barang",function(t){t.preventDefault(),$("#stokBarangForm")[0].reset(),$("#import_stok_file")[0].reset(),$("#filter_date_stok")[0].reset(),$(".modal-title span").text("Export File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-download")});$(document).on("click","#import_stok",function(t){t.preventDefault(),$("#stokBarangForm")[0].reset(),$("#import_stok_file")[0].reset(),$("#filter_date_stok")[0].reset(),$(".modal-title span").text("Upload File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-download")});$("#filter_stok").val(10).trigger("change");
