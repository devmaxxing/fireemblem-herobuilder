module Api
    module V1
        class AssistsController < SkillsController
            private
                def assist_params
                    params.require(:skill)
                end
        end
    end
end