class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :r_name
      t.text :r_desc
      t.string :star 
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
