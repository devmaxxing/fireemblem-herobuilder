class Skill < ApplicationRecord
    actable
    validates :name, :sp_cost, :inherit_rule, presence: true
    validates :sp_cost, numericality: { only_integer: true }
    has_many :hero_skills
    has_many :heroes, through: :hero_skills
    has_many :child_skills, foreign_key: :parent_id
    has_many :children, through: :child_skills, class_name: "Skill"
    has_many :parents, through: :child_skills , class_name: "Skill"
    
    
    scope :a_passives, -> { select("skills.*, a_passives.effect_attack, a_passives.effect_defense, a_passives.effect_health, a_passives.effect_resistance, a_passives.effect_speed").joins("INNER JOIN a_passives ON a_passives.id = skills.actable_id AND skills.actable_type = 'APassive'") }
    scope :b_passives, -> { joins("INNER JOIN b_passives ON b_passives.id = skills.actable_id AND skills.actable_type = 'BPassive'") }
    scope :c_passives, -> { joins("INNER JOIN c_passives ON c_passives.id = skills.actable_id AND skills.actable_type = 'CPassive'") }
    scope :specials, -> { select("skills.*, specials.cooldown").joins("INNER JOIN specials ON specials.id = skills.actable_id AND skills.actable_type = 'Special'") }
    scope :assists, -> { joins("INNER JOIN assists ON assists.id = skills.actable_id AND skills.actable_type = 'Assist'") }
    scope :weapons, -> { select("skills.*, weapons.weapon_type, weapons.color, weapons.range, weapons.might").joins("INNER JOIN weapons ON weapons.id = skills.actable_id AND skills.actable_type = 'Weapon'") }
end