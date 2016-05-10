Rails.application.routes.draw do
  # Let Grape handle our API endpoints
  mount Swedimport::API => '/'
end
