class AddStateToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :state, :integer, default: 0
  end
end
