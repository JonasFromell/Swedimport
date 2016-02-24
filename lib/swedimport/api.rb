module Swedimport
  class API < Grape::API
    # Version 1
    version 'v1', using: :header, vendor: 'Swedimport'

    # Serve under the `api` prefix
    prefix :api

    # Respond in JSON format
    format :json

    # Categories resource
    resource :categories do
      get do
        {ping: 'pong'}
      end
    end
  end
end
