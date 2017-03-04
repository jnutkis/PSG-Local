var vendorSizing = function() {
     var width = $(".vendor-list").width();
     if (width) {
         var $list = $(".vendor-list-item");
         if (width > 912) {
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

$(document).ready(function(){
    vendorSizing();
})

$(window).resize(function(){
    vendorSizing();
})