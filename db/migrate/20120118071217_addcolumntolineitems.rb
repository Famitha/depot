class Addcolumntolineitems < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :float
  end

  def down
    remove_column :line_items, :price
  end
end
