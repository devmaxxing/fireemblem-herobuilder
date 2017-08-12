module Api
    class BaseController < ApplicationController
        protect_from_forgery with: :null_session
        before_action :set_resource, only: [:destroy, :show, :update]
        respond_to :html, :json
        
        #POST api/resource
        def create
            set_resource(resource_class.new(resource_params))
            
            if get_resource.save
                render :show, status: :created
            else
                render json: get_resource.errors, status: :unprocessable_entity
            end
        end
        
        #PATCH/PUT api/resource/#
        def update
            if get_resource.update(resource_params)
                render :show
            else
                render json: get_resource.errors, status: :unprocessable_entity
            end
        end
        
        #GET api/resource/#
        def show
            render json: get_resource
        end
        
        #GET api/resource
        def index
            plural_resource_name = "@#{resource_name.pluralize}"
            resources = resource_class.where(query_params)
                                      .page(page_params.dig(:page, :number))
                                      .per(page_params.dig(:page, :size))
            instance_variable_set(plural_resource_name, resources)
            render json: instance_variable_get(plural_resource_name)
        end
        
        #DELETE api/resource/#
        def destroy
            get_resource.destroy
            head :no_content
        end
        
        private
        
            def get_resource
                instance_variable_get("@ #{resource_name}")
            end
            
            def query_params
                {}
            end
        
            def page_params
                params.permit(:page).permit(:number, :size)
                params
            end
            
            def resource_class
                @resource_class ||= resource_name.classify.constantize
            end
            
            def resource_name
                @resource_name ||= self.controller_name.singularize
            end
            
            def resource_params
                @resource_params ||= self.send("#{resource_name}_params")
            end
            
            def set_resource(resource = nil)
                resource ||= resource_class.find(params[:id])
                instance_variable_set("@#{resource_name}", resource)
            end
            
    end
end