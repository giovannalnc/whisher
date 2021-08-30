class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :product

  validates :product_id, uniqueness: { scope: :list_id, message: 'Is already in the list' }
end
