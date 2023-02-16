class User < ApplicationRecord
  require 'csv'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books
  has_one :authors

  enum :role, { writer: 0, reviewer: 1, admin: 2 }

  before_save {self.email=email.downcase}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
    validates :email, presence: true, length: { maximum: 105 },            
                     uniqueness: { case_sensitive: false },            
                     format: { with: VALID_EMAIL_REGEX }

  def self.to_csv
    CSV.generate(col_sep: ";") do |csv|
      csv << attribute_names
      all.find_each do |record|
        csv << record.attributes.values
      end
    end 
  end
  

end
