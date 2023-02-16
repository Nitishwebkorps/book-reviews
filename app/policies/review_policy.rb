class ReviewPolicy < ApplicationPolicy
    attr_reader :current_user, :review
  
    def initialize(current_user, review)
      @current_user = current_user
      @review = review
    end
  
   
  
    def index?
      current_user.admin?
    end
  
  
  end