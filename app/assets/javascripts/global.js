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

var refCount 
var aPage = 0
var bPage = 25;


var pageNext = function(a,b){
    var next = $(".ref-form #ref-next");
    var back = $(".ref-form #ref-back");
    
     if (a < (refCount-50)) { /*if a param is more than 25 of the count*/
        aPage += 25;
        bPage += 25;
        back.show();
        return referencePagination(aPage,bPage);
     } else {
        aPage += 25;
        bPage += 25;
        next.hide();
        return referencePagination(aPage,bPage);
     }
};

var pageBack = function(a,b){
    var next = $(".ref-form #ref-next");
    var back = $(".ref-form #ref-back");
    
     if (b > 50) { /*if a param is more than 25 of the count*/
        aPage -= 25;
        bPage -= 25;
        next.show();
        return referencePagination(aPage,bPage);
     } else {
        aPage = 0;
        bPage -= 25;
        back.hide();
        return referencePagination(aPage,bPage);
     }
};

var pageAll = function(){
    var next = $(".ref-form #ref-next");
    var back = $(".ref-form #ref-back");
    
    referencePagination(0,refCount);
    next.hide();
    back.hide();
    $(".ref-form #ref-all").hide();
}


var referencePagination = function (a,b) {
 
 if (a == null) {
     a = 0;
 }
 
 if (b == null) {
     b = 25;
 }
  
 div = $(".ref-form .checkbox");
 count = $(".ref-form .checkbox").length;
 refCount = count;
 
 div.hide();
 div.slice(a,b).show();
  

 console.log([a,b])
 
};


var refPageMargin = function () {
    if ($("#ref-back").css("display") != "none") {
        $("#ref-back").css({"margin-right": "10px"});
        $("#ref-next").css({"margin-left": "10px", "margin-right": "10px"});
        $("#ref-all").css({"margin-left": "10px"});
    } else {
        $("#ref-next").css({"margin-left": 0,"margin-right": "10px"});
        $("#ref-all").css({"margin-left": "10px"});
    }
};

var refPageSize = function() {
    var a = $(".antibg").width();
    var b = $("#ref-paginiation div");
    if (a <= 265) {
        b.css({"width":"37.5px","font-size":"8px","height":"20px","line-height":"20px"})
    } else {
        b.css({"width":"75px","font-size":"14px","height":"40px","line-height":"40px"})
    }
};



$(document).ready(function(){
    searchTile();
    profileTitleSize();
    referencePagination();
    refPageMargin();
    refPageSize();
    
    $(".ref-form #ref-next").click(function(){
        pageNext(aPage,bPage);
    });
    
    $(".ref-form #ref-back").click(function(){
        pageBack(aPage,bPage);
    });
    
    $(".ref-form #ref-all").click(function(){
        pageAll();
    })
    
});

$(window).resize(function(){
    searchTile();
    profileTitleSize();
    refPageSize();
});

$(window).click(function(){
   refPageMargin(); 
});