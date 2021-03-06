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
//= require jquery.ui.all
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require_tree .

//http://eternicode.github.io/bootstrap-datepicker/
$(function(){
    $('.datepicker')
        .datepicker({
            language: 'pt-BR',
            format: 'yyyy-mm-dd',
            todayBtn: true,
            autoclose: true,
            todayHighlight: true
        });

    $('.open-modal-details').click(function(){
        var details = $(this).data('details');
        $("#modal-details #details").html(details);
    });
});

function getStateId() {
    var stateId = $('#stateId').val();
    if ( stateId == '' ) {
        setStateDefaultValue();
        stateId = $('#stateId').val();
    }
    return stateId;
}

function setStateDefaultValue() {
    $("#stateId").prop("selectedIndex", 0);
}