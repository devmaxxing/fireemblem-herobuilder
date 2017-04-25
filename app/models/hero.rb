class Hero < ApplicationRecord
    validates :name, :colour, :weapon_type, :move_type, presence: true
    has_many :hero_skills
    has_many :skills, through: :hero_skills do
        def default_skill_info
            select(:id, :actable_type, :actable_id, :sp_cost)
        end
    end
    
    def weak_to_colour(colour)
        if  ( self.colour == FeharenaBuilds::COLOUR_RED && colour == FeharenaBuilds::COLOUR_BLUE ) ||
            ( self.colour == FeharenaBuilds::COLOUR_BLUE && colour == FeharenaBuilds::COLOUR_GREEN ) ||
            ( self.colour == FeharenaBuilds::COLOUR_GREEN && colour == FeharenaBuilds::COLOUR_RED )
            return true
        end
        return false
    end
    
    def is_ranged
        if (self.weapon_type == FeharenaBuilds::WEAPON_TYPE_BOW ||
            self.weapon_type == FeharenaBuilds::WEAPON_TYPE_DAGGER ||
            self.weapon_type == FeharenaBuilds::WEAPON_TYPE_STAFF ||
            self.weapon_type == FeharenaBuilds::WEAPON_TYPE_TOME )
            return true
        end
        return false
    end

    def can_inherit_skill(skill)
        if skill.is_a?(Skill)
            if (skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_NOT_INHERITABLE && (self.skills.include? skill))
                return true
            elsif skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_NOT_INHERITABLE ||
                skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_DANCER_ONLY ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_COLOUR_ONLY && self.colour == FeharenaBuilds::COLOUR_NO_COLOUR ) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_NO_BLUE && self.colour == FeharenaBuilds::COLOUR_BLUE ) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_NO_GREEN && self.colour == FeharenaBuilds::COLOUR_GREEN ) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_NO_RED && self.colour == FeharenaBuilds::COLOUR_RED ) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_NO_STAFF && self.weapon_type == FeharenaBuilds::WEAPON_TYPE_STAFF ) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_NO_FLIERS && self.move_type == FeharenaBuilds::MOVE_TYPE_FLIER ) ||
                ( skill.specific.is_a?(Weapon) && (skill.specific.weapon_type != self.weapon_type ||
                                         (skill.specific.colour && skill.specific.colour != self.colour))) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_ARMOUR_ONLY && self.move_type != FeharenaBuilds::MOVE_TYPE_ARMOUR) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_CAVALRY_ONLY && self.move_type != FeharenaBuilds::MOVE_TYPE_CAVALRY) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_FLIER_ONLY && self.move_type != FeharenaBuilds::MOVE_TYPE_FLIER) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_STAFF_ONLY && self.weapon_type != FeharenaBuilds::WEAPON_TYPE_STAFF) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_DRAGON_ONLY && self.weapon_type != FeharenaBuilds::WEAPON_TYPE_DRAGON) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_AXE_ONLY && self.weapon_type != FeharenaBuilds::WEAPON_TYPE_AXE) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_BOW_ONLY && self.weapon_type != FeharenaBuilds::WEAPON_TYPE_BOW) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_MELEE_ONLY && self.is_ranged) ||
                ( skill.inherit_rule == FeharenaBuilds::INHERIT_RULES_RANGED_ONLY && !self.is_ranged)
                return false
            end
            return true
        else
            raise "Expected skill"
        end
    end
    
    def default_skills
        defaults = {weapon: nil, a_passive: nil, b_passive: nil, c_passive: nil, assist: nil, special: nil}
        sorted_skills = self.skills.default_skill_info.sort_by { |skill| skill.sp_cost }.reverse
        sorted_skills.each do |skill|
            skill_class = :weapon
            if skill.actable_type == "APassive"
                skill_class = :a_passive
            elsif skill.actable_type == "BPassive"
                skill_class = :b_passive
            elsif skill.actable_type == "CPassive"
                skill_class = :c_passive
            elsif skill.actable_type == "Assist"
                skill_class = :assist
            elsif skill.actable_type == "Special"
                skill_class = :special
            end
            
            if defaults[skill_class].nil?
                defaults[skill_class] = skill
            end
        end
        return defaults
    end
end