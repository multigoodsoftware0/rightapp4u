class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.float :price
      t.string :status
      t.string :payment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
