class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.float :price
      t.string :condition
      t.integer :book_id
      t.string :seller

      t.timestamps
    end
  end
end
