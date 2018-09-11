function timer(intDiff, selector){
    var day = 0,
        hour = 0,
        minute = 0,
        second = 0,
        diff = intDiff + 1;

    // print out the first time without 1000 ms delay
    if(intDiff > 0){
        day = Math.floor(diff / (60 * 60 * 24));
        hour = Math.floor(diff / (60 * 60)) - (day * 24);
        minute = Math.floor(diff / 60) - (day * 24 * 60) - (hour * 60);
        second = Math.floor(diff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
        if (minute <= 9) minute = '0' + minute;
        if (second <= 9) second = '0' + second;
    }
    $(selector).html(day+"d "+hour+"h "+minute+"m "+second+"s");

    var timer = window.setInterval(function(){
    if(intDiff >= 0){
        day = Math.floor(intDiff / (60 * 60 * 24));
        hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
        minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
        second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
        if (minute <= 9) minute = '0' + minute;
        if (second <= 9) second = '0' + second;
    }
    $(selector).html(day+"d "+hour+"h "+minute+"m "+second+"s");
    intDiff--;
    }, 1000);
}