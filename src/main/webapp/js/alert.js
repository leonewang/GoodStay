$('.cd-button-group .btn-success').click(function() {
    var gin_num = $('.cd-gin-num').text();
    ginClick(gin_num);
});
//Details.html
//check availability
$('.cd-item-info #cd-bid-submit').click(function() {
    var check_in = $('.cd-item-info #cd-bid input').val();
    var check_out = $('.cd-item-info #cd-gin input').val();
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
        url: "",
        type: "stick"
    })
    .done(function(data) {
        swal("Great!", "Stick this post to the top successfully! It seems other users are more likely to see this post.", "success");
        node.setAttribute("disabled","disabled");
    })
    .error(function(data) {
        swal("Please refresh the page", "Sorry, something wrong!", "error");
    });
};
//check availability
function checkAvailability(check_in, check_out) {
    if(check_in == '' || check_out == '') {
        swal("Oops", "Tell us how long you would like to stay with us.", "error");
        return;
    }
    if(check_in > check_out) {
        swal("Oops", "Naughty, Naughty! Try an correct date period!", "error");
        return;
    }
    swal({
      title: "Checking availability",
      text: "Check if the place is available from <b>" + check_in + "</b> to <b>"  + check_out + "</b>",
      html: true,
      type: "info",
      showCancelButton: true,
      closeOnConfirm: false,
      confirmButtonText: "Check it!",
      confirmButtonColor: "#2ECC71"
    }, function() {
      $.ajax({
        url: "/available",
        type: "availability"
      })
      .done(function(data) {
        swal("Available dates", "someone booked the date already! Please change your schedule.", "success");
      })
      .error(function(data) {
        swal("Please refresh the page", "Sorry, there was someone higher than you at this moment!", "error");
      });
    });
};
//Book
function bookNow(check_in, check_out) {
    swal({
      title: "Are you sure?", 
      text: "Are you sure that you want to book the place from <b>" + check_in + "</b> to <b>"  + check_out + "</b>?",
      html: true,
      type: "warning",
      showCancelButton: true,
      closeOnConfirm: false,
      confirmButtonText: "Yes, Get it!",
      confirmButtonColor: "#2ECC71"
    }, function() {
      $.ajax({
        url: "/book",
        type: "BID"
      })
      .done(function(data) {
        swal("Well Done!", "You book it successfully! ", "success");
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