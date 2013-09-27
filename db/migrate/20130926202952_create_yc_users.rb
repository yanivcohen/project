class CreateYcUsers < ActiveRecord::Migration
  def change
    create_table :yc_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
