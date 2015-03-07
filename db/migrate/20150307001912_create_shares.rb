class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :user, index: true
      t.uuid :list, index: true

      t.timestamps null: false
    end
    add_foreign_key :shares, :users
    add_foreign_key :shares, :lists
  end
end
