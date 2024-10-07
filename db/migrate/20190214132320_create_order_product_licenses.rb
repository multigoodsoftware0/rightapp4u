class CreateOrderProductLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :order_product_licenses do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :user_id
      t.string :license

      t.timestamps
    end
  end
end
