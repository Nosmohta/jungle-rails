class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where([ "product_id = ?", params[:id]]).order(created_at: :desc)
    @new_review = Review.new
    @rating_options = [['*', 1],['**', 2],['***', 3],['****', 4],['*****', 5]]
  end




end
