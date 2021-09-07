class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end

  def show
    @list = List.find(params[:id])
    authorize @list
    @products = @list.products
  end

  def update
    @list = List.find(params[:id])
    @list.user = current_user
    authorize @list
    @list.update(list_params)
    respond_to do |format|
      format.text { render partial: 'lists/list_info', locals: { list: @list }, formats: [:html] }
    end
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

  def destroy
    @list = List.find(params[:id])
    authorize @list
    if current_user.lists.count <= 1
      redirect_to list_path(@list), alert: "You must have at least one list."
    else
      @list.destroy
      redirect_to lists_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :photo)
  end
end
