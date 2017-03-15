 $("#close_menu").click(function() {
        $("#sidebar-wrapper").css("width",0);
        $("#open_menu").css({"z-index" : 2}).animate({opacity: 1},1000);
        
        if ($(window).width() > 767) {
         $("#wrapper").css("paddingLeft",40);
        } else {
         $("#wrapper").css("paddingLeft",0);
        }
 });


 $("#open_menu").click(function() {
        $("#sidebar-wrapper").css("width",250);
        $("#wrapper").css("paddingLeft", 250);
        $("#open_menu").css("opacity","0");
 });
 
 $(".sidebar-brand").click(function() {
  modalShow();
 })
 
  $(".login-small a").click(function() {
  modalShow();
 })