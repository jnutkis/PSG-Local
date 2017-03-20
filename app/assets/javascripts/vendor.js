var vendorSizing = function() {
     var width = $(".vendor-list").width();
     if (width) {
         var $list = $(".vendor-list-item");
         if (width > 1300) {
             $list.css({
                 width: (width-16)/4
             })
         } else if (width > 912) {
             $list.css({
                 width: (width-12)/3
             })
         } else if (width > 480) {
             $list.css({
                 width: (width-8)/2
             })             
         } else {
             $list.css({
                 width: (width-4)
             })              
         }
     }
}


var vendorHover = function() {
    $(".vendor-list-item").mouseenter(function(e){
        $(".vendor-list-item").css("opacity",.5); 
        $(this).css({opacity:1, fontWeight: "bold"});
    })
};

var vendorHoverOff = function() {
    $(".vendor-list-item").mouseleave(function(e){
        $(".vendor-list-item").css({opacity:1, fontWeight: ""});     
    })
};



var vendorBorder = function() {
    var a,b,c,d;
    a = 1;
    b = 2;
    a.toString();
    b.toString();
    c = $("#vendor-product-"+a);
    d = $("#vendor-product-"+b);
    if ($(window).width() >= 992) {
        do {
            c.css("height","");
            d.css("height","");
            if (c.height() >= d.height()) {
                if (b%4 != 0) {
                c.css("borderRight","2px solid #ddd")    
                } else {
                c.css("borderRight","2px solid #fff")
                }
            } else {
                c.css("height",d.outerHeight());
                if (b%4 != 0) {
                c.css("borderRight","2px solid #ddd")    
                } else {
                c.css("borderRight","2px solid #fff")
                }
            }
            
            a+=2;
            b+=2;
            c = $("#vendor-product-"+a);
            d = $("#vendor-product-"+b);
        } while (c.length > 0);
    } else {
        do {
            c.css({borderRight:"",height:""})
            a+=2;
            b+=2;
            c = $("#vendor-product-"+a);
            d = $("#vendor-product-"+b);
        } while (c.length > 0)
    }
};

$(document).ready(function(){
    vendorSizing();
    vendorHover();
    vendorHoverOff();
    vendorBorder();
})

$(window).resize(function(){
    vendorSizing();
    vendorBorder();
})