if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_gvVxr3SP7Y9dwNa7JdHr1eYY
',
    secret_key: 'sk_test_1ZycPUBXJUAaQXU0ndqKSDwi'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]