$(function () {
    $('header').attr('class', 'p-3 border-bottom bg-white');
});

$(function(){
    var options = {
        animateClass: 'animate__animated',
        animateThreshold: 100,
        scrollPollInterval: 20
    }
    $('.aniview').AniView(options);
});