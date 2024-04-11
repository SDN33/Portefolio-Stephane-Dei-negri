braintree_credentials = Rails.application.credentials.braintree

Braintree::Configuration.environment = braintree_credentials[:environment].to_sym
Braintree::Configuration.merchant_id = braintree_credentials[:merchant_id]
Braintree::Configuration.public_key = braintree_credentials[:public_key]
Braintree::Configuration.private_key = braintree_credentials[:private_key]
