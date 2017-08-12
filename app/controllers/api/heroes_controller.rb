module Api
    class HeroesController < Api::BaseController
        private
            def hero_params
                params.require(:hero).permit(:name, :color, :weapon_type, :move_type, :base_attack, :base_defense, :base_health, :base_resistance, :base_speed, :max_attack, :max_defense, :max_health, :max_resistance, :max_speed)
            end
    end
end