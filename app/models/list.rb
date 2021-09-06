class List < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  # validates :title, presence: true, uniqueness: { unless: -> { title == 'default' } }
  validates :title, presence: true, uniqueness: { scope: :user }

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
