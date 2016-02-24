source 'https://rubygems.org'

# Rails latest stable version
gem 'rails', '4.2.1'

# Use RSpec and Capybara for testing
group :test, :development do
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem 'capybara', '~> 2.4'
  gem 'fabrication', '~> 2.0'
end

group :development, :production do
  gem 'grape', '~> 0.14'

  # Persistance
  gem 'rom', '~> 1.0'
  gem 'rom-rails', '~> 0.6'
  gem 'rom-mongo', git: 'https://github.com/rom-rb/rom-mongo.git', branch: 'master'
end
