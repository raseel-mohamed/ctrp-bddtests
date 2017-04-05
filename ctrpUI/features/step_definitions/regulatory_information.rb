require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/regulatory_information_obj'
require 'selenium-cucumber'

#@CTRPMICRO-16 & 65

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

When(/^I navigate to Regulatory Information screen$/) do
   step %[I click on element having xpath "#{LeftMenuNavigation.regulatory_information_xpath}"]
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

Then(/^the description should be "([^"]*)" for Post Prior to U.S. FDA Approval or Clearance$/) do |message|
  #step %[element having xpath "(//span[@class='info'])[1]" should be present]
  step %[element having xpath "(//span[@class='info'])[4]" should have text as "#{message}"]
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

# @CTRPMICRO-69 & 238

Given(/^I select (Yes|No) for Studies a U\.S\. FDA\-regulated Device Product field$/) do |condition|
  select_option_from_dropdown('id', 'text', condition, 'device')
  if condition == 'No'
    sleep(2)
    step %[I accept alert]
  end
end

Then(/^the existing field Pediatric Post-market Surveillance should be displayed$/) do
  step %[element having xpath "//label[@for='surveillance']" should be present]
end

Then(/^the existing field Delayed Posting Indicator should be updated to "([^"]*)" and displayed$/) do |field_label_name|
  step %[element having xpath "//label[@for='delpostindid']" should be present]
  ele_text = get_element_text("xpath","//label[@for='delpostindid']")
  p ele_text
  expect(ele_text.strip).to eq field_label_name
end

# @CTRPMICRO-70

Then(/^"([^"]*)" field should be visible$/) do |arg1|
  dropdown_list = $driver.find_element(id: 'delpostindid')
  options = dropdown_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == 'Yes' }
  puts "Test passed. " "#{arg1}"  " is visible"
end


# @CTRPMICRO-112

When(/^the dropdown "([^"]*)" value is "([^"]*)"$/) do
  step %[I select "No" option by text from dropdown having id "device"]
  step %[I wait for 2 sec]
end


#Then(/^"([^"]*)" field should not be visible$/) do

#  step %[I accept alert]
#  step %[element having xpath "//label[@for='surveillance']" should not be present]
#end


#@CTRPMICRO -159

And(/^I fill all details and click save in Regulatory Information page"$/) do
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.drug_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.device_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.unapproveduncleared_device_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.post_prior_to_us_fda_approval_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.pediatric_postmarket_surveillance_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.product_exported_fromthe_us_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.fda_regulated_intervention_indicator_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.section_801_indicator_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.data_monitoring_committee_id}"]
  step %[I click on element having xpath "#{RegulatoryInformation.regulatory_information_save_id}"]
end

#@CTRPMICRO-66

Then(/^newly added fields with options should be there$/) do |table|
  table.hashes.each do |row|
    if(row["List Of Value"].eql?('No or Yes'))
       split_value = row["List Of Value"].split("or")
       @no_val = split_value.first.strip
       @yes_val = split_value.last.strip
       step %[element having xpath "#{RegulatoryInformation.drug_id_xpath_no}" should have text as "#{@no_val}"]
       step %[element having xpath "#{RegulatoryInformation.drug_id_xpath_yes}" should have text as "#{@yes_val}"]
       step %[element having xpath "#{RegulatoryInformation.device_id_xpath_no}" should have text as "#{@no_val}"]
       step %[element having xpath "#{RegulatoryInformation.device_id_xpath_yes}" should have text as "#{@yes_val}"]
       step %[element having xpath "#{RegulatoryInformation.post_prior_xpath_no}" should have text as "#{@no_val}"]
       step %[element having xpath "#{RegulatoryInformation.post_prior_xpath_yes}" should have text as "#{@yes_val}"]
       step %[element having xpath "#{RegulatoryInformation.pediatric_xpath_no}" should have text as "#{@no_val}"]
       step %[element having xpath "#{RegulatoryInformation.pediatric_xpath_yes}" should have text as "#{@yes_val}"]
    end
  end
end

#@CTRPMICRO-239

Then(/^the fields should not be displayed$/) do |table|
  table.hashes.each do |field|
    if field['Field Name'] == "Unapproved/Uncleared Device"
      check_element_presence("id", "delpostindid", false)
    end
    if field['Field Name'] == "Pediatric Post-market Surveillance"
      check_element_presence("id", "surveillance", false)
    end
  end
end

#@CTRPMICRO-70 & 240

Given(/^I select (Yes|No) for Unapproved\/Uncleared Device field$/) do |condition|
  select_option_from_dropdown('id', 'text', condition, 'delpostindid')
  if condition == 'No'
    sleep(2)
    step %[I accept alert]
  end
end

Then(/^Post Prior to U\.S\. FDA Approval or Clearance field (should|should not) be visible$/) do |condition|
  if condition == 'should'
    step %[element having id "approval" should be present]
  end
  if condition == 'should not'
    check_element_presence('id', 'approval', false)
  end
end

#@CTRPMICRO-71 &112

When(/^FDA Regulated Intervention Indicator is (Yes|No)$/) do |condition|
  select_option_from_dropdown('id', 'text', condition, 'fdaindid')
  if condition == 'No'
    sleep(2)
    step %[I accept alert]
  end
end

Then(/^Section (\d+) Indicator field should|should not be visible$/) do |condition|
  if condition == 'should'
    step %[element having id "sec801id" should be present]
  end
  if condition == 'should not'
    check_element_presence('id', 'sec801id', false)
  end
end

#@CTRPMICRO-75

When(/^Post Prior to U\.S\. FDA Approval or Clearance is (Yes)$/) do |condition|
  select_option_from_dropdown('id', 'text', condition, 'approval')
end


#@CTRPMICRO-76

When(/^the field Studies a U\.S\. FDA\-regulated Drug Product is (Yes)$/) do |condition|
  select_option_from_dropdown('id', 'text', condition, 'drug')
end

Then(/^the description should be "([^"]*)" for Studies a U.S. FDA regulated Drug Product$/) do |message|
  step %[element having xpath "(//span[@class='info'])[1]" should have text as "#{message}"]
end

#@CTRPMICRO-77

When(/^the dropdown Pediatric Post\-market Surveillance is (Yes)$/) do |condition|
  step %[I select "Yes" option by text from dropdown having id "device"]
  select_option_from_dropdown('id', 'text', condition, 'surveillance')
end

Then(/^the description should be "([^"]*)" for Pediatric Post\-market Surveillance$/) do |message|
  step %[element having xpath "(//span[@class='info'])[5]" should have text as "#{message}"]
end

#@CTRPMICRO-159

And(/^I fill all details and click save in Regulatory Information page$/) do
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.drug_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.device_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.unapproveduncleared_device_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.post_prior_to_us_fda_approval_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.pediatric_postmarket_surveillance_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.product_exported_fromthe_us_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.fda_regulated_intervention_indicator_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.section_801_indicator_id}"]
  step %[I select "Yes" option by text from dropdown having id "#{RegulatoryInformation.data_monitoring_committee_id}"]
  step %[I click on element having xpath "//span[@class='save']"]
end