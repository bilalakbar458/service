class PagesController < ApplicationController
  def home
    
  end

  def member_area
    redirect_to root_path unless user_signed_in?    
  end
end
