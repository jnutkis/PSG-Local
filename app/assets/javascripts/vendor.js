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
    if ($(window).width() >= 992) {
        var a,b,c,d;
        a = 1;
        b = 2;
        a.toString();
        b.toString();
        c = $("#vendor-product-"+a);
        d = $("#vendor-product-"+b);
        do {
            if (c.height() >= d.height()) {
                d.css("height",c.outerHeight());
                if (b%4 === 0) {
                d.css("borderLeft","1px solid #ddd")    
                } else {
                d.css("borderLeft","1px solid #fff")
                }
            } else {
                if (b%4 === 0) {
                d.css("borderLeft","1px solid #ddd")    
                } else {
                d.css("borderLeft","1px solid #fff")
                }
            }
            
            a+=2;
            b+=2;
            c = $("#vendor-product-"+a);
            d = $("#vendor-product-"+b);
            console.log(c);
            console.log(d);
        } while (c.length > 0);
    }
};

$(document).ready(function(){
    vendorSizing();
    vendorHover();
    vendorHoverOff();
})

$(window).resize(function(){
    vendorSizing();
})