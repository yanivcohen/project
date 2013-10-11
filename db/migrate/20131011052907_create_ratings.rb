class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :professor_id
      t.integer :value
      t.string :comment

      t.timestamps
    end
    add_index :ratings, [:professor_id]
  end
end
