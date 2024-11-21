function l(e){return new Intl.NumberFormat("id-ID",{style:"currency",currency:"IDR",minimumFractionDigits:0}).format(e).replace(/Rp\s/g,"")}function u(e){let t,a,n,s,i;return s=new Date(e),t=String(s.getDate()).padStart(2,"0"),a=String(s.getMonth()+1).padStart(2,"0"),n=s.getFullYear(),i=t+"/"+a+"/"+n,i}function r(e){return e?parseInt(e.replace(/\./g,"")):0}$(document).on("click","#add_transaksi",function(e){e.preventDefault(),$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$(".modal-title span").text("Buat Transaksi"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-money-bill-wave"),$(".modal-title i").addClass("fas fa-plus-square"),$("#transaksi_aksi span").text("Simpan"),$("#transaksi_aksi i").removeClass("fas fa-edit"),$("#transaksi_aksi i").removeClass("fas fa-money-bill-wave"),$("#transaksi_aksi i").addClass("fas fa-save"),$("#form_transaksi").attr("action","/transaksi/store"),$("input[name='_method']").remove(),$("#transaksi").prop("readonly",!1),$(".nama_brg_transaksi,.status_pembayaran").css("pointerEvents","all")});$(document).on("click",".ubah_transaksi",function(e){e.preventDefault();let t=$(this).data("id");$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$(".modal-title span").text("Ubah Data Transaksi"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-money-bill-wave"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-edit"),$("#transaksi_aksi span").text("Ubah"),$("#transaksi_aksi i").removeClass("fas fa-edit"),$("#transaksi_aksi i").removeClass("fas fa-money-bill-wave"),$("#transaksi_aksi i").removeClass("fas fa-save"),$("#transaksi_aksi i").addClass("fas fa-edit"),$("#form_transaksi").attr("action",`/transaksi/update/${t}`),$("#form_transaksi").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/transaksi/detail/${t}`,function(a,n,s){console.log(a),$("#id_barang").val(a.result.id_barang),$("#id_stok").val(a.result.id_stok),$("#transaksi").val(a.result.tgl_transaksi).prop("readonly",!0),$("#kode_transaksi").val(a.result.kode_transaksi),$("#nama_konsumen").val(a.result.nama_konsumen),$("#nohp").val(a.result.no_handphone),$("#alamat").val(a.result.alamat),$("#sales").val(a.result.nama_sales).trigger("change"),$("#nama_brg_transaksi").val(a.result.nama_barang).trigger("change"),$(".nama_brg_transaksi,.status_pembayaran").css({pointerEvents:"none"}),$("#tipe_brg_transaksi").val(a.result.tipe_barang),$("#harga_brg_transaksi").val(l(a.result.harga_barang)),$("#jumlah_brg_transaksi").val(a.result.jumlah_barang).prop("readonly",!(a.result.jumlah_barang>0)),$("#status_pembayaran").val(a.result.status_pembayaran).trigger("change"),$("#status_transaksi").val(a.result.status_transaksi).trigger("change"),$("#diskon").val(parseInt(a.result.diskon)).prop("readonly",!(a.result.diskon>0)),$("#dp").val(l(a.result.dana_pertama)),$("#pembayaran").val(l(a.result.pembayaran)).prop("readonly",!(a.result.pembayaran>0)),$("#total_pembayaran").val(l(a.result.total_pembayaran)),$("#selisih").val(l(a.result.selisih_pembayaran))})});$(document).on("click",".hapus_transaksi",function(){let e=$(this).data("id"),t=$(this).data("customer"),a=$(this).data("code"),n=u($(this).data("date")),s=$("#delete_transaksi_"+e);Swal.fire({title:"Apakah kamu yakin?",text:`Data transaksi ( ${n} - ${a} - ${t} ) akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(i=>{i.isConfirmed&&s.submit()})});$(document).on("click","#act_close_pelunasan, #keluar_pelunasan, #act_close_keluar,#keluar_transaksi",function(e){e.preventDefault(),$("#form_transaksi")[0].reset(),$("#pelunasan")[0].reset(),$("#pelunasan").attr("action","#"),$("#form_transaksi").attr("action","#"),$("input[name='_method']").remove()});$(document).on("click","#select_all_transaksi",function(){$(".selected").prop("checked",$(this).prop("checked"))});$(document).on("click","#delete_all_transaksi",function(e){e.preventDefault();let t=$(".selected:checked"),a=$('meta[name="csrf-token"]').attr("content");Swal.fire({title:"Apakah Anda yakin?",text:`${t.length} Item yang dipilih akan dihapus!`,icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Ya, hapus!",cancelButtonText:"Batal"}).then(n=>{if(n.isConfirmed)if(t.length>0){let s=t.map(function(){return $(this).data("id")}).get();$.ajax({url:"/delete/transaksi",type:"DELETE",data:{ids:s,_token:a},success:function(i){Swal.fire({position:"center",icon:"success",title:`${s.length} Item berhasil dihapus.`,showConfirmButton:!1,timer:1500}).then(()=>{location.reload()})},error:function(i){Swal.fire({icon:"error",title:"Terjadi kesalahan",text:"Saat menghapus item."})}})}else alert("Silakan pilih item yang ingin dihapus.")})});$(document).on("change",".selected,#select_all_transaksi",function(){$(".selected:checked").length>0?$("#delete_all_transaksi").prop("disabled",!1):$("#delete_all_transaksi").prop("disabled",!0)});$(document).on("change","#nama_brg_transaksi",function(){let e=$(this).find("option:selected");e.val(),$("input[name='tipe_brg_transaksi']").val(e.data("type")??"-"),$("input[name='harga_brg_transaksi']").val(l(e.data("price")??0)),$("input[name='id_barang']").val(e.data("id")),$("input[name='stok']").val(e.data("stok")),$("input[name='id_stok']").val(e.data("id-stok"))});$(document).on("change","#status_pembayaran",function(){$(this).find("option:selected").val()!=="lunas"?($("#dp").prop("readonly",!1),$("#dp").val(0),$(document).on("input","#pembayaran",function(a){a.preventDefault();let n=r($(this).val()),s=r($("#total_pembayaran").val());s=isNaN(s)?0:s,$("#selisih").val(l(s-n))})):($("#dp").prop("readonly",!0),$("#dp").val(0))});$("#jumlah_brg_transaksi,#stok,#diskon,#harga_diskon,#dp").on("input",function(){this.value=this.value.replace(/[^0-9]/g,"")});$(document).on("input","#pembayaran",function(){let e=r($(this).val());r($("#total_pembayaran").val()),e=isNaN(e)?0:e,$(this).val(l(e))});$(document).on("input","#diskon",function(){let e=r($(this).val()),t=r($("#hasil").val()),a=r($("#dp").val()),n=t-t*(e/100);$("#total_pembayaran").val(l(n));let s=n-a;s=isNaN(s)?0:s,$("#selisih").val(l(s)),console.log(n)});$(document).on("input","#jumlah_brg_transaksi",function(){let e=parseInt($(this).val()),t=r($("#harga_brg_transaksi").val()),a=e*t;a=isNaN(a)?0:a,$("#hasil").val(l(a)),$("#total_pembayaran").val(l(a))});$(document).on("input","#dp",function(){let e=$(this).val(),t=r(e),n=r($("#total_pembayaran").val())-t;t===0?n=isNaN(n)?n:0:n=isNaN(n)?0:n,$(this).val(l(t)),$("#selisih").val(l(n))});$(document).on("click",".pelunasan",function(){let e=$(this).data("id");$("#form_transaksi")[0].reset(),$(".modal-title span").text("Pelunasan"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-money-bill-wave"),$("#aksi_pelunasan span").text("Lunasi"),$("#aksi_pelunasan i").removeClass("fas fa-edit"),$("#aksi_pelunasan i").removeClass("fas fa-save"),$("#aksi_pelunasan i").addClass("fas fa-money-bill-wave"),$("#pelunasan").attr("action",`/transaksi/repayment/${e}`),$("#pelunasan").prepend('<input type="hidden" name="_method" value="PUT">'),$.getJSON(`/transaksi/detail/${e}`,function(t,a,n){$(document).on("input","#pembayaran_pelunasan",function(){let s=r($(this).val()),i=r($("#r_selisih").val());if(s===0)$("#selisih_pembayaran_").val(l(i));else{let o=i-s;o<0&&(o=0),$("#selisih_pembayaran_").val(l(o))}$(this).val(l(s))}),$("#konsumen").val(t.result.nama_konsumen).prop("readonly",!0),$("#hp").val(t.result.no_handphone).prop("readonly",!0),$("#alamat_konsumen").val(t.result.alamat).prop("readonly",!0),$("#dana_pertama").val(l(t.result.dana_pertama)).prop("readonly",!0),$("#hb").val(l(t.result.harga_barang)).prop("readonly",!0),$("#selisih_pembayaran_").val(l(t.result.selisih_pembayaran)).prop("readonly",!0),$("#r_selisih").val(l(t.result.selisih_pembayaran)).prop("readonly",!0)})});$(document).on("change","#filter_transaksi",function(e){e.preventDefault();let t=$(this).val();$("tbody").load("/transaksi/filter?offset="+t,function(a){$(this).html(a.table),$(".pagination").html(a.pagination)})});$(document).on("keyup","#keyword_transaksi",function(e){e.preventDefault();let t=$(this).val();t===""?$("tbody").load(`/transaksi/search?query=${encodeURIComponent(t)}`,function(){window.history.pushState({},"","/transaksi")}):$("tbody").load("/transaksi/search?query="+encodeURIComponent(t),function(){$("tbody .nama_sales,.kode_transaksi, .nama_konsumen,.nama_barang_transaksi,.tipe_barang_transaksi").each(function(){let a=$(this).text();if(t){let n=new RegExp("("+t+")","gi"),s=a.replace(n,'<span class="highlight">$1</span>');$(this).html(s)}else $(this).html(a)})})});$(document).on("click","#export_transaksi",function(e){e.preventDefault(),$("#form_transaksi")[0].reset(),$("#import_transaksi_file")[0].reset(),$("#filter_date_transaksi")[0].reset(),$(".modal-title span").text("Export File"),$(".modal-title i").removeClass("fas fa-edit"),$(".modal-title i").removeClass("fas fa-plus-square"),$(".modal-title i").addClass("fas fa-file-upload")});$(document).on("click","#set_filter_transaksi",function(e){e.preventDefault();let t=$("#start_date_filter_transaksi").val(),a=$("#end_date_filter_transaksi").val();$.ajax({type:"POST",url:"/transaksi/filter/date",data:{_token:$('meta[name="csrf-token"]').attr("content"),start_date:t,end_date:a},success:function(n){$("tbody").html(n),$(".pagination").html(n.pagination)},error:function(n){if(n.status===422){let s=n.responseJSON.errors,i="";s.start_date&&(i+=s.start_date[0]+"<br>"),s.end_date&&(i+=s.end_date[0]+"<br>"),Swal.fire({icon:"warning",title:"Validasi tanggal gagal",confirmButtonText:"OK"})}}})});$(document).on("change","#import_transaksi_form",function(e){let t=e.target.files[0];if(t){let a=new FileReader;a.onload=function(n){$("#preview").attr("src","assets/icon/excel.png")},a.readAsDataURL(t)}$("#file-name").text(t.name)});
