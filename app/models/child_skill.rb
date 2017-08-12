class ChildSkill < ApplicationRecord
    validates :parent, :child, presence: true
    belongs_to :child, class_name: "Skill"
    belongs_to :parent, class_name: "Skill"
end