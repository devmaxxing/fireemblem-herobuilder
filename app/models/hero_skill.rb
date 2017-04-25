class HeroSkill < ApplicationRecord
    validates :hero, :skill, :rarity, presence: true
    belongs_to :hero
    belongs_to :skill
end