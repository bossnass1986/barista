// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular

$("tr[data-href]").on('click',function ()  {
    $(this).css('cursor', 'pointer');
    window.location = $(this).data("href")
});
$("tr[data-href]").hover(function() {
    $(this).css('cursor','pointer');
}, function() {
    $(this).css('cursor','auto');
});

$('.mdl-switch__input').click(function() {
    if ($(this).prop("checked"))
    {
        $(this).closest('.mdl-cell--4-col').fadeTo(500, 1);
        $(this).closest('.mdl-cell--4-col').find('input').prop("disabled", false);
    }
    else {
        $(this).closest('.mdl-cell--4-col').fadeTo(500, 0.2);
        $(this).closest('.mdl-cell--4-col').find('input').prop("disabled", true);
    }
    $(".mdl-switch__input").prop("disabled", false);
});

if($('#text_field').val() ==  "")
    $('#submitButtonId').attr('disabled', true);

$('#text_field').keyup(function(){
    if($('#text_field').val() !=  "")
        $('#submitButtonId').attr('disabled', false);
    else
        $('#submitButtonId').attr('disabled', true);
});