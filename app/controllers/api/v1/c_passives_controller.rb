module Api
    module V1
        class CPassivesController < SkillsController
            private
                def c_passive_params
                    params.require(:skill)
                end
        end
    end
end