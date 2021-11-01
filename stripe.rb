require 'stripe'
Stripe.api_key = 'sk_test_51JqIimFrmiu6jSMswUc2G4uLsXbRbi81N3DRqVKAjmWptok6ZbNnJ4aQepmUvtRQ3zMOqOC9wozyUZnR4tHnSSzx00pvw4GHg3'

Stripe::Checkout::Session.create({
  success_url: 'https://example.com/success',
  cancel_url: 'https://example.com/cancel',
  payment_method_types: ['card'],
  line_items: [
    {price: 'price_H5ggYwtDq4fbrJ', quantity: 2},
  ],
  mode: 'payment',
})