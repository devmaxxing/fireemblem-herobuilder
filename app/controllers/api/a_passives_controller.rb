module Api
    class APassivesController < Api::SkillsController
        private
            def a_passive_params
                params.require(:skill).permit(:effect_health, :effect_attack, :effect_speed, :effect_defense, :effect_health)
            end
    end
end