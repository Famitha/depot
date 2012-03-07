class Addtype < ActiveRecord::Migration
  def up
     add_column (:users, :type, :boolean, :default => false)
  end

  def down
    remove_column :users, :type
  end
end
