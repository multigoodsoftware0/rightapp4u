class AddMoreExtraColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :snippet, :text
    add_column :products, :tldr, :text
    add_column :products, :benefits, :text
    add_column :products, :total_licenses_available, :integer
  end
end
