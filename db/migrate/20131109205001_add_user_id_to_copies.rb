class AddUserIdToCopies < ActiveRecord::Migration
  def change
    add_column :copies, :user_id, :integer
  end
end
