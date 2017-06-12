module ApplicationHelper


  def average_product_rating(product_id)
    reviews = Review.where("product_id = #{product_id}")
    sum = 0
    reviews.each do |r|
      sum += r.rating
    end
    average = (sum.to_f/reviews.count.to_f).round(1)
    reviews.count > 0 ? "Stars #{average}" : " "
  end

end
