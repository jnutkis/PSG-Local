$( document ).ready(function () {
  if ($('#reference-table-results_wrapper').length == 1) { 
    $('#reference-table-results_wrapper').remove();
    location.reload(true);
}});



$( document ).ready(function () {
    $('#reference-table-results').DataTable({
    aLengthMenu: [
        [20,50, 100, -1],
        [20,50, 100, "All"]],
        "searching": false,
        "pagingType": "simple_numbers"
    
    });
});


$( document ).ready(function () {
    $("#table-container").click(function(){
        $("tbody tr").dblclick(function(){
            var ref = $(this).children().find('a').attr('href');
            window.location.href = ref;
        });
    });
});

var refTip = function() {
  $(".ref-form .checkbox label").mouseenter(function(){
      var ref = $(this).text().split(" ")[1].replace(".","");
      $("#ref-"+ref).show();
  });
  
  $(".ref-form .checkbox label").mouseleave(function(){
      var ref = $(this).text().split(" ")[1].replace(".","");
      $("#ref-"+ref).hide();
      });
};

var refResize = function() {
    var x = $(window).scrollTop();
    $("#refs-preview-container").css("top",x);
}


$(document).ready(function(){
    refTip();
})

$(window).scroll(function(){
    refResize();
})


/*$( document ).ready(function () {
    $("#reference-table-results > tbody  tr").mouseover(function() {
        $(this).css("background-color","lightgrey");
    });
    $("#reference-table-results > tbody  tr").mouseout(function() {
        $(this).css("background-color","initial");
    });   
});*/