$('a.playalpha').click(function (e) {
    e.preventDefault();
    var letter = $(this).attr('href');
    //scroll to first h1.name element that begins with "letter"
    var target = $('.play').filter(function () {
        return $.trim($(this).text()).toLowerCase().indexOf(letter) == 0
    });
    $('html,body,div').animate({scrollTop: $(target).offset().top}, 1500);
});