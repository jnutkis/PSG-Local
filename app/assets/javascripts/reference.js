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
    var a,b;
    a = $(".antibg").width();
    b = $(window).width();
    if (a >= 600 && b >= 976) {
        $(".ref-form .checkbox label").mouseenter(function(){
            $("#refs-preview-container").show();
            var ref = $(this).text().split(" ")[1].replace(/\./g,"");
            $("#ref-"+ref).show();
        });
        
        $(".ref-form .checkbox label").mouseleave(function(){
            $("#refs-preview-container").hide();
            var ref = $(this).text().split(" ")[1].replace(/\./g,"");
            $("#ref-"+ref).hide();
          });
    } else {
        $(".ref-form .checkbox label").mouseenter(function(){
            $("#refs-preview-container").hide();
        });
    }
    
    return [a,b]
};

var refResize = function() {
    var a,b;
    a = $(".antibg").width();
    b = $(window).width()
    if (a >= 600 && b >= 976) {
        var x = $(window).scrollTop();
        $("#refs-preview-container").css("top",x);
    }
}


$(document).ready(function(){
    refTip();
    refResize();
})

$(window).resize(function(){
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