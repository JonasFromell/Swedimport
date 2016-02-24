# Setup rspec for RSpec 4 settings
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

# Require support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Add 'app' directory to load path
$:.unshift File.expand_path("../../app", __FILE__)

# Run specs in random order
RSpec.configure do |config|
  config.order = "random"
end
