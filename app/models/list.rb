class List < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  # validates :title, presence: true, uniqueness: { unless: -> { title == 'default' } }
  validates :title, presence: true, uniqueness: { scope: :user }

end
