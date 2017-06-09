class CategoriesController < ApplicationController

  def index
    @category = Category.all.order(created_at: :desc)
  end

  def show
    @category = Category.find( params[:id])
    @products = Product.where(["category_id = ? ", params[:id]])
  end

  def create
    # Create query
  end

end
