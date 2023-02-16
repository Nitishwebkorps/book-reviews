class AuthorsController < ApplicationController
    before_action :authenticate_user!, except: [:index,:show]
    
    def index
        @authors = Author.all
    end
    
    def new
      @author = Author.new
    # @user = current_user
    end
    
    def create
      @user = current_user.id
      @author = Author.new(params.require(:author).permit(:name,:about,:experience,:written_books,:dob,:address,:email,:pic))
      @author.user_id = @user
      if @author.save 
        flash[:success] = "You have successfully entered your details"
        redirect_to root_path
      else
        render 'new'
      end
    end
    
    def show
      @author = Author.find(params[:id])
      
      if is_available
        @author = find_author
      else
        redirect_to new_author_path
      end
    end
    
    def edit
      @author = Author.find(params[:id])
    end

    def personal_details
      @author = Author.find(params[:id])
    end

    def update
      @author = Author.find(params[:id])
      if @author.update(params.require(:author).permit(:name,:about,:experience,:written_books,:dob,:address,:email,:pic))
        flash[:success] = "You have successfully updated your information"
        redirect_to root_path(@author)
      else
        render 'new'
      end
    end
    
    def destroy
      @author = Author.find(params[:id])
      @author.destroy
      redirect_to root_path
    end
    
    def is_available
      return Author.find_by(:user_id => current_user)
    end
    
    def find_author
      return Author.find_by(:user_id => current_user)
    end
    
    end
    