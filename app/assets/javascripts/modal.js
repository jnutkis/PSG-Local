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
    
    /*Outer Modal*/
    $(".outer-modal").css({
        height: height,
        width: width
    })
    
    /*Modal Box Note: top set under modalShow()*/
    if (width >= 480) {    
   $(".modal-box").css({
        height: height/2,
        width: width/2,
        left: width/4
    });
    } else {
   $(".modal-box").css({
        height: height,
        width: width,
        left: 0
    });        
    }
    
    return [height,width]
};

var modalShow = function() {
    var size = sizing();
    $(".modal-box").hide();
    $(".outer-modal").show();
    if (size[1]>= 480) {
    $(".modal-box").show().css({top:-200}).animate({top: size[0]/8} ,500);
    } else {
    $(".modal-box").show().css({top:-200}).animate({top: 0} ,500);    
    }
};

var modalClose = function(){
    $(".outer-modal").hide();
};




$(document).ready(function() {
    sizing();
});

$(window).resize(function() {
    sizing();
});

$(document).ready(function() {
    $(".modal-close").click(function() {
        modalClose();
    })
});