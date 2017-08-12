class HeroSerializer < ActiveModel::Serializer
    class HeroSkillSerializer < ActiveModel::Serializer
        attributes :id, :name
    end
    attributes :id, :name, :color, :weapon_type, :move_type, :base_attack, :base_defense, :base_health, :base_resistance, :base_speed, :max_attack, :max_defense, :max_health, :max_resistance, :max_speed
    has_many :skills, serializer: HeroSkillSerializer
end
