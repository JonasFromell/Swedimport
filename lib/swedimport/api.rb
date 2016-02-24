module Swedimport
  class API < Grape::API
    # Version 1
    version 'v1', using: :header, vendor: 'Swedimport'

    # Serve under the `api` prefix
    prefix :api

    # Respond in JSON format
    format :json

    # API helpers
    helpers do
      # Access the application container
      def container
        Rails.application.container
      end

      # Access ROM
      def rom
        container['persistance.rom']
      end
    end

    # Categories resource
    resource :categories do
      get do
        rom.relation(:categories).to_a
      end
    end
  end
end
