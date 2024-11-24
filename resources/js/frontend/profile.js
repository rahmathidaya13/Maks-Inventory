$(document).on("click", "#profile-action", function () {
    let id = $(this).data("id");
    $.getJSON(`/profile/show/${id}`, function (data) {
        $("#name-user").val(data.result.name);
        $("#email-user").val(data.result.email).prop("readOnly", true);
        $(".modal-profile").attr(
            "src",
            data.result.photo
                ? "assets/profile/" + data.result.photo
                : "assets/icon/user.svg"
        );
    });
});

$(document).on("change", "#photo-user", function (e) {
    let file = e.target.files[0];
    if (file) {
        let reader = new FileReader();
        reader.onload = function (data) {
            $(".modal-profile").attr("src", data.target.result);
        };
        reader.readAsDataURL(file);
    }
});
