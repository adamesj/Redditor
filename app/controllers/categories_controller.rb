class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category has been added!"
      redirect_to categories_path
    else
      flash[:error] = "Something went wrong, please check the error message."
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      flash[:notice] = "Category has been updated!"
      redirect_to category_path(category)
    else
      flash[:error] = "Something went wrong, please check the error message."
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category has been deleted."
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end