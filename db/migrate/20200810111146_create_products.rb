class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.decimal :price, precision: 10, scale: 2
      t.string :type
      t.integer :quantity
      t.belongs_to :offer

      t.timestamps
    end
  end
end
