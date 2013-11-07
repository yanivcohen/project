class AddSoldToCopies < ActiveRecord::Migration
  def change
    add_column :copies, :sold, :boolean, :default => false
  end
end
