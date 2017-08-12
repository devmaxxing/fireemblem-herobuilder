class SkillSerializer < ActiveModel::Serializer
    attributes :id, :skill_id, :skill_type, :name, :description, :type, :sp_cost, :inherit_rule
    
    has_many :children, key: :child_skills
    has_many :parents, key: :parent_skills
    
    def skill_id
        object.actable_id
    end
    
    def skill_type
        object.actable_type
    end
end
