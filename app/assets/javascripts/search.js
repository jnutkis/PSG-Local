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