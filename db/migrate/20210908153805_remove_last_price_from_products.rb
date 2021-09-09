class RemoveLastPriceFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :last_price, :float
  end
end
