module Api
    module V1
        class BaseController < ApplicationController
            protect_from_forgery unless: -> { request.format.json? }
            helper_method :current_user
            respond_to :json
            
            def require_admin!
                require_login!
                return true if current_user.try(:admin?)
                render json: { errors: [{detail: "Access denied"}]}, status: 401
            end
            
            def require_login!
                return true if authenticate_token
                render json: { errors: [ { detail: "Access denied" } ] }, status: 401
            end
            
            def current_user
                return @current_user ||= authenticate_token
            end
            
            private
                def authenticate_token
                    authenticate_with_http_token do |token, options|
                        User.find_by(auth_token: token)
                    end
                end
        end
    end
end