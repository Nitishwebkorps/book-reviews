class RemoveAuthorIdFromBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :author_id
  end
end
