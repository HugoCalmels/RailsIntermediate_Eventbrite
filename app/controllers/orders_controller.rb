class OrdersController < ApplicationController

  def new
  end

  def create
  

@stripe_amount = 500
begin
  customer = Stripe::Customer.create({
  email: current_user.email,
  source: params[:stripeToken]
  })
  charge = Stripe::Charge.create({
  customer: customer.id,
  amount: @stripe_amount,
  description: "Réserver sa place",
  currency: 'eur',
  })
rescue Stripe::CardError => e
  flash[:error] = e.message

end
  redirect_to event_attendances_url(params[:event_id],params[:stripeToken])
  end


  private 


end
