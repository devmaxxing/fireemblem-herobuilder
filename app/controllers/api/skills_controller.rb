module Api
    class SkillsController < Api::BaseController
        private
            def resource_params
                @resource_params ||= self.send("#{resource_name}_params")
                                         .deep_merge(params.require(:skill).permit(:type, :name, :description, :inherit_rule, :sp_cost))
            end
    end
end