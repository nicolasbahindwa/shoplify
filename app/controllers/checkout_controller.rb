class CheckoutController < ApplicationController
    #skip_before_action :authenticate_user!
    # skip_before_action :verify_authenticity_token

    def create
        product = Product.find(params[:id])
        puts product.name
        # Stripe.api_key = Rails.application.credentials[:stripe][:secret]
    
        @session = Stripe::Checkout::Session.create({
        success_url: root_url + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: root_url,
        customer: current_user.stripe_customer_id,
        payment_method_types: ['card'],
        line_items: [{
            # currency: "usd",
            # name: product.name,
            # amount: product.price,
            price: product.stripe_price_id,
            quantity: 1
        }],
        mode: 'payment',
        })
        # byebug
        respond_to do |format|
            format.js
        end
        # redirect_to root_path
    end

end