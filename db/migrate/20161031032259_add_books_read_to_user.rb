class AddBooksReadToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :books_read, :json
  end
end
