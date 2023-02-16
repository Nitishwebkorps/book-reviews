class Review < ApplicationRecord

    belongs_to :book

    STAR=%w{1_star 2_star 3_star 4_star 5_star}

    validates :r_name, :r_desc, presence:true

end