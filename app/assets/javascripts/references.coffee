# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



`$( document ).ready(function () {
    $('#reference-table-results').DataTable({
    aLengthMenu: [
        [10,25, 50, 100, -1],
        [10,25, 50, 100, "All"]],
        "searching": false
    
    });
});`