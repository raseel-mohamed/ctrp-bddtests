require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/eligibility_criteria_obj'
require 'selenium-cucumber'


#@PA_HIGH @FDAAA @UI @CTRPMICRO-92

Given(/^I login into CTRP and search for a trial having NCI ID "([^"]*)"$/) do |id|
  step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  step %[I enter "#{id}" into input field having id "#{EligiblityCriteria.identifier_id}"]
  step %[I click on element having class "#{EligiblityCriteria.search_class}"]

end

When(/^I click on an "([^"]*)" link$/) do |link_text|
  step %[I click on link having text "#{link_text}"]
end

Then(/^Gender field is required$/) do |table|
table.hashes.each do |row|
if(row[:ListOfValue].eql?('Male Female'))
a = row[:ListOfValue].split(" ")
step %[element having xpath "#{EligiblityCriteria.gender_male_xpath}" should have text as "#{a.first}"]
step %[element having xpath "#{EligiblityCriteria.gender_female_xpath}" should have text as "#{a.last}"]
end
if(row[:FieldName].eql?('Gender Field'))
  c = "Male"
  step %[I select "Male" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
  #p= "Female"
  #step %[I select "Female" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
end
end
end

#@CTRPMICRO-17

Given(/^I login into CTRP and search with NCI ID "([^"]*)"$/) do |id|
  step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  step %[I enter "#{id}" into input field having id "#{EligiblityCriteria.identifier_id}"]
  step %[I click on element having class "#{EligiblityCriteria.search_class}"]
end

When(/^I click on "([^"]*)" link$/) do |link_text|
  step %[I click on link having text "#{link_text}"]
end

Then(/^new fields with options should be there$/) do |table|
  table.hashes.each do |row|
   if(row[:ListOfValue].eql?('Yes No'))
     a = row[:ListOfValue].split(" ")
     step %[element having xpath "#{EligiblityCriteria.gender_base_true_xpath}" should have text as "#{a.first}"]
     step %[element having xpath "#{EligiblityCriteria.gender_base_false_xpath}" should have text as "#{a.last}"]
   end
  if(row[:FieldName].eql?('Gender Eligibility Description'))
    c = "Yes"
    step %[I select "Yes" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
    step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should not be present]

  end
  end
  end


#@PA_HIGH @FDAAA @UI @CTRPMICRO-93

Given(/^I login into CTRP and search for NCI ID "([^"]*)"$/) do |id|
  step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  step %[I enter "#{id}" into input field having id "#{EligiblityCriteria.identifier_id}"]
  step %[I click on element having class "#{EligiblityCriteria.search_class}"]
end
When(/^I click on the "([^"]*)" link$/) do |link_text|
  step %[I click on link having text "#{link_text}"]
end
When(/^Gender based study is Yes$/) do
  step %[I select "Male" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
  step %[I select "Female" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]


end
Then(/^Gender Based eligibility description is available$/) do
  step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should be present]
end

#@PA_HIGH @FDAAA @UI @CTRPMICRO-94

Given(/^I login into CTRP and search with a NCI ID "([^"]*)"$/) do |id|
  step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  step %[I enter "#{id}" into input field having id "#{EligiblityCriteria.identifier_id}"]
  step %[I click on element having class "#{EligiblityCriteria.search_class}"]
end
When(/^I click on a "([^"]*)" link$/) do |link_text|
  step %[I click on link having text "#{link_text}"]
end
When(/^Gender based study is No$/) do
  step %[I select "Female" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
  step %[I select "No" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
  step %[I select "Male" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
  step %[I select "No" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
  step %[I select "Both" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
end
Then(/^Gender Based eligibility description is not available$/) do
  step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should not be present]
end

#@PA_HIGH @FDAAA @UI @CTRPMICRO-99

Given(/^I registered a new Trial in Registration and login into CTRP and search with NCI ID "([^"]*)"$/) do |id|
  step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  step %[I enter "#{id}" into input field having id "#{EligiblityCriteria.identifier_id}"]
  step %[I click on element having class "#{EligiblityCriteria.search_class}"]
end
When(/^I click the "([^"]*)" link$/) do |link_text|
  step %[I click on link having text "#{link_text}"]
end
When(/^Gender based is No$/) do
  step %[I select "Male" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
  step %[I select "No" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
  step %[I select "Female" option by text from dropdown having id "#{EligiblityCriteria.gender_id}"]
  step %[I select "No" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]


end
Then(/^Gender eligibility description is not available$/) do
  step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should not be present]
end
