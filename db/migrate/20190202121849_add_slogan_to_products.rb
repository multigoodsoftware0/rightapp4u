class AddSloganToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :slogan, :string
  end
end
