module Api
    class AssistsController < SkillsController
        private
            def assist_params
                params.require(:skill)
            end
    end
end