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
    var width = $(".profile-wrapper form").outerWidth();
    $(".profile-wrapper h1").css("left",((width/2)-75));
};


$(document).ready(function(){
    searchTile();
    profileTitleSize();
});

$(window).resize(function(){
    searchTile();
    profileTitleSize();
});