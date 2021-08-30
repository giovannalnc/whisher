class List < ApplicationRecord
  belongs_to :user
  has_many :product, through: :bookmarks
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
