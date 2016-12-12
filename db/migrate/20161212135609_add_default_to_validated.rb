class AddDefaultToValidated < ActiveRecord::Migration[5.0]
  def change
    change_column :list_contacts, :validated, :boolean, :default => false 
  end
end
