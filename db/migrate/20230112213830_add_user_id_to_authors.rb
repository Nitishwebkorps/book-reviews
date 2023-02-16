class AddUserIdToAuthors < ActiveRecord::Migration[7.0]
  def change
    
    add_column :authors, :user_id, :integer
  end
end
