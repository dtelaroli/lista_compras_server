class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares, id: :uuid do |t|
      t.references :user, index: true
      t.references :by, index: true
      t.references :list, type: :uuid, index: true

      t.timestamps null: false
    end
    add_foreign_key :shares, :users
    add_foreign_key :shares, :users, column: :by_id
    add_foreign_key :shares, :lists, column: :list_id
  end
end
