module Api
    class CPassivesController < SkillsController
        private
            def c_passive_params
                params.require(:skill)
            end
    end
end