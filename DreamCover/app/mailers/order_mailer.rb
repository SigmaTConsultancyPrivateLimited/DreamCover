class OrderMailer < ApplicationMailer

  def order_email(user,time,invoice_id,cart,cart_total_price)
    # byebug
    @user_info = user
    @time = time
    @invoice_id = invoice_id
    @cart = cart
    @cart_total_price = cart_total_price
    mail(to:  user.email, subject: "Your Order On DreamCover is Confirmed")
  end


end




