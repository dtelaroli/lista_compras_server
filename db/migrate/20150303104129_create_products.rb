class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
