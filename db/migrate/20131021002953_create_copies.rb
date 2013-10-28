class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.float :price
      t.string :condition
      t.integer :book_id
      t.string :seller

      t.timestamps
    end
    add_index :copies, [:book_id, :created_at]
  end
end
