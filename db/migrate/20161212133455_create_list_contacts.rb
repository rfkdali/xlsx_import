class CreateListContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :list_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :reason
      t.boolean :validated
      t.references :import, foreign_key: true

      t.timestamps
    end
  end
end
