ENV["RACK_ENV"] ||= "test"

require 'capybara/dsl'
require 'bundler'
Bundler.require(:default, :test)


require File.expand_path("../../config/environment", __FILE__)

DatabaseCleaner.strategy = :truncation


RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
  c.include Capybara::DSL
end

Capybara.app = LittleShopApp
