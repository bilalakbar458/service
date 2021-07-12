class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def after_sign_in_path_for (resource)
        member_area_path
    end

    private

        def user_not_authorized
            flash[:alert] = "Access Denied."
            redirect_to (request.referrer || root_path)
        end

end
