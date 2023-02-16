class AddPicToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :pic, :string
  end
end
