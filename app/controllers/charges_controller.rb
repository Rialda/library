class ChargesController < ApplicationController

  def new
    @mycart=Cart.where(:line_no=>current_user.id)
end

def create

@mycart=Cart.where(:line_no=>current_user.id)

 @total = (@mycart.total*100).round(-1)
 @total=@mycart.to_i

 customer = Stripe::Customer.create(
   :email => params[:stripeEmail],
   :source  => params[:stripeToken]
 )

 charge = Stripe::Charge.create(
   :customer    => customer.id,
   :amount      => @total,
   :description => 'bookstore',
   :currency    => 'bam'
 )


rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
