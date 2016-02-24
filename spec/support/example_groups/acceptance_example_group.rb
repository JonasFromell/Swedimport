module AcceptanceExampleGroup
  extend ActiveSupport::Concern

  # Include route helpers
  include Rails.application.routes.url_helpers
  include Rails.application.routes.mounted_helpers

  # Set default host
  Rails.application.routes.default_url_options[:host] ||= "www.example.org"

  included do
    # Set correct metadata
    metadata[:type] = :acceptance
  end

  RSpec.configure do |config|
    # Include in spec/acceptance/**/*_spec.rb
    config.include self,
      type: :acceptance,
      file_path: %r(spec/acceptance/)

    # Alias methods
    config.alias_example_group_to :feature,
      capybara_feature: true,
      type: :acceptance

    config.alias_example_to :scenario
  end
end
