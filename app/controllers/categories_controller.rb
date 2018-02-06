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
      redirect_to categories_path
    else
      flash.notice = "Failed to create category due to an error."
      render :"categories/new"
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
