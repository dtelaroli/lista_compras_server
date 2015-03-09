class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares, id: false do |t|
      t.uuid :id, primary_key: true
      t.references :user, index: true
      t.references :by, index: true
      t.uuid :list_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :shares, :users
    add_foreign_key :shares, :users, column: :by_id
    add_foreign_key :shares, :lists, column: :list_id
  end
end
