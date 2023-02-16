class UsersController < ApplicationController
  

    
    def index 
        @users =User.all
        respond_to do |format|
          format.html 
          format.csv do
            send_data User.to_csv, filename: Date.today.to_s, content_type: 'csv' 
          end
        end
    end

    

    def edit 
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:role))
          flash[:success]="Profile is updated successfully" 
          redirect_to users_path(@user)
        else
          render 'edit'
        end
    end

    def show
      @user = User.find(params[:id])
      @k=@user.books    
    end    

   

end