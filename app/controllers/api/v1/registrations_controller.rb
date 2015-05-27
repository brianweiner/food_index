module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      include ApiAuthentication
      skip_before_filter :restrict_access_by_token, :only => :create
      respond_to :json
     
      def create
        user = User.new(sign_up_params)
        if user.save
          render :json=> user, :status=>201
          return
        else
          #TO DO RESPOND WITH A GOOD ERROR
          warden.custom_failure!
          render :json=> user.errors, :status=>422
        end
      end
    end
  end
end