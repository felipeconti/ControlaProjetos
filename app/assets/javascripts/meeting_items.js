$(function(){
    $('#btnFilterMeetingItem').click(function (e) {
        e.preventDefault();
        var stateId = $('#stateId').val();
        if ( stateId != '' ) {
            $(".page-grid").load('/user_meeting_items_result?stateId='+stateId);
        }else{
            alert('selecione uma situação');
        }
    });
});
