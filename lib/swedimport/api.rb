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

    # Departments resource
    resource :departments do
      desc 'Returns a collection of top-level categories'
      get do
        rom.relation(:categories).find(parents: {exists: false}).to_a
      end

      desc 'Returns the sub-categories of a top-level category'
      params do
        requires :name, type: String, desc: 'Name of the top-level category'
      end
      route_param :name do
        get 'children' do
          rom.relation(:categories).find(parents: /^#{params[:name]}/i).to_a
        end
      end
    end

    # Categories resource
    resource :categories do
      desc 'Returns a category'
      params do
        requires :name, type: String, desc: 'The name of the category'
      end
      route_param :name do
        get do
          rom.relation(:category).find(name: /^#{params[:name]}/i).one!
        end
      end

      desc 'Returns the products of a category'
      params do
        requires :name, type: String, desc: 'The name of the category'
      end
      route_param :name do
        get 'products' do
          rom.relation(:products).find(category: /^#{params[:name]}/i).to_a
        end
      end
    end

    # Products resource
    resource :products do
      desc 'Returns a product'
      params do
        requires :name, type: String, desc: 'The name of the product'
      end
      route_param :name do
        get do
          rom.relation(:products).find(name: /^#{params[:name]}/i).one!
        end
      end

      desc 'Returns the variants of a product'
      params do
        requires :name, type: String, desc: 'The name of the product'
      end
      route_param :name do
        get 'variants' do
          rom.relation(:variants).find(parent: /^#{params[:name]}/i).to_a
        end
      end
    end

    # Variants resource
    resource :variants do
      desc 'Return a product variant'
      params do
        requires :sku, type: String, desc: 'The SKU of the product variant'
      end
      route_param :sku do
        get do
          rom.relation(:variants).find(_id: params[:sku]).one!
        end
      end
    end
  end
end
