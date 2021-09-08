class Api::V1::ProductsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    @list = List.find(params[:list_id])
    @product = Product.new(product_params)
    @product.list = @list
    authorize @list, :new_product?
    if @product.save
      # render "lists/show", list: @list
      render json: { list: @list, products: @list.products}
    else
      render_error
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def product_params
    params.require(:product).permit(:url)
  end

  def render_error
    render json: { errors: @product.errors.full_messages },
      status: :unprocessable_entity
  end

end
