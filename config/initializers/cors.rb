Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # Adjust this to allow specific origins
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options, :head]
  end
end
