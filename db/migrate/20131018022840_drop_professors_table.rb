class DropProfessorsTable < ActiveRecord::Migration
  def up
    drop_table :professors
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
