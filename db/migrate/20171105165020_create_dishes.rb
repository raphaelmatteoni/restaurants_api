class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price, precision: 6, scale: 2, default: 0
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
