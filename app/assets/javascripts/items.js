$(function(){
    $('#btnFilterItem').click(function (e) {
        e.preventDefault();
        var stateId = $('#stateId').val();
        if ( stateId != '' ) {
            location.href = '/user_items?stateId='+stateId;
        }else{
            alert('selecione uma situação');
        }
    });
});