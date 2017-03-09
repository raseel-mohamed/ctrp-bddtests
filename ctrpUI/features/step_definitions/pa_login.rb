require_relative '../support/home_page_obj'
require 'selenium-cucumber'

hp1 = HomePagePA.new
hp2 = HomePagePA.new
# Do Not Remove This File
# Add your custom steps here
# $driver is instance of webdriver use this instance to write your custom code

Given(/^I am in the PA home page/) do
  step %[I navigate to "#{ENV['PA_APP']}"]
end

Given(/^I am able to login to the system with valid user credentials/) do
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
end

