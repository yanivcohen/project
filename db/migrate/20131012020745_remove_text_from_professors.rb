class RemoveTextFromProfessors < ActiveRecord::Migration
  def change
    remove_column :professors, :text, :text
  end
end
