$(function(){
    $("#hero_select").selectize({
        onItemAdd: function(value) {
            window.location.href= "/heroes/" + value;
        },
        sortField: [
            {
                field: 'name',
                direction: 'asc'
            },
            {
                field: '$score'
            }
        ]
    });
});