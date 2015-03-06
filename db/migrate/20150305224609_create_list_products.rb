class CreateListProducts < ActiveRecord::Migration
  def change
    create_table :list_products, id: false do |t|
      t.uuid :id, primary_key: true
      t.uuid :list_id
      t.uuid :product_id
      t.boolean :ok

      t.timestamps null: false
    end
    add_foreign_key :list_products, :lists, column: :list_id
    add_foreign_key :list_products, :products, column: :product_id
  end
end
