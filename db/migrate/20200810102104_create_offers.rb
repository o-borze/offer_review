class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :salesman_id
      t.integer :client_id
      t.timestamps
    end
  end
end
