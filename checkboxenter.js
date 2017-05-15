$(document).ready(function () {
    $('input:checkbox').on('keypress', function (event) {
        if (event.which === 13) {
            $(this).prop('checked', !$(this).prop('checked'));
$(this).change();
        }
    });
});