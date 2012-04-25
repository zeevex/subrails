ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment", __FILE__)

Rails.backtrace_cleaner.remove_silencers!

require "capybara/rails"
require "capybara/rspec"
