var searchTile = function() {
    width = $(window).width();
    
    if (width < 480) {
        $(".search-tile").css({
            fontSize: width/30
        });      
    } else {
        $(".search-tile").css({
            fontSize: 20
        });
    }
}


var profileTitleSize = function() {
    if ($(".profile-wrapper-other h1").html() ==  null) {
        var width = $(".profile-wrapper form").outerWidth();
        $(".profile-wrapper h1").css("left",((width/2)-75));
    } else {
        var width = $(".profile-wrapper-other form").outerWidth();
        
        var len =  $(".profile-wrapper-other h1").clone().appendTo("body").addClass("profileWidth").css("float","left").hide().width();
        $(".profileWidth").remove();
        
        if ((width)-(len) > 0) {
            $(".profile-wrapper-other h1").css("left",((width/2)-(len/2)));
        } else {
            $(".profile-wrapper-other h1").css("left",0); 
        }
    }
    
};


/*var referenceToggle = function() {
    $("input#product_reference_ids").next().click(function(){
        $(this).find("label").siblings().slideToggle();
    });
    $("input#product_reference_ids").next().trigger("click");
};*/


var referencePagination = function (a,b) {
  var div,a,b;
  
 a = (typeof a !== 'undefined') ?  a : 0
 b = (typeof b !== 'undefined') ?  b : 24
  
 div = $(".ref-form .checkbox");

 div.hide();
 div.slice(a,b).show();
  
 return [a,b];  

};





$(document).ready(function(){
    searchTile();
    profileTitleSize();
    referencePagination();
});

$(window).resize(function(){
    searchTile();
    profileTitleSize();
});