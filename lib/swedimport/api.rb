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
        rom.relation(:categories).find(path: nil).to_a
      end

      desc 'Returns the sub-categories of a top-level category'
      params do
        requires :id, type: String, desc: 'ID of the top-level category'
      end
      route_param :id do
        get 'children' do
          rom.relation(:categories).find(path: /^\/#{params[:id]}/).to_a
        end
      end
    end

    # Categories resource
    resource :categories do
      desc 'Returns a category'
      params do
        requires :id, type: String, desc: 'The ID of the category'
      end
      route_param :id do
        get do
          rom.relation(:category).find(_id: params[:id]).one!
        end
      end

      desc 'Returns the products of a category'
      params do
        requires :id, type: String, desc: 'The ID of the category'
      end
      route_param :id do
        get 'products' do
          rom.relation(:products).find(category: params[:id]).to_a
        end
      end
    end

    # Products resource
    resource :products do
      desc 'Returns a product'
      params do
        requires :id, type: String, desc: 'The ID of the product'
      end
      route_param :id do
        get do
          rom.relation(:products).find(_id: params[:id]).one!
        end
      end

      desc 'Returns the variants of a product'
      params do
        requires :id, type: String, desc: 'The ID of the product'
      end
      route_param :id do
        get 'variants' do
          rom.relation(:variants).find(parent: params[:id]).to_a
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

    # Browse
    desc 'Browse department'
    params do
      requires :department_id, type: String, desc: 'The ID of the department'
    end
    get 'browse/department/:department_id' do
      rom.relation(:summaries).find(department: params[:department_id]).to_a
    end

    desc 'Browse category'
    params do
      requires :category_id, type: String, desc: 'The path to the category'
    end
    get 'browse/category/:category_id' do
      rom.relation(:summaries).find(category: /^\/#{params[:category_id]}/i).to_a
    end

    desc 'Browse by product properties'
    params do
      requires :properties, type: Array[String], desc: 'The properties to browse by'
    end
    get 'browse/properties' do
      rom.relation(:summaries).find(:properties.all => params[:properties]).to_a
    end

    desc 'Browse by variant attributes'
    params do
      requires :attributes, type: Array[String], desc: 'The variant attributes to browse by'
    end
    get 'browse/attributes' do
      rom.relation(:summaries).find(:"variants.attributes".all => params[:attributes]).to_a
    end
  end
end
