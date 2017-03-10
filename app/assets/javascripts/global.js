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
        
        if ((width)-(len) > 0) {
            $(".profile-wrapper-other h1").css("left",((width/2)-(len/2)));
        } else {
            $(".profile-wrapper-other h1").css("left",0); 
        }
    }
    
};


$(document).ready(function(){
    searchTile();
    profileTitleSize();
});

$(window).resize(function(){
    searchTile();
    profileTitleSize();
});