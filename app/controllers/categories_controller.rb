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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash.notice = "#{@category.title} updated."
      redirect_to(categories_path)
    else
      flash.notice = "#{@category.title} not updated due to an error."
      render ":categories/edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
