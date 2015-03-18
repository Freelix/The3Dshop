Rails.configuration.stripe = {
  :publishable_key => 'pk_test_BewGJRnzWqSoROpG1nPavShr',
  :secret_key      => 'sk_test_LuvI7rog7UC6X0p1zzziw2fV'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]