class AddPasswordDigestToYcUsers < ActiveRecord::Migration
  def change
    add_column :yc_users, :password_digest, :string
  end
end
