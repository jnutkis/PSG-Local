 $("#close_menu").click(function() {
        $("#sidebar-wrapper").css("width",0);
        $("#wrapper").css("paddingLeft",0);
        $("#open_menu").css({"z-index" : 2}).animate({opacity: 1},1000);
 });


 $("#open_menu").click(function() {
        $("#sidebar-wrapper").css("width",250);
        $("#wrapper").css("paddingLeft", 250);
        $("#open_menu").css("opacity","0");
 });