$(function(){
    $("#hero_select").selectize({
        onChange: function(value) {
            window.location.href= "/heroes/" + value;
        }
    });
});