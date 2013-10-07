require 'rbconfig'
require 'cucumber/formatter/unicode'
require 'page-object'
require 'faker'
require 'data_magic'
require 'capybara'
require 'capybara/dsl'
require "capybara/cucumber"

Capybara.default_driver = :selenium
Capybara.app_host = "http://interviewstreet.com"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.run_server = false



World(Capybara)