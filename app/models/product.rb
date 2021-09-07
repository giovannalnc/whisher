class Product < ApplicationRecord
  belongs_to :list
  has_one :user, through: :list

  after_create :scrape
  validates :url, presence: true

  def delivery_mail
    if last_price > price
      decrease_price.deliver_now
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
