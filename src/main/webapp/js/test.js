jQuery(document).ready(function($){
    //final width --> this is the quick view image slider width
    //maxQuickWidth --> this is the max-width of the quick-view panel
    var sliderFinalWidth = 400,
    maxQuickWidth = 900;
    var firstImage,firstImageUrl,timer,intDiff;
    //open the quick view panel
    $('.cd-trigger').on('click', function(){
        //reset the bid input
        $('.cd-quick-view .input-group input').val('');

        //set a timer for cd-quick-view
        intDiff = parseInt($(this).siblings('.gs-timer').html());
        timer = window.setInterval(function(){
            var day=0,
            hour=0,
            minute=0,
            second=0;

            if(intDiff >= 0){
                day = Math.floor(intDiff / (60 * 60 * 24));
                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;
            }
            $('.cd-quick-view .cd-days').html(day+"d "+hour+"h "+minute+"m "+second+"s");
            intDiff--;
        }, 1000);

        //change the content of cd-item-info
        var contentTitle = $(this).siblings('.tile-title').html(),
        limitNum = $(this).siblings('p').attr("limit"),
        contentDetail = '',
        bidNum = $(this).siblings('.gs-bid-num').html(),
        ginNum = $(this).siblings('.gs-gin-num').html(),
        read_more = $('.cd-item-info .cd-more').attr('href', $(this).siblings('.btn-gin').attr('href'));

        //if detail's length is longer than limit num,use the detail string in 'tltle'
        if($(this).siblings('p').text().length <= limitNum) {
            contentDetail = $(this).siblings('p').html();
        } else {
            contentDetail = $(this).siblings('p').attr('title');
        }

        $('.cd-quick-view .cd-item-info h3').html(contentTitle);
        $('.cd-quick-view .cd-item-info p').html(contentDetail);
        $('.cd-quick-view .cd-bid-num').html(bidNum);
        $('.cd-quick-view .input-group input').attr('placeholder',bidNum+"+");

        //if gin-num not exist,hide the label of GIN
        if(ginNum) {
            $('.cd-quick-view .cd-gin').removeClass('hidden')
            $('.cd-quick-view .cd-gin-num').html(ginNum);
        } else {
            $('.cd-quick-view .cd-gin').addClass('hidden')
            $('.cd-quick-view .cd-gin-num').html('');
        }

        //click the trigger to change images in quick view panel
        var firstImageUrl = $(this).parent('.tile').children('.tile-image').attr('src');
        var viewFirstImage = $('.cd-quick-view .cd-slider').find('.selected');
        var laterImages = $(this).parent('.tile').children('.cd-tile-image');
        var i = 0;

        viewFirstImage.find('.cd-img').css('background-image', 'url(' + firstImageUrl + ')');

        laterImages.each(function(){ 
        //laterImages.length
        //insert the length of images into cd-slider
        $(".cd-slider").append("<li><div class='cd-img'></li>");
            //alert(laterImages[i]);
            i++;
        });







        var i = 0,
            //second image and later...
            laterImages = $(this).parent('.tile').children('.cd-tile-image'),
            viewFirstImage = $('.cd-quick-view .cd-slider').find('.selected'),
            viewImages = $('.cd-quick-view .cd-slider .cd-view-image');
            
            //first image in tile
            firstImage = $(this).parent('.tile').children('.tile-image');
            firstImageUrl = firstImage.attr('src');

        //change first image for quick-view
        viewFirstImage.find('.cd-img').children().attr('src',firstImageUrl);        
        laterImages.each(function(){ 
        //laterImages.length
        //insert the length of images into cd-slider
        $(".cd-slider").append("<li><div class='cd-img'><img src='"+ laterImages[i] + "' class='cd-view-image'></div></li>");
            //alert(laterImages[i]);
            i++;
        });


        //cd-quick-view
        var selectedImage = $(this).parent('.tile').children('.tile-image'),
        slectedImageUrl = selectedImage.attr('src');

        $('body').addClass('overlay-layer');
        animateQuickView(selectedImage, sliderFinalWidth, maxQuickWidth, 'open');

        //update the visible slider image in the quick view panel
        //you don't need to implement/use the updateQuickView if retrieving the quick view data with ajax
        updateQuickView(slectedImageUrl);
    });

    //close the quick view panel
    $('body').on('click', function(event){
        if( $(event.target).is('.cd-close')) {
            //clear interval of timer
            clearInterval(timer);
            closeQuickView( sliderFinalWidth, maxQuickWidth);
        }
        if( $(event.target).is('body.overlay-layer')) {
            clearInterval(timer);
            closeQuickView( sliderFinalWidth, maxQuickWidth);
        }

    });
    $(document).keyup(function(event){
        //check if user has pressed 'Esc'
        if(event.which=='27'){
            closeQuickView( sliderFinalWidth, maxQuickWidth);
        }
    });

    //quick view slider implementation
    $('.cd-slider-navigation a').on('click', function(){
        updateSlider($(this));
    });

    //center quick-view on window resize
    $(window).on('resize', function(){
        if($('.cd-quick-view').hasClass('is-visible')){
            window.requestAnimationFrame(resizeQuickView);
        }
    });

    function updateSlider(navigation) {
        var sliderConatiner = navigation.parents('.cd-slider-wrapper').find('.cd-slider'),
        activeSlider = sliderConatiner.children('.selected').removeClass('selected');
        if ( navigation.hasClass('cd-next') ) {
            ( !activeSlider.is(':last-child') ) ? activeSlider.next().addClass('selected') : sliderConatiner.children('li').eq(0).addClass('selected'); 
        } else {
            ( !activeSlider.is(':first-child') ) ? activeSlider.prev().addClass('selected') : sliderConatiner.children('li').last().addClass('selected');
        } 
    }

    function updateQuickView(url) {
        $('.cd-quick-view .cd-slider li').removeClass('selected').find('.cd-img img[src="'+ url +'"]').parent('.cd-img').parent('li').addClass('selected');
    }

    function resizeQuickView() {
        var quickViewLeft = ($(window).width() - $('.cd-quick-view').width())/2,
        quickViewTop = ($(window).height() - $('.cd-quick-view').height())/2;
        $('.cd-quick-view').css({
            "top": quickViewTop,
            "left": quickViewLeft
        });
    } 

    function closeQuickView(finalWidth, maxQuickWidth) {
        //restore the image if user change the slider image
        $('.cd-quick-view .cd-slider li:first-child').addClass("selected");
        $('.cd-quick-view .cd-slider:first-child .cd-img').find("img").attr("src",firstImageUrl);
        $(".cd-slider .cd-view-image").parent().parent().remove();

        var close = $('.cd-close'),
        activeSliderUrl = close.siblings('.cd-slider-wrapper').find('.selected img').attr('src'),
        selectedImage = $('.empty-box').find('.tile-image');
        //update the image in the gallery
        selectedImage.attr('src', firstImageUrl);
        animateQuickView(selectedImage, finalWidth, maxQuickWidth, 'close');
    }

    function animateQuickView(image, finalWidth, maxQuickWidth, animationType) {
        //store some image data (width, top position, ...)
        //store window data to calculate quick view panel position
        var parentListItem = image.parent('.tile'),
        topSelected = image.offset().top - $(window).scrollTop(),
        leftSelected = image.offset().left,
            // widthSelected = image.width(),
            widthSelected = "89",
            heightSelected = image.height(),
            windowWidth = $(window).width(),
            windowHeight = $(window).height(),
            finalLeft = (windowWidth - finalWidth)/2,
            finalHeight = finalWidth * heightSelected/widthSelected,
            finalTop = (windowHeight - finalHeight)/2,
            quickViewWidth = ( windowWidth * 1 < maxQuickWidth ) ? windowWidth * 1 : maxQuickWidth ,
            quickViewLeft = (windowWidth - quickViewWidth)/2;

            // alert("imageHeight: " + heightSelected + " imageWidth: " + widthSelected);

            if( animationType == 'open') {
            //hide the image in the gallery
            parentListItem.addClass('empty-box');
            //place the quick view over the image gallery and give it the dimension of the gallery image
            $('.cd-quick-view').css({
                "top": topSelected,
                "left": leftSelected,
                "width": widthSelected
            }).velocity({
                //animate the quick view: animate its width and center it in the viewport
                //during this animation, only the slider image is visible
                'top': finalTop+ 'px',
                'left': finalLeft+'px',
                'width': finalWidth+'px',
            }, 1000, [ 400, 20 ], function(){
                //animate the quick view: animate its width to the final value
                $('.cd-quick-view').addClass('animate-width').velocity({
                    'left': quickViewLeft+'px',
                    'width': quickViewWidth+'px',
                }, 300, 'ease' ,function(){
                    //show quick view content
                    $('.cd-quick-view').addClass('add-content');
                    $('.cd-quick-view .input-group input').focus();
                });
            }).addClass('is-visible');              
        } else {
            //close the quick view reverting the animation
            $('.cd-quick-view').removeClass('add-content').velocity({
                'top': finalTop+ 'px',
                'left': finalLeft+'px',
                'width': finalWidth+'px',
            }, 300, 'ease', function(){
                $('body').removeClass('overlay-layer');
                $('.cd-quick-view').removeClass('animate-width').velocity({
                    "top": topSelected,
                    "left": leftSelected,
                    "width": widthSelected,
                }, 500, 'ease', function(){
                    $('.cd-quick-view').removeClass('is-visible');
                    parentListItem.removeClass('empty-box');
                });
            });
        }

    }
});

//limit the content length and store left days
jQuery.fn.limit=function(){ 
    var detail = $("p[limit]");
    detail.each(function(){ 
        var objString = $(this).text(); 
        var objLength = $(this).text().length; 
        var num = $(this).attr("limit"); 
        if(objLength > num){ 
            //stroe the detail string in 'title'
            $(this).attr("title",objString); 
            objString = $(this).text(objString.substring(0,num) + "..."); 
        }

        var diff = parseInt($(this).siblings('.gs-timer').text());
        var day = Math.floor(diff / (60 * 60 * 24));
        if(diff) {
            $(this).siblings('.gs-days').html(day + ' days')
        }
    })
}
$(function(){ 
    $(document.body).limit();
});


