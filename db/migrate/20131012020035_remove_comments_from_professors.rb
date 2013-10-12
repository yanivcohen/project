class RemoveCommentsFromProfessors < ActiveRecord::Migration
  def change
    remove_column :professors, :comments, :text
  end
end
