$(document).on("click", "#add_item_list", function (e) {
    e.preventDefault();
    $("#barangmasuk")[0].reset('');
    $(".modal-title span").text("Tambah Barang Masuk");
    $(".modal-title i").removeClass("fas fa-edit").addClass("fas fa-plus-square");
    $("#action span").text("Simpan");
    $("#action i").removeClass("fas fa-edit").addClass("fas fa-save");
    $("#barangmasuk").attr("action", "/barang_masuk/store");
    $("input[name='_method']").remove();
});
$(document).on("click", "#act_keluar, #act_close", function(e) {
    e.preventDefault();
    if($("#barangmasuk").length){
        $("#barangmasuk")[0].reset('');
    }
    $("input[name='_method']").remove();
    $("#barangmasuk").attr('action', '#');

});
