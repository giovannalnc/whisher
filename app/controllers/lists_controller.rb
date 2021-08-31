class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end

  def show
    @list = List.find(params[:id])
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list
    if @list.save
      redirect_to lists_path, notice: 'The new List was successfully created.'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
