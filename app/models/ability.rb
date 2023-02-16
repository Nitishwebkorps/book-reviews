# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?

    else
      can :update, book do |book|
        book.user ==

    end
  
  end
end
