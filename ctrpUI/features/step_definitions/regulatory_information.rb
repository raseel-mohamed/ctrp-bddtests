require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require 'selenium-cucumber'

#@CTRPMICRO-16

Given(/^I login into CTRP and search for a trial with NCI ID "([^"]*)"$/) do |arg1|
  step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  step %[I wait for 10 sec]
end

Given(/^I navigate to Regulatory Information screen$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^"([^"]*)" field is not displayed in Regulatory Information\(PA\) screen$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
