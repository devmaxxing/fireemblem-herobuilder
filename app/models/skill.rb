class Skill < ApplicationRecord
    actable
    validates :name, :sp_cost, :inherit_rule, presence: true
    validates :sp_cost, numericality: { only_integer: true }
    has_many :hero_skills
    has_many :heroes, through: :hero_skills
    belongs_to :skill, foreign_key: "required_skill_id"
    
    scope :a_passives, -> { joins("INNER JOIN a_passives ON a_passives.id = skills.actable_id AND skills.actable_type = 'APassive'") }
    scope :b_passives, -> { joins("INNER JOIN b_passives ON b_passives.id = skills.actable_id AND skills.actable_type = 'BPassive'") }
    scope :c_passives, -> { joins("INNER JOIN c_passives ON c_passives.id = skills.actable_id AND skills.actable_type = 'CPassive'") }
    scope :specials, -> { select("skills.*, specials.cooldown").joins("INNER JOIN specials ON specials.id = skills.actable_id AND skills.actable_type = 'Special'") }
    scope :assists, -> { joins("INNER JOIN assists ON assists.id = skills.actable_id AND skills.actable_type = 'Assist'") }
    scope :weapons, -> { select("skills.*, weapons.weapon_type, weapons.colour, weapons.range, weapons.might").joins("INNER JOIN weapons ON weapons.id = skills.actable_id AND skills.actable_type = 'Weapon'") }
end