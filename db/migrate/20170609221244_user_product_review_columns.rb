class UserProductReviewColumns < ActiveRecord::Migration
  def change
    add_reference :products, :review, foreign_key: true
  end
end
