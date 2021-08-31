class ProductsController < ApplicationController
  def index
    @products = policy_scope(Product)
  end

  def show
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    authorize @product
  end

  def destroy
    authorize @product
  end
end
