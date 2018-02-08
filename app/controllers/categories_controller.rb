class CategoriesController < ApplicationController
  before_action :set_category, except: [:index, :new, :create]

  def index
    if params[:sort] == "abc"
      @categories = Category.order(:title)
    else
      @categories = Category.all
    end
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
    @jobs = Job.where(category_id: params[:id])
  end

  def edit

  end

  def update
    category_name = @category.title
    if @category.update(category_params)
      flash.notice = "'#{@category.title}' updated."
      redirect_to categories_path
    else
      flash.notice = "'#{category_name}' not updated due to an error."
      redirect_to edit_category_path(@category)
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
