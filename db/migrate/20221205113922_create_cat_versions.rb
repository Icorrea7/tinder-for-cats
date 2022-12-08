class CreateCatVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :cat_versions do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :status
      t.references :cat, index: true, foreign_key: true

      t.datetime :created_at, null: false
    end
  end
end
