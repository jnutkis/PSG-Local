var sizing = function(){
    var height,width;
    
    if ($("html").height() > $("#page-content-wrapper").outerHeight() + $(".footer").outerHeight()) {
        height = $("html").height();
    } else if ($("#page-content-wrapper").outerHeight() + $(".footer").outerHeight() >= $("#sidebar-wrapper").outerHeight())  {
        height = $("#page-content-wrapper").outerHeight() + $(".footer").outerHeight();
    } else {
        height = $("#sidebar-wrapper").outerHeight();
    }
    
    if ($("html").width() > 0) {
        width = $("html").width();
    } else {
        width = $("#page-content-wrapper").outerWidth() + $(".footer").outerWidth;
    }
    

    $(".outer-modal").css({
        height: height,
        width: width
    })
   $(".modal-box").css({
        height: height/2,
        width: width/2,
        top: height/4,
        left: width/4
    })
    
    return [height,width]
};

var modalShow = function() {
    var size = sizing();
    $(".modal-box").hide();
    $(".outer-modal").show();
    $(".modal-box").show().css({top:-200}).animate({top: size[0]/4} ,500);
};

var modalClose = function(){
    $(".outer-modal").hide();
};


var modal = function(){
    $(".outer-modal").hide();
    sizing();
};


$(document).ready(function() {
    modal();
});

$(window).resize(function() {
    sizing();
});

$(document).ready(function() {
    $(".modal-close").click(function() {
        modalClose();
    })
});