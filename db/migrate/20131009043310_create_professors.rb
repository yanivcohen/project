class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :firstname
      t.string :lastname
      t.string :department
      t.integer :ratingcount
      t.integer :rating
      t.string :comments
      t.string :text

      t.timestamps
    end
  end
end
