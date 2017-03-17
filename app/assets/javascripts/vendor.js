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
        $(this).css({opacity:1, fontWeight: "bold",textDecoration: "underline"});
    })
};

var vendorHoverOff = function() {
    $(".vendor-list-item").mouseleave(function(e){
        $(".vendor-list-item").css({opacity:1, fontWeight: "",textDecoration: ""});     
    })
};

$(document).ready(function(){
    vendorSizing();
    vendorHover();
    vendorHoverOff();
})

$(window).resize(function(){
    vendorSizing();
})