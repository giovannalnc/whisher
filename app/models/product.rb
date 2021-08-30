class Product < ApplicationRecord
  has_many :bookmarks

  validates :name, :price, :inventory, presence: true
end
