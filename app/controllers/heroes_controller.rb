class HeroesController < ApplicationController
    def index
        redirect_to root_path
    end
    
    def show
        @heroes = Hero.select(:id, :name)
        @hero = Hero.find(params[:id])
        @a_passives = Skill.a_passives.select { |skill| @hero.can_inherit_skill(skill) }
        @b_passives = Skill.b_passives.select { |skill| @hero.can_inherit_skill(skill) }
        @c_passives = Skill.c_passives.select { |skill| @hero.can_inherit_skill(skill) }
        @weapons = Skill.weapons.select { |skill| @hero.can_inherit_skill(skill) }
        @assists = Skill.assists.select { |skill| @hero.can_inherit_skill(skill) }
        @specials = Skill.specials.select { |skill| @hero.can_inherit_skill(skill) }
        
        @skill_heroes = {}
        @hero_skills = HeroSkill.select("skill_id, hero_id, rarity")
        @hero_skills.each do |hero_skill|
            skill_id = hero_skill.skill_id
            hero_id = hero_skill.hero_id
            rarity = hero_skill.rarity
            if @skill_heroes.has_key? skill_id
                @skill_heroes[skill_id][hero_id] = rarity
            else
                @skill_heroes[skill_id] = Hash[hero_id, rarity]
            end
        end
        
        gon.heroes = @heroes.index_by { |hero| hero.id }
        gon.hero = @hero.as_json
        gon.default_skills = @hero.default_skills
        gon.a_passives = @a_passives.index_by { |a_passive| a_passive.id }
        gon.b_passives = @b_passives.index_by { |b_passive| b_passive.id }
        gon.c_passives = @c_passives.index_by { |c_passive| c_passive.id }
        gon.weapons = @weapons.index_by { |weapon| weapon.id }
        gon.assists = @assists.index_by { |assist| assist.id }
        gon.specials = @specials.index_by { |special| special.id }
        gon.skill_heroes = @skill_heroes
        
        render "hero"
    end
end