class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :yc_users, :email, unique: true
  end
end
