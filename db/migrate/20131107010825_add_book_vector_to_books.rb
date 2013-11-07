class AddBookVectorToBooks < ActiveRecord::Migration
  def change
    add_column :books, :book_vector, :text
  end
end
