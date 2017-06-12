class ReviewsController < ApplicationController

  before_action :require_login


  def create
    @review = Review.new do |r|
      r.product_id = params[:product_id]
      r.user_id = session[:user_id]
      r.rating = params[:review][:rating]
      r.description = params[:review][:description]
    end
    if @review.save
       redirect_to product_url(params[:product_id]),  notice: 'Review was successfully created.'
    else
      redirect_to product_url(params[:product_id]), notice: 'Review post Failed.'
    end
  end

  def destroy
    puts "put destroy logic here:"
    puts params[:id]
    Review.destroy( params[:id])
    redirect_to product_url(params[:product_id]),  notice: 'Review was successfully deleted'
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.

  def review_params
    params.require(:review).permit(:rating)
  end

  def require_login
    if current_user && (current_user.id == session[params[:user_id]])
      flash[:error] = 'You must be logged in to delete a review'
      redirect_to '/login'
    end
  end


end


