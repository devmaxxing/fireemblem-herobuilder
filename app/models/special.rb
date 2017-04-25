class Special < ApplicationRecord
    acts_as :skill
    validates :cooldown, presence: true, numericality: { only_integer: true, greater_than: 0 }
end