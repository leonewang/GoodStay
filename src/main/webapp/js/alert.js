$('.cd-button-group .btn-success').click(function() {
    var gin_num = $('.cd-gin-num').text();
    ginClick(gin_num);
});
//Details.html
//check availability
$('.cd-item-info #cd-bid-submit').click(function() {
    var check_in = $('#start_date').val();
    var check_out = $('#end_date').val();
    checkAvailability(check_in, check_out);
});
//Book
$('.cd-item-info #cd-gin-submit input').click(function() {
    var check_in = $('.cd-item-info #cd-bid input').val();
    var check_out = $('.cd-item-info #cd-gin input').val();
    bookNow(check_in, check_out);
});
//Stick to top
$('#stick').click(function() {
    stickToTop(this);
});

function stickToTop(node) {
    $.ajax({
        url: "StickServlet",
        type: "GET",
        dataType: "json",
        data: {
            post_id: $("#post_id").text()
        }
    })
        .done(function(data) {
            swal("Great!", "Stick this post to the top successfully! It seems other users are more likely to see this post.", "success");
            node.setAttribute("disabled","disabled");
        })
        .error(function(data) {
            swal("Try later...", "Sorry, you can only use stick to top once daily.", "error");
            node.setAttribute("disabled","disabled");
        });
};

// Add to watch list
$('#cd-add-watchlist').click(function() {
    addToWatchlist(this);
});

function addToWatchlist(node) {
    $.ajax({
        url: "WatchlistServlet",
        type: "GET",
        dataType: "json",
        data: {
            post_id: $("#post_id").text(),
            user_id: $("#user_id").text()
        }
    })
        .done(function(data) {
            swal("Great!", "You have put the post into your watch list and you can see it in your profile page later.", "success");
            var remove_num, add_num;
            var icon_heart = $('#cd-add-watchlist').find('.cd-item-icon'),
                watching_num = $('#cd-add-watchlist').parent().find('.watching-num');
            if(icon_heart.hasClass('watch')) {
                icon_heart.removeClass('watch');
                icon_heart.addClass('watching');
                //add ajax sentences here

                remove_num = parseInt(remove_num_separator(watching_num.html())) + 1;
                add_num = add_num_separator(remove_num);
                watching_num.html(add_num);
                $('#cd-add-watchlist').find('.cd-item-watch').html('Now watching!');
            }
        })
        .error(function(data) {
            swal("Naughty man!", "It is already in your watch list", "error");
            var remove_num, add_num;
            var icon_heart = $('#cd-add-watchlist').find('.cd-item-icon');
            if(icon_heart.hasClass('watch')) {
                icon_heart.removeClass('watch');
                icon_heart.addClass('watching');
                //add ajax sentences here
                $('#cd-add-watchlist').find('.cd-item-watch').html('Now watching!');
            }
        });
};

//check availability
function checkAvailability(check_in, check_out) {
    swal({
        title: "Time Available",
        text: "The place is available from <b>" + check_in + "</b> to <b>"  + check_out + ".</b>",
        html: true,
        type: "info",
        showCancelButton: false,
        closeOnConfirm: true,
        confirmButtonText: "Okay!",
        confirmButtonColor: "#2ECC71"
    });
};
//Book
function bookNow(check_in, check_out) {
    if(check_in == '' || check_out == '') {
        swal("Oops", "Tell us how long you would like to stay with us.", "error");
        return;
    }
    if(check_in > check_out) {
        swal("Oops", "Try an correct date period!", "error");
        return;
    }
    swal({
        title: "Are you sure?",
        text: "Are you sure that you want to book the place from <b>" + check_in + "</b> to <b>"  + check_out + "</b>?",
        html: true,
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: false,
        confirmButtonText: "Confirm",
        confirmButtonColor: "#2ECC71"
    }, function() {
        $.ajax({
            url: "BookServlet",
            type: "GET",
            dataType: "html",
            data: {
                post_id: $("#post_id").text(),
                user_id: $("#user_id").text(),
                start_date: $("#check-in").val(),
                end_date: $("#check-out").val()
            }
        })
            .done(function(data) {
                swal("Well Done!", "You book it successfully! You can see your booking in you profile page later.", "success");
            })
            .error(function(data) {
                swal("Please refresh the page", "Hold on, there was someone faster than you!", "error");
            });
    });
};

//remove separator from number
function remove_num_separator(num){
    var number = num.replace(/\,/g, '');
    return number;
};

//add separator to number
function add_num_separator(num){
    var number = '',
        num = num.toString();
    num = num_reverse(num);
    for(var i = 0, len = num.length; i < len; i++) {
        if(i != 0 && i % 3 == 0) {
            number += ',';
        }
        number += num[i];
    }
    number = num_reverse(number);
    return number;
};

//reverse string of number
function num_reverse(num){
    var result = '';
    for(var i = num.length; i > 0; i--) {
        result += num.charAt(i - 1);
    }
    return result;
};

//remove one post from the watchlist
function remove_watchlist(id, post_id) {
    swal({
        title: "Are you sure?",
        text: "Are you sure you want to remove the post from your watchlist?",
        html: true,
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: false,
        confirmButtonText: "Yes, I'm sure!",
        confirmButtonColor: "#2ECC71"
    }, function() {
        $.ajax({
            url: "RemoveWatchlistServlet",
            type: "GET",
            dataType: "html",
            data: {
                id: id,
                post_id: post_id
            }
        })
            .done(function(data) {
                swal("Removed", "New watchlist will present since refresh.", "success");
            })
            .error(function(data) {
                swal("Please refresh the page", "Sorry, something wrong!", "error");
            });
    });
}