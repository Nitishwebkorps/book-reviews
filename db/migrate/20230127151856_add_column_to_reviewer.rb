class AddColumnToReviewer < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :birth, :string
    add_column :reviews, :bio, :string
    add_column :reviews, :interested, :string
    add_column :reviews, :locality, :string
  end
end
