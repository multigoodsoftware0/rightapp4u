class AddNameToUsersAndRemoveNameFieldsFromProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    remove_column :profiles, :first_name
    remove_column :profiles, :last_name
  end
end
