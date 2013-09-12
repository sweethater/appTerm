//= require jquery
//= require jquery_ujs
//= require jquery-1.8.3
//= require bootstrap

$(window).ready(function(){
	TERMINAL_ADMIN_Init();
});

function TERMINAL_ADMIN_Init(){

	var numItem = $('.answer:visible').length;
	var nextItem = numItem + 1


	$('button.add_answer.disabled').on("click", function (e) {
        e.preventDefault();
    });


    $('button.add_answer').on("click", function (e) {
    	console.log(numItem);
    	console.log(nextItem);

    	$('.answer'+nextItem).removeClass('hide');


    	if (nextItem == 2) {
    		$(function () {
			    $('#myTab li:eq(1) a').tab('show');
			})
    	}

    	if (nextItem > 2) {
    		$(function () {
			    $('#myTab a:last').tab('show');
			})
    	}

    	nextItem = nextItem + 1;

    	if (nextItem == 6) {
			$('button.add_answer').addClass('disabled');
		}



    });


}