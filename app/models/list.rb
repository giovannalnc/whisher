class List < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

<<<<<<< HEAD
  validates :title, presence: true, uniqueness: true
=======
  # validates :title, presence: true, uniqueness: { unless: -> { title == 'default' } }
  validates :title, presence: true, uniqueness: { scope: :user }
>>>>>>> master
end
