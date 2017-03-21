require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/regulatory_information_obj'
require 'selenium-cucumber'



#@CTRPMICRO-16 & @CTRPMICRO-65
#

Given(/^I login into CTRP and search for a trial with NCI ID "([^"]*)"$/) do |arg1|
  step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  step %[I enter "#{arg1}" into input field having id "#{SearchTrial.trial_search_text_id}"]
  step %[I click on element having class "#{SearchTrial.trial_search_button_id}"]
  step %[I click on link having text "#{arg1}"]

  step %[I wait for 2 sec]

end

# Regulatory Information link in the left menu. Xpath was used because the tag does not have an ID assigned.
Given(/^I navigate to Regulatory Information screen$/) do
   step %[I click on element having xpath ".//*[@id='part_sites']/li[1]/a"]
end

Then(/^"([^"]*)" field is not displayed in Regulatory Information\(PA\) screen$/) do |arg1|
  step %[element having xpath ".//*[@id='countries']" should not be present]
  puts "#{arg1}"  "is not present in Regulatory Information screen."
end

# @CTRPMICRO-66

Then(/^new fields with options should be there$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  step %[element having id "drug" should be present]
  puts "drug is present in the RI"
end

# @CTRPMICRO-75

When(/^"([^"]*)" is "([^"]*)"$/) do |arg1, arg2|
  dropdown_list = $driver.find_element(id: 'approval')
  options = dropdown_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == 'Yes' }

end

Then(/^the description should be "([^"]*)"$/) do |arg1|
  step %[element having class "info" should be present]
end

# @CTRPMICRO-76

When(/^the field "([^"]*)" is "([^"]*)"$/) do |arg1, arg2|
  dropdown_list = $driver.find_element(id: 'drug')
  options = dropdown_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == 'Yes' }

end

# @CTRPMICRO-77

When(/^the dropdown "([^"]*)" is "([^"]*)"$/) do |arg1, arg2|
  dropdown_list = $driver.find_element(id: 'device')
  options = dropdown_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == 'Yes' }
  step %[I wait for 5 sec]
  dropdown_list = $driver.find_element(id: 'surveillance')
  options = dropdown_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == 'Yes' }
  step %[I wait for 2 sec]
end

# @CTRPMICRO-69

Given(/^I select "([^"]*)" for "([^"]*)" field$/) do |arg1, arg2|
  dropdown_list = $driver.find_element(id: 'device')
  options = dropdown_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == 'Yes' }
end


Then(/^the existing field "([^"]*)" should be updated to "([^"]*)"$/) do |arg1, arg2|
  step %[element having id "#{RegulatoryInformation.unapproved_uncleared_device_id}" should be present]
end

# @CTRPMICRO-70

Then(/^"([^"]*)" field should be visible$/) do |arg1|
  dropdown_list = $driver.find_element(id: 'delpostindid')
  options = dropdown_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == 'Yes' }
  puts "Test passed. " "#{arg1}"  " is visible"
end


# @CTRPMICRO-112

When(/^the dropdown "([^"]*)" value is "([^"]*)"$/) do |arg1, arg2|
  dropdown_list = $driver.find_element(id: 'device')
  options = dropdown_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == 'No' }
  step %[I wait for 20 sec]

end


Then(/^"([^"]*)" field should not be visible$/) do |arg1|


end


#@CTRPMICRO -159

When(/^"([^"]*)"$/) do |arg1|
  step %[I wait for 2 sec]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.drug_id}"]
  step %[I wait for 1 sec]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.device_id}"]
  step %[I wait for 1 sec]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.unapproveduncleared_device_id}"]
  step %[I wait for 1 sec]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.post_prior_to_us_fda_approval_id}"]
  step %[I wait for 1 sec]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.pediatric_postmarket_surveillance_id}"]
  step %[I wait for 1 sec]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.product_exported_fromthe_us_id}"]
  step %[I wait for 1 sec]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.fda_regulated_intervention_indicator_id}"]
  step %[I wait for 1 sec]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.section_801_indicator_id}"]
  step %[I wait for 1 sec]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.data_monitoring_committee_id}"]
  step %[I wait for 1 sec]
  step %[I click on element having xpath "#{RegulatoryInformation.regulatory_information_save_id}"]
  step %[I wait for 1 sec]
  step %[I click on element having xpath ".//*[@id='studyOverallStatusLink']"]
  step %[I wait for 1 sec]
  step %[I click on element having xpath ".//*[@id='part_sites']/li[1]/a"]
  step %[I wait for 1 sec]

end


Then(/^all the fields will have "([^"]*)" values$/) do |arg1|
  step %[element having xpath "#{RegulatoryInformation.drug_id_xpath}" should be present]
  step %[element having xpath "#{RegulatoryInformation.device_id_xpath}" should be present]
  step %[element having xpath "#{RegulatoryInformation.unapproved_uncleared_device_xpath}" should be present]
end
