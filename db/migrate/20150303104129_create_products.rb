class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: false do |t|
      t.uuid :id, primary_key: true
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
