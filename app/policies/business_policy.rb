class BusinessPolicy < ApplicationPolicy
  attr_reader :current_user, :business


  def initialize(current_user, business)
    @current_user = current_user
    @business = business
  end

  def index?
    false
  end

  def show?
    @current_user.user_type == "admin" || (@business.users.include? @current_user and (@current_user.user_type == "writing_broker"))
  end

  def create?
    @current_user.user_type == "admin" || @current_user.user_type == "writing_broker"
  end

  def new?
    @current_user.user_type == "admin" || @current_user.user_type == "writing_broker"
  end

  def update?
    @current_user.user_type == "admin" || (@business.users.include? @current_user and (@current_user.user_type == "writing_broker"))
  end

  def edit?
    @current_user.user_type == "admin" || (@business.users.include? @current_user and (@current_user.user_type == "writing_broker"))
  end

  def destroy?
    @current_user.user_type == "admin" || (@business.users.include? @current_user and (@current_user.user_type == "writing_broker"))
  end

  
end
