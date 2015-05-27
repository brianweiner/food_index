module Api
  module V1
    class SessionsController < Devise::SessionsController
      include ApiAuthentication
      
      skip_before_filter :restrict_access_by_token, :only => :create
      skip_before_filter :verify_signed_out_user
      respond_to :json

      def create  
        self.resource = warden.authenticate!(:scope => resource_name)

        sign_in(resource_name, resource)
        
        render :json => resource, :status => 200
      end

      def destroy
        @current_user.reset_authentication_token!
        super
      end
    end
  end
end