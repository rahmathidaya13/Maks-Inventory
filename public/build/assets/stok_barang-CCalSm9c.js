function r(t){let e,a,o,n,i;return n=new Date(t),e=String(n.getDate()).padStart(2,"0"),a=String(n.getMonth()+1).padStart(2,"0"),o=n.getFullYear(),i=e+"-"+a+"-"+o,i}function s(t,e){let a=!0;$(t).find("input,select").each(function(){if($(this).val().trim()==="")return a=!1,!1}),$(e).prop("disabled",!a)}$("#stokBarangForm").on("input",function(){s("#stokBarangForm",".simpan_stok")});$("#filter_date_stok").on("input",function(){s("#filter_date_stok",".act_filter_stok")});$(document).on("click","#select_all_stok",function(){$(".selected").prop("checked",$(this).prop("checked"))});$(document).on("change",".selected,#select_all_stok",function(){$(".selected:checked").length>0?$("#delete_all_stok").prop("disabled",!1):$("#delete_all_stok").prop("disabled",!0)});$(document).on("click","#delete_all_stok",function(t){t.preventDefault();let e=$(".selected:checked"),a=$('meta[name="csrf-token"]').attr("content");Swal.fire({title:"Apakah Anda yakin?",text:`${e.length} Item yang dipilih akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(o=>{if(o.isConfirmed)if(e.length>0){let n=e.map(function(){return $(this).data("id")}).get();$.ajax({url:"/delete/all/stok",type:"DELETE",data:{ids:n,_token:a},success:function(i){Swal.fire({position:"center",icon:"success",title:`${n.length} Item berhasil dihapus.`,showConfirmButton:!1,timer:1500}).then(()=>{location.reload()})},error:function(i){Swal.fire({icon:"error",title:"Terjadi kesalahan",text:"Saat menghapus item."})}})}else alert("Silakan pilih item yang ingin dihapus.")})});$(document).on("click","#stok_out, #stok_close,#act_import_stok,#act_filter_keluar_stok,#act_filter_close_stok",function(t){t.preventDefault(),$("input[name='_method']").remove(),$("#stokBarangForm").attr("action","#"),$("#stokBarangForm")[0].reset(),$("#filter_date_stok")[0].reset(),$("#import_stok_file")[0].reset(),$("#preview").attr("src","assets/icon/iconupload.jpg"),$("#file-name").text("File not found"),$(".simpan_stok").prop("disabled",!0),$(".act_filter_stok").prop("disabled",!0)});$(document).on("click","#add_stok_barang",function(t){t.preventDefault(),$("#stokBarangForm")[0].reset(),$("#filter_date_stok")[0].reset(),$("#import_stok_file")[0].reset(),$(".modal-title span").text("Buat Stok Baru"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-download"),$(".modal-title i").addClass("fas fa-plus-square"),$("#stok_save span").text("Simpan"),$("#stok_save i").removeClass("fas fa-edit").addClass("fas fa-save"),$("#stokBarangForm").attr("action","/stok/store"),$("input[name='_method']").remove(),$(".simpan_stok").prop("disabled",!0)});$(document).on("change","#nama_barang",function(){let t=$(this).find("option:selected"),e=t.data("id"),a=t.data("first-stok"),o=t.data("last-stok"),n=t.data("stok-in"),i=t.data("stok-out");$("#tipe_barang").val(""),$("#tipe_barang option").each(function(){$(this).data("id")===e&&$(this).prop("selected",!0).trigger("change")}),$("#stok_awal").val(a??0),$("#stok_akhir").val(o??0),$("#brg_masuk").val(n??0),$("#brg_keluar").val(i??0)});$(document).on("click",".ubah_stok",function(t){t.preventDefault(),Swal.fire({icon:"warning",title:"Ingin melakukan perubahan?",text:"Mengubah data ini dapat berdampak besar pada nilai yang ada. Pastikan kamu benar-benar yakin sebelum melanjutkan! Tindakan ini tidak dapat dibatalkan.",showCancelButton:!0,cancelButtonText:"Batal",cancelButtonColor:"#c82333",confirmButtonText:"Ya, Tetap ubah"}).then(e=>{if(e.isConfirmed){$(".simpan_stok").prop("disabled",!1),$("#staticBackdrop_stok_barang").modal("show"),$(".stok_out,.stok_close").click(function(o){o.preventDefault(),$("#staticBackdrop_stok_barang").modal("hide")});let a=$(this).data("id");$("#stokBarangForm")[0].reset(),$("#filter_date_stok")[0].reset(),$("#import_stok_file")[0].reset(),$(".modal-title span").text("Ubah Data Stok"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").removeClass("fas fa-download"),$(".modal-title i").addClass("fas fa-edit "),$("#stok_save span").text("Ubah"),$("#stok_save i").removeClass("fas fa-save").addClass("fas fa-edit"),$("#stokBarangForm").attr("action",`/stok/update/${a}`),$("#stokBarangForm").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/stok/detail/${a}`,function(o,n,i){$("#id_barang").val(o.result.id_barang),$("#tgl").val(o.result.tanggal),$("#nama_barang").val(o.result.nama_barang).trigger("change"),$("#tipe_barang").val(o.result.tipe_barang).trigger("change"),$("#posisi_barang").val(o.result.posisi).trigger("change"),$("#jumlah_barang").val(o.result.stok_awal),$("#keterangan").val(o.result.keterangan)})}else e.isDenied&&Swal.fire("Changes are not saved","","info")})});$(document).on("click",".hapus_stok",function(t){t.preventDefault();let e=$(this).data("id"),a=$(`#delete_stok_${e}`),n=$(this).data("stok-field").split("/"),i=r(n[0]);Swal.fire({title:"Apakah kamu yakin?",text:`Data [ ${i+" / "+n[1]+" / "+n[2]+" / "+n[3]} ] Akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(l=>{l.isConfirmed&&a.submit()})});$(document).on("change","#import_stok_form",function(t){let e=t.target.files[0];if(e){let a=new FileReader;a.onload=function(o){$("#preview").attr("src","assets/icon/excel.png")},a.readAsDataURL(e)}$("#file-name").text(e.name)});$(document).on("change","#filter_stok",function(t){t.preventDefault();let e=$(this).val();$("tbody").load("/stok/filter?offset="+e,function(a){$(this).html(a.table),$(".pagination").html(a.pagination)})});$(document).on("keyup","#keyword_stok",function(t){t.preventDefault();let e=$(this).val().trim();e===""?$("tbody").load("/stok/search?query="+encodeURIComponent(e),function(a){window.history.pushState({},"","/stok"),$(".pagination").html(a.pagination)}):$("tbody").load("/stok/search?query="+encodeURIComponent(e),function(){$("tbody .posisi_barang,.nama_brg_stok, .tipe_brg_stok").each(function(){let a=$(this).text();if(e){let o=new RegExp("("+e+")","gi"),n=a.replace(o,'<span class="highlight">$1</span>');$(this).html(n)}else $(this).html(a)})})});$(document).on("click","#set_filter_stok",function(t){t.preventDefault();let e=$("#start_date_filter_stok").val(),a=$("#end_date_filter_stok").val();$.ajax({type:"POST",url:"/stok/filter/date",data:{_token:$('meta[name="csrf-token"]').attr("content"),start_date:e,end_date:a},success:function(o){$("tbody").html(o),$(".pagination").html(o.pagination)},error:function(o){if(o.status===422){let n=o.responseJSON.errors,i="";n.start_date&&(i+=n.start_date[0]+"<br>"),n.end_date&&(i+=n.end_date[0]+"<br>"),Swal.fire({icon:"warning",title:"Validasi tanggal gagal",confirmButtonText:"OK"})}}})});$(document).on("click","#export_stok_barang",function(t){t.preventDefault(),$("#stokBarangForm")[0].reset(),$("#import_stok_file")[0].reset(),$("#filter_date_stok")[0].reset(),$(".modal-title span").text("Export File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-download")});$(document).on("click","#import_stok",function(t){t.preventDefault(),$("#stokBarangForm")[0].reset(),$("#import_stok_file")[0].reset(),$("#filter_date_stok")[0].reset(),$(".modal-title span").text("Upload File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-download")});
