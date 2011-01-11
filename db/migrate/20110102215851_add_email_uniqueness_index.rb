class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
   add_index :users, :email, :unique => true
  end

  def self.down
   remote_index :users, :email
  end
end