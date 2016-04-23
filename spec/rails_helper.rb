# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'capybara/webkit'
Dir[Rails.root.join('spec/supports/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :request

  config.before :suite do
    Warden.test_mode!
  end

  config.after(:each) do
    Warden.test_reset!
  end

  config.include Capybara::DSL

  config.before(:each, type: :request) do
    default_url_options[:locale] = :en
  end

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  config.include FactoryGirl::Syntax::Methods

  config.before(:each) do
    DatabaseCleaner[:active_record].start
    DatabaseCleaner[:active_record].strategy = :truncation
  end

  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :truncation
    DatabaseCleaner[:active_record].start
    DatabaseCleaner[:active_record].clean
  end

  config.after(:each) do
    DatabaseCleaner[:active_record].clean
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end

