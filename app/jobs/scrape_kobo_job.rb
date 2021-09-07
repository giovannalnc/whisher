class ScrapeKoboJob < ApplicationJob
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

    product.name = html_doc.search('.item-info > h2').text.strip
    price = html_doc.search('.price-wrapper > .price').text.strip
    product.price = price[6..].to_f
    product.photo = html_doc.search('.cover-image').attr("src").value
    product.save!
  end
end
