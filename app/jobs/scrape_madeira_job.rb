class ScrapeMadeiraJob < ApplicationJob
  queue_as :default

  def perform(product)
    url = product.url

    html_file = HTTParty.get(
      url, {
        headers: {
          "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"
        }
      }
    )
    html_doc = Nokogiri::HTML(html_file)

    product.name = html_doc.search('.product-info__title').text.strip
    price = html_doc.search('.product-prices__big-price').text.strip
    product.price = price.gsub(',', '.').to_f
    product.photo = html_doc.search('.media-gallery__image img').attr("src").value
    product.save!
  end
end
