class ProductsController < ApplicationController
  def new
    @product = Product.new
    @list = List.find(params[:list_id])
    authorize @product
  end

  def create
    @list = List.find(params[:list_id])
    @product = Product.new(product_params)
    @product.list = @list
    authorize @product
    if @product.save
      redirect_to list_path(@list), notice: 'Product was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to list_path(@product.list)
  end

  private

  def product_params
    params.require(:product).permit(:url)
  end
end
