class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists, id: :uuid do |t|
      t.references :user, type: :uuid, index: true, null: false
      t.string :name, null: false
      t.boolean :archived, null: false, default: false

      t.timestamps null: false
    end
    add_foreign_key :lists, :users
  end
end
