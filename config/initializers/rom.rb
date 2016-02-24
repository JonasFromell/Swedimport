ROM::Rails::Railtie.configure do |config|
  # Default gateway set to MongoDB
  config.gateways[:default] = [:mongo, 'mongodb://127.0.0.1:27017/swedimport']
end
