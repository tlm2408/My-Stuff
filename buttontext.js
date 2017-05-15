function ButtonText() {
    if ($("#playlist").is(":visible")) {
        $("#mybutton").text("Play Mode");
    } else {
        $("#mybutton").text("Playlist Mode");
    }
}

ButtonText();
$("#mybutton").click(function () {
    $("#playlist, #leftbox, #playoff").toggle();
    $("#rightbox, #leftbox, #playon").toggle();
    ButtonText();
});