class ApplicationController < ActionController::Base
    include DeviseWhitelist


    def after_sign_in_path_for (resource)
        member_area_path
    end

end
