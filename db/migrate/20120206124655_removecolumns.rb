class Removecolumns < ActiveRecord::Migration
  def up
    remove_column :users, :type
    remove_column :users, :status
  end

  def down
    add_column :users, :type
    add_column :users, :status
  end
end
