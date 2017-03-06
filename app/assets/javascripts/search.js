/*Check if data table already there, if so, delete */
$( document ).ready(function () {
  if ($('#table-search-result_wrapper').length == 1) { 
    $('#table-search-result_wrapper').remove();
    location.reload(true);
}});

/* Set entry groupings on data table */
$( document ).ready(function () {
    $('#table-search-result').DataTable({
    aLengthMenu: [
        [20,50, 100, -1],
        [20,50, 100, "All"]],
        "searching": false,
        "pagingType": "full_numbers"
    
    });
});


/* Allow double click on data table */
$( document ).ready(function () {
    $("#search-container").click(function(){
        $("tbody tr").dblclick(function(){
            var ref = $(this).children().find('a').attr('href');
            window.location.href = ref;
        });
    });
});


/* Placeholder on main search 
$( document ).ready(function () {
    $("#q").focus(function() {
        $('#q:input').removeAttr('placeholder');
    });
    $("#q").focusout(function() {
        $('#q:input').attr('placeholder',"search...");
    });
})*/


/*Main transition animate*/

$( document ).ready(function () {
    
    if($(".jumbotron").css("top") === "-1000px") {
    
    $(".jumbotron").animate({
        top: 50
    },1000)
    .animate({top:0},500);
    
    $("#search-ref").animate({
        left: 0
    },1500)  

    $("#search-vendor").animate({
        right:0
    },1500)
}});


/*Main Search Submit */
var submitSearch = function(){
    box = $("#search");
    

    
    $(".jumbotron").animate({
        top: -1000
    },1000)
    
    $("#search-ref").animate({
        left: -1000
    },1000)  

    $("#search-vendor").animate({
        right: -1000
    },1000)
    
    
    
    setTimeout(function(){
        box.submit()
    },500);
};

var enterSearch = function() {
    $("#search").keydown(function(event){
        var code = event.which;
        if (code === 13) {
            event.preventDefault();
            submitSearch();
        }
    })
}

var searchHover = function() {
    $("#nav-search").mouseenter(function(){
        $("#nav-glyph").removeClass("nav-active").addClass("nav-inactive");
        $("#nav-search-wrap").removeClass("nav-inactive").addClass("nav-active");
        a();
    });
    
    $("#nav-search").mouseleave(function(){
        if ($("#nav-search-wrap #q").val() === "") {
        $("#nav-glyph").toggleClass("nav-inactive nav-active");
        $("#nav-search-wrap").toggleClass("nav-inactive nav-active");
        a();
    }}); 
    
    $("#nav-search-wrap input").focus(function(){
        $(this).css({background: "#fff", color: "#444242"});
    });
    
    $("#nav-search-wrap input").focusout(function(){
        $(this).css({background: "#444242", color: "#fff"});
        if ($("#nav-search-wrap #q").val() === "") {
        $("#nav-glyph").removeClass("nav-inactive").addClass("nav-active");
        $("#nav-search-wrap").removeClass("nav-active").addClass("nav-inactive");
   }});
    
    var a = function() {
        if ($("#nav-search-wrap").hasClass("nav-active")) {
            $("#nav-search").css("width","100%");
        } else {
            $("#nav-search").css("width","30%")
    }};
};

$(document).ready(function(){
    enterSearch();
    searchHover();
})