class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :about
      t.integer :experience
      t.integer :written_books
      t.string :dob
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
