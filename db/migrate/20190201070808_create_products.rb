class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.string :sku
      t.boolean :deal_active
      t.string :product_type

      t.timestamps
    end
  end
end
