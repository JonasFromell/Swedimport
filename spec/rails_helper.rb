# Set environment
ENV['RAILS_ENV'] ||= 'test'

# Require Rails environment
require File.expand_path("../../config/environment", __FILE__)

# Require rspec helper
require File.expand_path("../spec_helper.rb", __FILE__)

# Require rspec-rails
require 'rspec/rails'
