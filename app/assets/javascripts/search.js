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


/* Placeholder on main search */
$( document ).ready(function () {
    $("#q").focus(function() {
        $(':input').removeAttr('placeholder');
    });
    $("#q").focusout(function() {
        $(':input').attr('placeholder',"search...");
    });
})


/*Main transition animate*/

$( document ).ready(function () {
    
    if($(".jumbotron").css("top") === "-1000px") {
    
    $(".jumbotron").animate({
        top: 50
    },1000)
    .animate({top:0},500);
    
    $("#search-ref").animate({
        left: 20
    },1000)
    .animate({left:0},500);    

    $("#search-vendor").animate({
        right:20
    },1000)
    .animate({right:0},500);
    }
});

