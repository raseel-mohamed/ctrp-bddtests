require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/eligibility_criteria_obj'
require 'selenium-cucumber'

#@PA_HIGH @FDAAA @CTRPMICRO-17

Given(/^I login into CTRP and search with NCI ID "([^"]*)"$/) do |arg1|
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

When(/^I click on "([^"]*)" link$/) do |link_text|
  step %[I click on link having text "#{link_text}"]
end

#@PA_HIGH @FDAAA @CTRPMICRO-24

Then(/^I verify Gender Based and Gender Eligibility Description fields$/) do |table|
  table.hashes.each do |row|
    if(row["List Of Value"].eql?('Yes or No'))
      step %[I select "Male" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
      a = row["List Of Value"].split("or")
      step %[element having xpath "#{EligiblityCriteria.gender_base_true_xpath}" should have text as "#{a.first.strip}"]
      step %[element having xpath "#{EligiblityCriteria.gender_base_false_xpath}" should have text as "#{a.last.strip}"]
      step %[I select "Female" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
      step %[element having xpath "#{EligiblityCriteria.gender_base_true_xpath}" should have text as "#{a.first.strip}"]
      step %[element having xpath "#{EligiblityCriteria.gender_base_false_xpath}" should have text as "#{a.last.strip}"]
    end

    if(row["Field Name"].eql?('Gender Eligibility Description'))
      step %[I select "Male" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
      step %[I select "Yes" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
      step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should be present]

      step %[I select "Female" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
      step %[I select "Yes" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
      step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should be present]

      step %[I select "Male" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
      step %[I select "No" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
      step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should not be present]

      step %[I select "Female" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
      step %[I select "No" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
      step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should not be present]
    end
  end
  step %[I click on link having text "Logout"]
end

#@PA_HIGH @FDAAA @UI @CTRPMICRO-92 & #@PA_HIGH @FDAAA @UI @CTRPMICRO-97

Then(/^Gender Based field is required$/) do |table|
  step %[I select "Male" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
  step %[element having id "#{EligiblityCriteria.gender_base_id}" should be present]

  step %[I select "Female" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
  step %[element having id "#{EligiblityCriteria.gender_base_id}" should be present]

  step %[I select "All" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
  step %[element having id "#{EligiblityCriteria.gender_base_id}" should not be present]
  step %[I click on link having text "Logout"]
end

#@PA_HIGH @FDAAA @UI @CTRPMICRO-93 ,99 ,94 & 98

When(/^Sex is "([^"]*)"$/) do |sex|
  step %[I select "#{sex}" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
end

When(/^Gender based study is Yes$/) do
  step %[I select "Yes" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
end

#@PA_HIGH @FDAAA @UI @CTRPMICRO-94 & #@PA_HIGH @FDAAA @UI @CTRPMICRO-99

When(/^Gender based study is No$/) do
  step %[I select "No" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
end

Then(/^Gender Based eligibility description (is|is not) available$/) do |arg|
  if arg.eql?('is')
    sleep(2)
    step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should be present]
  else
    sleep(2)
    step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should not be present]
  end

end

#@PA_HIGH @FDAAA @UI @CTRPMICRO-99

When(/^Gender based is No$/) do
  step %[I select "Male" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
  step %[I select "No" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
  step %[I select "Female" option by text from dropdown having id "#{EligiblityCriteria.sex_id}"]
  step %[I select "No" option by text from dropdown having id "#{EligiblityCriteria.gender_base_id}"]
end

Then(/^Gender eligibility description is not available$/) do
  step %[element having xpath "#{EligiblityCriteria.gender_desc_xpath}" should not be present]
end

#@PA_HIGH @FDAAA @UI @CTRPMICRO-100 & @PA_HIGH @FDAAA @UI @CTRPMICRO-95

Then(/^Gender is changed to "([^"]*)"$/) do |arg|
  expect(get_element_text("xpath","#{EligiblityCriteria.gender_label_xpath}").split("*").first.strip).to eq(arg)
end

#@PA_HIGH @FDAAA @UI @CTRPMICRO-101 & @PA_HIGH @FDAAA @UI @CTRPMICRO-96
Then(/^these existing fields value should be updated$/) do |table|
  table.hashes.each do |arg|
    if arg.has_key? "New Field Value"
      expect(get_element_text("xpath", "//select[@id='gender']/option[4]")). to eq(arg["New Field Value"])
    end
  end
end
