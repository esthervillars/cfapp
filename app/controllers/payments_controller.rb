class PaymentsController < ApplicationController
  def create
  	token = params[:stripeToken]
  	@product = Product.find(params[:produce_id])
  	@user = current_user
  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      amount: (@product.price*100).to_i, # amount in cents, again
	      currency: "usd",
	      source: token,
	      description :params[:stripeEmail]
	    )

	    if charge.paid
	    	Order.create(
	    		user_id: @user.id,
	    		product_id: @product_id,
	    		total: @product.price
	    		)
	    	flash[:notice] = "Thank you for purchasing, Your payment was processed successfully."
	    end

	  rescue Stripe::CardError => e
	    # The card has been declined
	    body = e.json_body
    	err = body[:error]
    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  end
	  redirect_to product_path(@product)
	end
end
