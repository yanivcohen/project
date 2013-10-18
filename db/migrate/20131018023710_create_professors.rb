class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :firstname
      t.string :lastname
      t.string :department

      t.timestamps
    end
  end
end
