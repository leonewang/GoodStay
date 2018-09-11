jQuery(function(){
    var jq=jQuery;
    jq('#btn-top-group').hide();
        jq(window).scroll(function () {
            if (jq(window).scrollTop() > 100) {
                //button fide in in 0.4s
                jq('#btn-top-group').fadeIn(400);
            } else {
                //button fide out
                jq('#btn-top-group').fadeOut(400);
            }
        });
    jq('#btn-top-group').click(function () {
        //back to top in 0.2s
        jq('html,body').animate({scrollTop : '0px'}, 1000);
    });
});