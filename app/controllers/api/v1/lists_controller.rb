class Api::V1::ListsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_list, only: [ :show, :update, :destroy ]

  def index
    @lists = policy_scope(List)
  end

  def show
  end

  def update
    if @list.update(list_params)
      render :show
    else
      render_error
    end
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list
    if @list.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @list.destroy
    head :no_content
  end

  private

  def set_list
    @list = List.find(params[:id])
    authorize @list
  end

  def list_params
    params.require(:list).permit(:title)
  end

  def render_error
    render json: { errors: @list.errors.full_messages },
      status: :unprocessable_entity
  end
end
