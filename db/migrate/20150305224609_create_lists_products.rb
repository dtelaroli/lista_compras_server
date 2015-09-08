class CreateListsProducts < ActiveRecord::Migration
  def change
    create_table :lists_products, id: :uuid do |t|
      t.references :list, type: :uuid, index: true
      t.references :product, type: :uuid, index: true
      t.boolean :ok

      t.timestamps null: false
    end
    add_foreign_key :list_products, :lists
    add_foreign_key :list_products, :products
  end
end
