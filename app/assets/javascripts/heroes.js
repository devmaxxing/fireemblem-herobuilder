$(function(){
    $("#hero_select").val(gon.hero.id);
    $("#hero_select").selectize({
        onChange: function(value) {
            window.location.href= "/heroes/" + value;
        }
    });
    
    selectDefaults();
    
    $("#a_passive_select").on("change", function(){
        selectSkill($(this).val(), "a_passive");
    });
    
    $("#b_passive_select").on("change", function(){
        selectSkill($(this).val(), "b_passive");
    });
    
    $("#c_passive_select").on("change", function(){
        selectSkill($(this).val(), "c_passive");
    });
    
    $("#weapon_select").on("change", function(){
        selectSkill($(this).val(), "weapon");
    });
    
    $("#assist_select").on("change", function(){
        selectSkill($(this).val(), "assist");
    });
    
    $("#special_select").on("change", function(){
        selectSkill($(this).val(), "special");
    });
});

function selectDefaults() {
    Object.keys(gon.default_skills).forEach(function(key){
        if (gon.default_skills[key] != null) {
            var skillID = gon.default_skills[key].id;
            $("#" + key + "_select").val(skillID);
            selectSkill(skillID, key);
        }
    });  
}

function selectSkill(id, skill_type) {
    $("#" + skill_type + "_heroes").empty();
    var description = "";
    switch (skill_type) {
        case "a_passive":
            description = gon.a_passives[id].description;
            break;
        case "b_passive":
            description = gon.b_passives[id].description;
            break;
        case "c_passive":
            description = gon.c_passives[id].description;
            break;
        case "special":
            description = gon.specials[id].description;
            break;
        case "weapon":
            description = gon.weapons[id].description;
            break;
        case "assist":
            description = gon.assists[id].description;
            break;
    }
    
    $("#" + skill_type).text(description);
    
    var hero_ids = Object.keys(gon.skill_heroes[id]);

    if ($.inArray("" + gon.hero.id, hero_ids) === -1) {
        hero_ids.forEach(function(hero_id, idx){
            $("#" + skill_type + "_heroes").append("<div><img src='/images/hero_icons/75px-Icon_Portrait_" + gon.heroes[hero_id].name + ".png'/>" + "</div>");
        });
    }
}