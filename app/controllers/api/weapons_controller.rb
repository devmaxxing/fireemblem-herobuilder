module Api
    class WeaponsController < SkillsController
        private
            def weapon_params
                params.require(:skill).permit(:weapon_type, :might, :range)
            end
    end
end