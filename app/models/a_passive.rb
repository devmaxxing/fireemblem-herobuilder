class APassive < ApplicationRecord
    acts_as :skill
    validates :effect_attack, :effect_defense, :effect_health, :effect_resistance, :effect_speed, presence: true
end