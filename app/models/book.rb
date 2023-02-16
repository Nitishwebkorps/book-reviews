class Book < ApplicationRecord

    has_one_attached :image
    has_many :reviews, dependent: :delete_all
    belongs_to :user
    
    

end