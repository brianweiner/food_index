module ApiAuthentication
  extend ActiveSupport::Concern
  included do
    before_filter :restrict_access_by_token
    protect_from_forgery with: :null_session
  end

  private

    def restrict_access_by_token
      authenticate_or_request_with_http_token do |token, options|
        @current_user = User.find_by_email(options['email'])
        @current_user = @current_user.authentication_token == token ? @current_user : false
      end
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password) }
    end

end
