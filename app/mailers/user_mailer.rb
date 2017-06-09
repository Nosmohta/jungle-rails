class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_details_email(order_id, order_items, order_total)
    @order_id = order_id
    @order_items = order_items
    @order_total = order_total
    mail(to: 'Thomson.w.andrew@gmail.com', subject: 'Thank you for the order #'.concat(order_id.to_s) )
  end

end
