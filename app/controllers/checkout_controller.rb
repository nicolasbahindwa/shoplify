class CheckoutController < ApplicationController
    #skip_before_action :authenticate_user!
    # skip_before_action :verify_authenticity_token

    def create
        # product = Product.find(params[:id])
        # puts product.name
        # Stripe.api_key = Rails.application.credentials[:stripe][:secret]
    
        @session = Stripe::Checkout::Session.create({
        success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: cancel_url,
        customer: current_user.stripe_customer_id,
        payment_method_types: ['card'],
        line_items: @cart.collect {|item| item.to_builder.attributes! },
        # [{
        #     # currency: "usd",
        #     # name: product.name,
        #     # amount: product.price,
        #     price: product.stripe_price_id,
        #     quantity: 1
        # }],
        mode: 'payment',
        })
        # byebug
        respond_to do |format|
            format.js
        end
        # redirect_to root_path
    end


    def success
        if params[:session_id].present?
            #session.delete(:cart)
            session[:cart] = []# this line empty the shoping card (sassion based shopping cart)
            @session_with_expand = Stripe::Checkout::Session.retrieve({id: params[:session_id], expand: ["line_items"]})
            @session_with_expand.line_items.data.each do |line_item|
                product = Product.find_by(stripe_product_id: line_item.price.product)
                # product.increment!(:sales_count)
            end 

        else
            redirect_to cancel_path, alert: "No infomation is avalailable"

        end 
        
    end

    def failure

    end

    def cancel

    end
end