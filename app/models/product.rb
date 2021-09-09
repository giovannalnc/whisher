class Product < ApplicationRecord
  belongs_to :list
  has_one :user, through: :list

  after_create :scrape
  validates :url, presence: true
  validate :verify_url

  def verify_url
    unless url.include?("leitura.com.br") || url.include?("madeiramadeira.com.br") || url.include?("hm.com") || url.include?("kobo.com") || url.include?("mygeekbox.us")
      errors.add(:url, message: "*Sorry, store not supported yet.")
    end
  end

  private

  def scrape
    if url.include?("leitura.com.br")
      ScrapeLeituraJob.perform_later(self)
    elsif url.include?("madeiramadeira.com.br")
      ScrapeMadeiraJob.perform_later(self)
    elsif url.include?("hm.com")
      ScrapeHmJob.perform_later(self)
    elsif url.include?("kobo.com")
      ScrapeKoboJob.perform_later(self)
    elsif url.include?("mygeekbox.us")
      ScrapeGeekboxJob.perform_later(self)
    end
  end

end
