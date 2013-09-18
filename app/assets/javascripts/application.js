// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-1.8.3
//= require bootstrap


$(window).ready(function(){
	TERMINAL_Init();
});

function TERMINAL_Init(){

    // if ($('.user_name_field').lenght > 0 ){
    //     var locale = window.location.search.slice(-2);
    // }
    var locale = window.location.search.slice(-2);

	var audio = document.getElementsByTagName("audio")[0];

    if (locale == "en"){
        var tooltip_title = 'Min. 2 characters\nMax. 8 characters';
    } else {
        var tooltip_title = 'Min. 2 znakou\nMax. 8 znakou';
    }

    $('.name_tooltip').tooltip({ 'trigger':'click',
                                'title': tooltip_title,
                                'placement': 'bottom'});
    console.log(tooltip_title);

	$('a.disabled').on("click", function (e) {
        e.preventDefault();
    });

    $('button.play').on("click", function (e){
    	audio.play();
    	$(this).hide();
    	$('button.pause').show();
    });

    $('button.pause').on("click", function (e){
    	audio.pause();
    	$(this).hide();
    	$('button.play').show();
    });


}