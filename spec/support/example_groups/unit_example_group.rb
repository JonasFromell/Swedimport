module UnitExampleGroup
  extend ActiveSupport::Concern

  included do
    # Set correct metadata
    metadata[:type] = :unit
  end

  RSpec.configure do |config|
    # Include in spec/unit/**/*_spec.rb
    config.include self,
      type: :unit,
      file_path: %r(spec/unit/)
  end
end
