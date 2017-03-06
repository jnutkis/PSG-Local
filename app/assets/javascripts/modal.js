var sizing = function(){
    var height,width;
    
    height = $(window).height();
    width = $(window).width();
    
    
    /*Outer Modal*/
    $(".outer-modal").css({
        height: height,
        width: width
    })
    
    /*Modal Box Note: top set under modalShow() so I could animate*/
    if (width >= 480) {    
   $(".modal-box").css({
        height: height/2,
        width: width/2,
        left: width/4
    });
    } else {
    /*let modal box span all width */
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
    $(".modal-box").show().css({top:-200}).animate({top: 200} ,500);
    } else {
    $(".modal-box").show().css({top:-200}).animate({top: 0} ,500);    
    }
};

var modalClose = function(){
    $(".outer-modal").hide();
    /*$(".outer-modal").click(function() {
        $(this).hide()
    });*/
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