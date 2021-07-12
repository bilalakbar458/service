class PagesController < ApplicationController
  def home
    
  end

  def member_area
    flash[:alert] = "Access Denied."
    redirect_to root_path unless user_signed_in?    
  end
  def admin_space
    unless (user_signed_in? and current_user.user_type == "admin")
      flash[:alert] = "Access Denied."
      redirect_to root_path 
    end
  end
end