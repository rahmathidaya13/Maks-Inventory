$(document).on("click", ".password", function () {
    let password = $("#password").prop("type");
    if (password === "password") {
        $("#password").prop("type", "text");
        $(this).removeClass("fas fa-eye").addClass("fas fa-eye-slash");
    } else {
        $("#password").prop("type", "password");
        $(this).removeClass("fas fa-eye-slash").addClass("fas fa-eye");
    }
});
$(document).on("click", ".password_cp", function () {
    let password_cp = $("#pass_cp").prop("type");
    if (password_cp === "password") {
        $("#pass_cp").prop("type", "text");
    } else {
        $("#pass_cp").prop("type", "password");
    }
});
