class UserPolicy < ApplicationPolicy
 

  def index
    current_user.admin?
  end
end
