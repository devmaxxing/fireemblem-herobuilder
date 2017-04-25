class Weapon < ApplicationRecord
    acts_as :skill
    validates :weapon_type, :might, :range, presence:true
    validates :might, :range, numericality: { only_integer: true, greater_than: 0 }
end