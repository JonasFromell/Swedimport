module IntegrationExampleGroup
  extend ActiveSupport::Concern

  included do
    # Set correct metadata
    metadata[:type] = :integration
  end

  RSpec.configure do |config|
    # Include in spec/integration/**/*_spec.rb
    config.include self,
      type: :integration,
      file_path: %r(spec/integration/)
  end
end
