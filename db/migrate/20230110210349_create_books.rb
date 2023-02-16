class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :book_name
      t.text :description
      t.string :published_date
      t.string :image
      

      t.timestamps
    end
  end
end
