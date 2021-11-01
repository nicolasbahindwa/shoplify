class CheckoutController < ApplicationController

    def create
        product = Product.find(params[:id])
        puts product.name
        Stripe.api_key = Rails.application.credentials[:stripe][:secret]
        # @session = Stripe::Checkout::Session.create({
        #     payment_method_types: ['card'],
        #     line_items: [{
        #         name: product.name,
        #         amount: product.price,
        #         currency: "usd",
        #         quantity: 1
        #     }],
        #     mode: 'payment',
        #     success_url: root_path,
        #     cancel_url: root_path,
        # })
        @session = Stripe::Checkout::Session.create({
        success_url: root_url,
        cancel_url: root_url,
        payment_method_types: ['card'],
        line_items: [
            {currency: "usd", name: product.name, amount: product.price, quantity: 1},
        ],
        mode: 'payment',
        })
        # byebug
        respond_to do |format|
            format.js
        end
        # redirect_to root_path
    end

end