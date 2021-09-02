class MonitoringJob < ApplicationJob
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

    price = html_doc.search('h2').text.strip.gsub(/[R$]/, ' ').gsub(/,/, '.').to_f
    p product.price
    p price

    if price < product.price
      puts "O preço do #{product.name} agora é #{price}"
    elsif price > product.price
      puts "O preço do #{product.name} aumentou!"
    else
      puts "O preço do #{product.name} está inalterado"
    end
  end
end
