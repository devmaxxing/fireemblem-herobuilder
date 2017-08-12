module Api
    class SpecialsController < SkillsController
        private
            def special_params
                params.require(:skill).permit(:cooldown)
            end
    end
end