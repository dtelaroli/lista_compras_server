class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists, id: false do |t|
      t.uuid :id, primary_key: true
      t.references :user, index: true, null: false
      t.string :name, null: false
      t.boolean :archived, null: false, default: false

      t.timestamps null: false
    end
    add_foreign_key :lists, :users
  end
end
