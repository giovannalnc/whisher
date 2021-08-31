class Product < ApplicationRecord
  belongs_to :list

  validates :name, :price, :inventory, presence: true
end
