class ChangeDefaultvalueForInventoryProducts < ActiveRecord::Migration[6.0]
  def change
    change_column_default :products, :inventory, 'Available'
  end
end
