module DeviseWhitelist
    extend ActiveSupport::Concern

    included do
        before_action :configure_permitted_parameters, if: :devise_controller?
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_type])
    end

    def after_sign_in_path_for (resource)
        pages_test_path
    end
end