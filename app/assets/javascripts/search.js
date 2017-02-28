$( document ).ready(function () {
  if ($('#table-search-result_wrapper').length == 1) { 
    $('#table-search-result_wrapper').remove();
    location.reload(true);
}});


$( document ).ready(function () {
    $('#table-search-result').DataTable({
    aLengthMenu: [
        [20,50, 100, -1],
        [20,50, 100, "All"]],
        "searching": false,
        "pagingType": "full_numbers"
    
    });
});

$( document ).ready(function () {
    $("#search-container").click(function(){
        $("tbody tr").dblclick(function(){
            var ref = $(this).children().find('a').attr('href');
            window.location.href = ref;
        });
    });
});
