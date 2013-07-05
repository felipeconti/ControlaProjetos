$(function(){
    setStateDefaultValue();

    $('#btnFilterItem').click(function (e) {
        e.preventDefault();
        $(".page-grid").load('/user_items_result?stateId='+getStateId());
    });
});