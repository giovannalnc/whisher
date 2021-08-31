class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    url = @product.url

    html_file = HTTParty.get(url)
    html_doc = Nokogiri::HTML(html_file)

    @product.name = html_doc.search('.product-title').text.strip
    price = html_doc.search('h2').text.strip
    @product.price = price[2..].gsub(',', '.').to_f
    @product.inventory = html_doc.search('h4 b').text.strip
    if @product.save
      redirect_to product_path(@product), notice: 'Product was successfully added.'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:url)
  end
end
