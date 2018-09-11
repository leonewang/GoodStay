//market.html
$('.cd-button-group .btn-warning').click(function() {
    var bid_num = $('.cd-button-group input').val();
    var cd_bid_num = parseInt($('.cd-bid-num').text());
    bidClick(bid_num, cd_bid_num);
});
$('.cd-button-group .btn-success').click(function() {
    var gin_num = $('.cd-gin-num').text();
    ginClick(gin_num);
});
//stuffDetail.html
$('.cd-item-info #cd-bid-submit').click(function() {
    var bid_num = $('.cd-item-info #cd-bid input').val();
    var cd_bid_num = parseInt(remove_num_separator($('.cd-item-info .cd-item-bid').text()));
    bidClick(bid_num, cd_bid_num);
});
$('.cd-item-info #cd-gin-submit button').click(function() {
    var gin_num = $('.cd-item-info .cd-item-gin').text();
    ginClick(gin_num);
});
//alert for bid button
function bidClick(bidNum, cdBidNum) {
    if(!isNaN(bidNum)) {
        if(bidNum == '') {
            swal("Oops", "Maybe you should type something, like 20?", "error");
            return;
        } 
        if(bidNum <= cdBidNum) {
            swal("Oops", "Something wrong! Try type a higher bids than " + add_num_separator(cdBidNum) + ".", "error");
            return;
        }
        swal({
          title: "Are you sure?", 
          text: "Are you sure that you want to Bid it by <strong>" + add_num_separator(bidNum) + " bids</strong>", 
          html: true,
          type: "info",
          showCancelButton: true,
          closeOnConfirm: false,
          confirmButtonText: "Course, Bid it!",
          confirmButtonColor: "#2ECC71"
        }, function() {
          $.ajax({
            url: "",
            type: "BID"
          })
          .done(function(data) {
            swal("Well Done!", "You bid it successfully! ", "success");
          })
          .error(function(data) {
            swal("Please refresh the page", "Sorry, there was someone higher than you at this moment!", "error");
          });
        });
    } else {
        swal("Oops", "Maybe you should type a number?", "error");
    }
};
//alert for get it now button
function ginClick(ginNum) {
    swal({
      title: "Are you sure?", 
      text: "Are you sure that you want to Get It Now by <strong>" + ginNum + " bids</strong>", 
      html: true,
      type: "warning",
      showCancelButton: true,
      closeOnConfirm: false,
      confirmButtonText: "Yes, Get it!",
      confirmButtonColor: "#2ECC71"
    }, function() {
      $.ajax({
        url: "/test",
        type: "BID"
      })
      .done(function(data) {
        swal("Well Done!", "You get it successfully! ", "success");
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