module Api
    module V1
        class ChildSkillsController < ApiController
            private
                def child_skill_params
                    params.require(:child_skill).permit(:parent_id, :child_id)
                end
        end
    end
end