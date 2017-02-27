$( document ).ready(function () {
    $('#reference-table-results').DataTable({
    aLengthMenu: [
        [15,50, 100, -1],
        [15,50, 100, "All"]],
        "searching": false,
        "pagingType": "full_numbers"
    
    });
});