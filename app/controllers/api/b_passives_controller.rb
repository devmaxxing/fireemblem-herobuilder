module Api
    class BPassivesController < SkillsController
        private 
            def b_passive_params
                params.require(:skill)
            end
    end
end