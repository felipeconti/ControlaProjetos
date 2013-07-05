$(function(){
    setStateDefaultValue();

    $('#btnFilterMeetingItem').click(function (e) {
        e.preventDefault();
        $(".page-grid").load('/user_meeting_items_result?stateId='+getStateId());
    });
});
