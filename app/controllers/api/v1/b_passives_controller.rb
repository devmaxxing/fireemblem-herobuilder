module Api
    module V1
        class BPassivesController < SkillsController
            private 
                def b_passive_params
                    params.require(:skill)
                end
        end
    end
end