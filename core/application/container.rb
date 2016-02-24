require 'dry/component/container'

module Swedimport
  class Container < Dry::Component::Container
    configure do |config|
      config.root = Rails.root
      config.auto_register = 'lib'
    end

    load_paths!('core', 'lib')
  end
end
