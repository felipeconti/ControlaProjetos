$(function(){
    $('#btnFilterMeetingItem').click(function (e) {
        e.preventDefault();
        location.href = '/user_meeting_items?stateId='+$('#stateId').val();;
    });
});
