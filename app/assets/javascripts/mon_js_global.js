$(function() {

    // Pour Morphtext
    $("#js-rotating").Morphext({
        animation: "bounceIn", // Overrides default "bounceIn"
        speed: 3000, // Overrides default 2000
        complete: function () {
            // Overrides default empty function
        }
    });


    $('.navLi').on('click', function(event) {
        $(".navLi").removeClass('active');
        $(this).addClass('active');
    });

});
