$(function(){
    $('#btnFilterItem').click(function (e) {
        e.preventDefault();
        stateId = $('#stateId').val();
        if ( stateId != '' ) {
            location.href = '/user_items?stateId='+stateId;
        }else{
            location.href = '/user_items';
        }
    });
});