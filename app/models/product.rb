class Product < ApplicationRecord
  belongs_to :list
  has_one :user, through: :list

  after_create :scrape
  validates :url, presence: true

  private

  def scrape
    if url.include?("leitura.com.br")
      ScrapeLeituraJob.perform_later(self)
    elsif url.include?("madeiramadeira.com.br")
      ScrapeMadeiraJob.perform_later(self)
    elsif url.include?("hm.com")
      ScrapeHmJob.perform_later(self)
    end
  end
end
