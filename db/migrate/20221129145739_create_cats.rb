class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
