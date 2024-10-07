class RemoveProductIdFromOrders < ActiveRecord::Migration[5.2]
  def up
    remove_column :orders, :product_id
  end
  def down
    add_column :orders, :product_id, :integer
  end
end
