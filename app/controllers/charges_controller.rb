class ChargesController < ApplicationController
 
  def new
  end

  def create
    # The "premium plan must first be created either 
    # @https://dashboard.stripe.com/plans 
    # or from the application like so:
    
    # require "stripe"
    # Stripe.api_key = "Rails.configuration.stripe[:secret_key]"
    # Stripe::Plan.create(
    # :amount => 1500,
    # :interval => 'month',
    # :name => 'Amazing Gold Plan',
    # :currency => 'usd',
    # :id => 'name of plan, in this case "premium"'
    # )
    
    # Creates a Stripe Customer object, for associating
    # with the charge
  
    customer = Stripe::Customer.create(
      plan:  "premium", 
      email: current_user.email,
      card: params[:stripeToken]
    )


    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    current_user.role = :premium
    current_user.save!
    redirect_to root_path 


    
    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
