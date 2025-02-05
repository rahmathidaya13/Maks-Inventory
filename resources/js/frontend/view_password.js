export default function view_password(){
    $(document).ready(function () {
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
            $("#pass_cp").prop("type") === "password"
                ? ($("#pass_cp").prop("type", "text"),
                  $(this).removeClass("fas fa-eye").addClass("fas fa-eye-slash"))
                : ($("#pass_cp").prop("type", "password"),
                  $(this).removeClass("fas fa-eye-slash").addClass("fas fa-eye"));
        });

    });
}
