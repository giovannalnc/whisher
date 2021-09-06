class AddLastPriceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :last_price, :float
  end
end
