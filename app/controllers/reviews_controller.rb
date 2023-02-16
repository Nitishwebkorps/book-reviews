class ReviewsController < ApplicationController
  before_action :authenticate_user!

  
   
        def create
          @book = Book.find(params[:book_id])
          @review = @book.reviews.create(review_params)
          redirect_to book_path(@book)
        end

        def index
          @review=Review.all
        end

        def profile
          @book = Book.find(params[:book_id])
          @reviews=@book.reviews
        end

      
        private
          def review_params
            params.require(:review).permit(:r_name, :r_desc, :star, :birth,:locality,:interested)
          end
      

end