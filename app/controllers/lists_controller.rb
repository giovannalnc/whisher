class ListsController < ApplicationController
  def index
    @lists = current_user.lists.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
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
