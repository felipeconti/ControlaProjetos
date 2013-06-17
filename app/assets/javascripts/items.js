$(function(){
    $('#btnFilterItem').click(function (e) {
        e.preventDefault();
        location.href = '/user_items?stateId='+$('#stateId').val();
    });
});
