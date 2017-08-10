var heroIV = {
    bane: "",
    boon: "",
    merge: 0
}

var statBonuses = {
    weapon: 0,
    attack: 0,
    defense: 0,
    health: 0,
    resistance: 0,
    speed: 0
}

var skillTypes = {
    A_PASSIVE: "a_passive",
    B_PASSIVE: "b_passive",
    C_PASSIVE: "c_passive",
    WEAPON: "weapon",
    ASSIST: "assist",
    SPECIAL: "special"
}

var uninheritable = {
    "Alfonse": true, 
    "Anna": true, 
    "Sharena": true
};

$(function(){
    $("#hero_select").val(gon.hero.id);
    $("#hero_select").selectize({
        onItemAdd: function(value) {
            window.location.href= "/heroes/" + value;
        }
    });
    
    selectDefaults();
    
    $("#a_passive_select").on("change", function(){
        selectSkill($(this).val(), skillTypes.A_PASSIVE);
    });
    
    $("#b_passive_select").on("change", function(){
        selectSkill($(this).val(), skillTypes.B_PASSIVE);
    });
    
    $("#c_passive_select").on("change", function(){
        selectSkill($(this).val(), skillTypes.C_PASSIVE);
    });
    
    $("#weapon_select").on("change", function(){
        selectSkill($(this).val(), skillTypes.WEAPON);
    });
    
    $("#assist_select").on("change", function(){
        selectSkill($(this).val(), skillTypes.ASSIST);
    });
    
    $("#special_select").on("change", function(){
        selectSkill($(this).val(), skillTypes.SPECIAL);
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

function setAPassiveModifiers(attack, defense, health, resistance, speed) {
    statBonuses.attack = attack;
    statBonuses.defense = defense;
    statBonuses.health = health;
    statBonuses.resistance = resistance;
    statBonuses.speed = speed;
    updateStats();
}

function updateStats() {
    var newStats = {
        ATK: gon.hero.max_attack + statBonuses.attack + statBonuses.weaponMight,
        DEF: gon.hero.max_defense + statBonuses.defense,
        HP: gon.hero.max_health + statBonuses.health,
        RES: gon.hero.max_resistance + statBonuses.resistance,
        SPD: gon.hero.max_speed + statBonuses.speed
    }
    
    if (heroIV.bane)
        newStats[heroIV.bane] -= 3;
    if (heroIV.boon)
        newStats[heroIV.boon] += 3;

    if (heroIV.merge > 0) {
        var statPriorities = {HP: 4, ATK: 3, SPD: 2, DEF: 1, RES: 0};
        // higher number means higher priority
        
        var baseStats = [{stat: "HP", val: gon.hero.base_health}, 
                        {stat: "ATK", val: gon.hero.base_attack}, 
                        {stat: "DEF", val: gon.hero.base_defense}, 
                        {stat: "SPD", val: gon.hero.base_speed}, 
                        {stat: "RES", val: gon.hero.base_resistance}];
                        
        baseStats.sort(function(statA, statB) {
            if (statA.val == statB.val) {
                return statPriorities[statB.stat] - statPriorities[statA.stat];
            }
            return statB.val - statA.val;
        });
    
        switch (heroIV.merge) {
            case 1: newStats[baseStats[0].stat]++;
                    newStats[baseStats[1].stat]++;
            case 2: newStats[baseStats[2].stat]++;
                    newStats[baseStats[3].stat]++;
            case 3: newStats[baseStats[4].stat]++;
                    newStats[baseStats[0].stat]++;
            case 4: newStats[baseStats[1].stat]++;
                    newStats[baseStats[2].stat]++;
            case 5: newStats[baseStats[3].stat]++;
                    newStats[baseStats[4].stat]++;
            case 6: newStats[baseStats[0].stat]++;
                    newStats[baseStats[1].stat]++;
            case 7: newStats[baseStats[2].stat]++;
                    newStats[baseStats[3].stat]++;
            case 8: newStats[baseStats[4].stat]++;
                    newStats[baseStats[0].stat]++;
            case 9: newStats[baseStats[1].stat]++;
                    newStats[baseStats[2].stat]++;
            case 10: newStats[baseStats[3].stat]++;
                    newStats[baseStats[4].stat]++;
            default: break;
        }
    }
    
    $("#stat_attack").val(newStats.ATK);
    $("#stat_defense").val(newStats.DEF);
    $("#stat_health").val(newStats.HP);
    $("#stat_resistance").val(newStats.RES);
    $("#stat_speed").val(newStats.SPD);
    $("#stat_total").val(newStats.ATK + newStats.DEF + newStats.HP + newStats.RES + newStats.SPD);
}

function selectSkill(id, skillType) {
    if (id) {
        $("#" + skillType + "_heroes").empty();
        var description = "";
        var sp_cost = null;
        var mt = null;
        var rng = null;
        var cooldown = null;
        
        switch (skillType) {
            case skillTypes.A_PASSIVE:
                setAPassiveModifiers(gon.a_passives[id].effect_attack,
                                     gon.a_passives[id].effect_defense,
                                     gon.a_passives[id].effect_health,
                                     gon.a_passives[id].effect_resistance,
                                     gon.a_passives[id].effect_speed);
                description = gon.a_passives[id].description;
                sp_cost = gon.a_passives[id].sp_cost;
                break;
            case skillTypes.B_PASSIVE:
                description = gon.b_passives[id].description;
                sp_cost = gon.b_passives[id].sp_cost;
                break;
            case skillTypes.C_PASSIVE:
                description = gon.c_passives[id].description;
                sp_cost = gon.c_passives[id].sp_cost;
                break;
            case skillTypes.SPECIAL:
                description = gon.specials[id].description;
                sp_cost = gon.specials[id].sp_cost;
                cooldown = "<b>Cooldown</b>: " + gon.specials[id].cooldown;
                break;
            case skillTypes.WEAPON:
                description = gon.weapons[id].description;
                sp_cost = gon.weapons[id].sp_cost;
                statBonuses.weaponMight = gon.weapons[id].might;
                updateStats();
                mt = "<b>Might</b>: " + gon.weapons[id].might;
                rng = "<b>Range</b>: " + gon.weapons[id].range;
                break;
            case skillTypes.ASSIST:
                description = gon.assists[id].description;
                sp_cost = gon.assists[id].sp_cost;
                break;
        }
            
        var heroIDs = Object.keys(gon.skill_heroes[id]);
    
        if ($.inArray("" + gon.hero.id, heroIDs) != -1) {
            heroIDs = [gon.hero.id];
        } else {
            // remove uninheritable characters
            var heroID;
            var currentIndex = 0;
            while (heroID = heroIDs[currentIndex]) {
                var heroName = gon.heroes[heroID].name;
                if (heroName in uninheritable) {
                    heroIDs.splice(currentIndex, 1);
                } else {
                    currentIndex += 1;
                }
            }
            
            // SP Cost is increased by 50% for skill inheritance
            sp_cost *= 1.5;
        }
        
        $("#" + skillType).text(description);
        $("#" + skillType + "_sp").html("<b>SP Cost</b>: " + sp_cost);
        
        if (skillType === skillTypes.WEAPON) {
            $("#weapon_might").html(mt);
            $("#weapon_range").html(rng);
        } else if (skillType === skillTypes.SPECIAL) {
            $("#special_cooldown").html(cooldown);
        }
        
        heroIDs.forEach(function(heroID, idx){
            var heroStars = "<div class='hero-stars'>";
            var levelLearned = gon.skill_heroes[id][heroID];
            if (levelLearned > 1) {
                for (var i = 0; i < levelLearned; i++) {
                    heroStars += "<img src='/images/20px-Icon_Rarity_" + levelLearned + ".png'/>"
                }
            }
            heroStars += "</div>";
            var heroName = gon.heroes[heroID].name;
            $("#" + skillType + "_heroes").append('<div class="hero-icon-container"><div>' + heroName + '</div><img src="/images/hero_icons/75px-Icon_Portrait_' + heroName.replace(/\s/g, "_") + '.png"/>' + heroStars + '</div>');
        });
    } else { // deselect skill
        $("#" + skillType + "_descriptions .description-text").empty();
        $("#" + skillType + "_heroes").empty();
        if (skillType === skillTypes.A_PASSIVE) {
            setAPassiveModifiers(0, 0, 0, 0, 0);
        } else if (skillType === skillTypes.WEAPON) {
            statBonuses.weaponMight = 0;
            updateStats();
        }
    }
}