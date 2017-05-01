var weaponTypes = {
    A_PASSIVE: "a_passive",
    B_PASSIVE: "b_passive",
    C_PASSIVE: "c_passive",
    WEAPON: "weapon",
    ASSIST: "assist",
    SPECIAL: "special"
}

$(function(){
    $("#hero_select").val(gon.hero.id);
    $("#hero_select").selectize({
        onChange: function(value) {
            window.location.href= "/heroes/" + value;
        }
    });
    
    selectDefaults();
    
    $("#a_passive_select").on("change", function(){
        selectSkill($(this).val(), weaponTypes.A_PASSIVE);
    });
    
    $("#b_passive_select").on("change", function(){
        selectSkill($(this).val(), weaponTypes.B_PASSIVE);
    });
    
    $("#c_passive_select").on("change", function(){
        selectSkill($(this).val(), weaponTypes.C_PASSIVE);
    });
    
    $("#weapon_select").on("change", function(){
        selectSkill($(this).val(), weaponTypes.WEAPON);
    });
    
    $("#assist_select").on("change", function(){
        selectSkill($(this).val(), weaponTypes.ASSIST);
    });
    
    $("#special_select").on("change", function(){
        selectSkill($(this).val(), weaponTypes.SPECIAL);
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

function selectSkill(id, skillType) {
    $("#" + skillType + "_heroes").empty();
    var description = "";
    var sp_cost = "SP Cost: ";
    var mt = null;
    var rng = null;
    var cooldown = null;
    
    switch (skillType) {
        case weaponTypes.A_PASSIVE:
            description = gon.a_passives[id].description;
            sp_cost += gon.a_passives[id].sp_cost;
            break;
        case weaponTypes.B_PASSIVE:
            description = gon.b_passives[id].description;
            sp_cost += gon.b_passives[id].sp_cost;
            break;
        case weaponTypes.C_PASSIVE:
            description = gon.c_passives[id].description;
            sp_cost += gon.c_passives[id].sp_cost;
            break;
        case weaponTypes.SPECIAL:
            description = gon.specials[id].description;
            sp_cost += gon.specials[id].sp_cost;
            cooldown = "Cooldown: " + gon.specials[id].cooldown;
            break;
        case weaponTypes.WEAPON:
            description = gon.weapons[id].description;
            sp_cost += gon.weapons[id].sp_cost;
            mt = "Might: " + gon.weapons[id].might;
            rng = "Range: " + gon.weapons[id].range;
            break;
        case weaponTypes.ASSIST:
            description = gon.assists[id].description;
            sp_cost += gon.assists[id].sp_cost;
            break;
    }
    
    $("#" + skillType).text(description);
    $("#" + skillType + "_sp").text(sp_cost);
    
    if (skillType === weaponTypes.WEAPON) {
        $("#weapon_might").text(mt);
        $("#weapon_range").text(rng);
    } else if (skillType === weaponTypes.SPECIAL) {
        $("#special_cooldown").text(cooldown);
    }
    
    var heroIDs = Object.keys(gon.skill_heroes[id]);

    if ($.inArray("" + gon.hero.id, heroIDs) === -1) {
        heroIDs.forEach(function(heroID, idx){
            var heroStars = "<div class='hero-stars'>";
            var levelLearned = gon.skill_heroes[id][heroID];
            if (levelLearned > 1) {
                for (var i = 0; i < levelLearned; i++) {
                    heroStars += "<img src='/images/20px-Icon_Rarity_" + levelLearned + ".png'/>"
                }
            }
            heroStars += "</div>";
            
            $("#" + skillType + "_heroes").append("<div class='hero-icon-container'><img src='/images/hero_icons/75px-Icon_Portrait_" + gon.heroes[heroID].name.replace(/\s/g, "_") + ".png'/>" + heroStars + "</div>");
        });
    }
}