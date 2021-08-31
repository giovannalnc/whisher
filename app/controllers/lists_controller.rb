class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end

  def show
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    authorize @list
  end

  def edit
    authorize @list
  end

  def update
    authorize @list
  end

  def destroy
    authorize @list
  end
end
