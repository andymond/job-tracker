class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.text :email
      t.references :company, foreign_key: true

      t.timestamps null: false
    end
  end
end
