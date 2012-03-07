class AddDefaultBoleanType < ActiveRecord::Migration
  def up
   add_column :users, :status, :boolean, :default => false
  end

  def down
      remove_column :users, :status
  end
end
