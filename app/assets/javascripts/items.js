$(function(){
    $('#btnFilterItem').click(function (e) {
        e.preventDefault();
        var stateId = $('#stateId').val();
        if ( stateId == '' ) {
          $("#stateId").prop("selectedIndex", 1);
          stateId = $('#stateId').val();
        }
        $(".page-grid").load('/user_items_result?stateId='+stateId);
    });
});