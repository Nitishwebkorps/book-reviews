class BooksController < ApplicationController
    
    before_action :authenticate_user!, except: [:index,:show]
    
    
    

    def index
       @book = Book.all
    end

    def new
       @book = Book.new
    end

    def create
    @user = current_user.id
    @book = Book.new(params.require(:book).permit(:book_name,:description,:published_date,:image))
    @book.user_id = @user
       if @book.save 
            WelcomeNotificationMailer.create_notification(@book).deliver_now
           flash[:success] = "You have successfully entered your details"
           redirect_to root_path
       else
           render 'new'
       end
   end

   def show
       @book = Book.find(params[:id])
       @authors=Author.find(params[:id])
       
   end

   def edit
        @book = Book.find(params[:id])
   end
    
   def update
        @book = Book.find(params[:id])
       if @book.update(params.require(:book).permit(:book_name,:description,:published_date,:image))
        
           flash[:success] = "You have successfully updated your information"
           redirect_to books_path(@book)
       else
           render 'new'
       end
   end

   def destroy
        @book = Book.find(params[:id])
       @book.destroy
       redirect_to books_path
   end

   

end