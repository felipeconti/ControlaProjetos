$(function(){
    $('#btnFilterItem').click(function (e) {
        e.preventDefault();
        var stateId = $('#stateId').val();
        if ( stateId != '' ) {
            //location.href = '/user_items?stateId='+stateId;
            $(".page-grid").load('/user_items_result?stateId='+stateId);
        }else{
            alert('selecione uma situação');
        }
    });
});