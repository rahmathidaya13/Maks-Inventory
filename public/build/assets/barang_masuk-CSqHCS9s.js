function l(e){let a,t,s,n,r;return n=new Date(e),a=String(n.getDate()).padStart(2,"0"),t=String(n.getMonth()+1).padStart(2,"0"),s=n.getFullYear(),r=a+"/"+t+"/"+s,r}$(document).on("click","#add_item_list",function(e){e.preventDefault(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$(".modal-title span").text("Tambah Barang Masuk"),$(".modal-title i").removeClass("fas fa-edit").addClass("fas fa-plus-square"),$("#aksi_brg_masuk span").text("Simpan"),$("#aksi_brg_masuk i").removeClass("fas fa-edit").addClass("fas fa-save"),$("#barangmasuk").attr("action","/barang_masuk/store"),$("input[name='_method']").remove()});$(document).on("click",".act_stok_close ,#act_stok_close,#act_close,#act_keluar",function(e){e.preventDefault(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#nama_barang").trigger("change"),$("#tipe_barang_masuk").trigger("change"),$("input[name='_method']").remove(),$("#barangmasuk").attr("action","#"),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$("#preview").attr("src","assets/icon/iconupload.jpg"),$("#file-name").text("File not found"),$("#update_form_stok").length>0&&$("#update_form_stok")[0].reset(),$("#update_form_stok").attr("action","#")});$(document).on("change","#nama_barang",function(e){e.preventDefault();let t=$(this).find(":selected").data("id");$("#id_barang").val(t)});$("#jumlah_brg").on("input",function(){this.value=this.value.replace(/[^0-9]/g,"")});$(document).on("click","#add_item",function(e){e.preventDefault(),$("#form_item")[0].reset(),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#filter_date").length>0&&$("#filter_date")[0].reset(),$(".modal-title span").text("Tambah Barang"),$(".modal-title i").removeClass("fas fa-edit").addClass("fas fa-box"),$("#aksi_brg_masuk span").text("Simpan"),$("#aksi_brg_masuk i").removeClass("fas fa-edit").addClass("fas fa-save"),$("#form_item").attr("action","/list-item/store"),$("input[name='_method']").remove()});$(document).on("click",".ubah_barang_masuk",function(e){e.preventDefault();let a=$(this).data("id");$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$(".modal-title span").text("Ubah Data Barang Masuk"),$(".modal-title i").removeClass("fas fa-plus-square").addClass("fas fa-edit"),$("#aksi_brg_masuk span").text("Ubah"),$("#aksi_brg_masuk i").removeClass("fas fa-save").addClass("fas fa-edit"),$("#barangmasuk").prepend('<input type="hidden" name="_method" value="PUT">'),$("#barangmasuk").attr("action","/barang_masuk/update/"+a),$.getJSON("/barang_masuk/detail/"+a,function(t,s,n){$("#id_barang").val(t.result.id_barang),$("#tgl_brg_masuk").val(t.result.tgl_brg_masuk),$("#no_warehouse").val(t.result.no_warehouse),$("#nama_barang").val(t.result.nama_barang).trigger("change"),$("#tipe_barang_masuk").val(t.result.tipe_barang).trigger("change"),$("#asal_gdg").val(t.result.asal_gudang),$("#jumlah_brg").val(t.result.jumlah_barang),$("#posisi_brg_masuk").val(t.result.posisi).trigger("change"),$("#status").val(t.result.status),$("#konsumen").val(t.result.nama_konsumen).val()!=="-"?$("#konsumen").prop("readonly",!1):$("#konsumen").prop("readonly",!0)})});$(document).on("click","#selectAllItem",function(){$(".selected_").prop("checked",$(this).prop("checked"))});$(document).on("change",".selected_,#selectAllItem",function(){$(".selected_:checked").length>0?$("#delete_all_brg_masuk").prop("disabled",!1):$("#delete_all_brg_masuk").prop("disabled",!0)});$(document).on("click","#delete_all_brg_masuk",function(e){e.preventDefault();let a=$(".selected_:checked"),t=$('meta[name="csrf-token"]').attr("content");Swal.fire({title:"Apakah Anda yakin?",text:`${a.length} Item yang dipilih akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(s=>{if(s.isConfirmed)if(a.length>0){let n=a.map(function(){return $(this).data("id")}).get();$.ajax({url:"/delete/barang_masuk",type:"DELETE",data:{ids:n,_token:t},success:function(r){Swal.fire({position:"center",icon:"success",title:`${n.length} Item berhasil dihapus.`,showConfirmButton:!1,timer:1500}).then(()=>{location.reload()})},error:function(r){Swal.fire({icon:"error",title:"Terjadi kesalahan",text:"Saat menghapus item."})}})}else alert("Silakan pilih item yang ingin dihapus.")})});$(document).on("click",".hapus_brg_masuk",function(){let e=$(this).data("id"),a=$(this).data("date"),t=$(this).data("name-type"),s=$("#delete_items_"+e);Swal.fire({title:"Apakah kamu yakin?",text:`Barang tanggal ${l(a)} ${t} ini akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(n=>{n.isConfirmed&&s.submit()})});$(document).on("change","#status",function(e){e.preventDefault(),$(this).val()=="customer"?$("#konsumen").prop("readonly",!1).val(""):$("#konsumen").prop("readonly",!0).val("-")});$(document).on("keyup","#keyword_brg_masuk",function(e){e.preventDefault();let a=$(this).val();a===""?$("tbody").load(`/barang_masuk/search?query=${encodeURIComponent(a)}`,function(){window.history.pushState({},"","/barang_masuk")}):$("tbody").load("/barang_masuk/search?query="+encodeURIComponent(a),function(){$("tbody .nama_brg_masuk, .tipe_brg_masuk").each(function(){let t=$(this).text();if(a){let s=new RegExp("("+a+")","gi"),n=t.replace(s,'<span class="highlight">$1</span>');$(this).html(n)}else $(this).html(t)})})});$(document).on("change","#filter_brg_masuk",function(){let e=$(this).val();$("tbody").load("/barang_masuk/filter?limit="+e,function(a){$(this).html(a.table),$(".pagination").html(a.pagination)})});$(document).on("change","#import_brg_masuk",function(e){let a=e.target.files[0];if(a){let t=new FileReader;t.onload=function(s){$("#preview").attr("src","assets/icon/excel.png")},t.readAsDataURL(a)}$("#file-name").text(a.name)});$(document).on("click","#export_barang_masuk",function(e){e.preventDefault(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$("#filter_date").length>0&&$("#filter_date")[0].reset(),$(".modal-title span").text("Export Barang Masuk"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-file-export")});$(document).on("click","#set_brg_masuk",function(e){e.preventDefault();let a=$("#start_date_brg_masuk").val(),t=$("#end_date_brg_masuk").val();$.ajax({type:"POST",url:"/barang_masuk/filter/date",data:{_token:$('meta[name="csrf-token"]').attr("content"),start_date:a,end_date:t},success:function(s){$("tbody").html(s),$(".pagination").html(s.pagination)},error:function(s){if(s.status===422){let n=s.responseJSON.errors,r="";n.start_date&&(r+=n.start_date[0]+"<br>"),n.end_date&&(r+=n.end_date[0]+"<br>"),Swal.fire({icon:"warning",title:"Validasi tanggal gagal",confirmButtonText:"OK"})}}})});$(document).on("click","#import_item_list",function(e){e.preventDefault(),$("#barangmasuk").length>0&&$("#barangmasuk")[0].reset(),$("#brg_masuk").length>0&&$("#brg_masuk")[0].reset(),$("#filter_date").length>0&&$("#filter_date")[0].reset(),$(".modal-title span").text("Upload File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-file-upload")});
