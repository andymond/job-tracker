class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash.notice = "'#{@category.title}' was created."
      redirect_to category_path(@category)
    else
      flash.notice = "Failed to create category due to an error."
      render :"categories/new"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
