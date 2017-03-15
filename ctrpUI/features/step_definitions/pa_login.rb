require_relative '../support/home_page_obj'
require_relative '../support/helper_methods'
require 'selenium-cucumber'

Given(/^I am in the PA home page/) do
  navigate_to(ENV['PA_APP'])
end

Given(/^I am able to login to the system with valid user credentials/) do
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
end



