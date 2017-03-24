require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/trial_ind_ide_obj'
#require 'selenium-cucumber'

And(/^I navigate to IND\/IDE screen$/) do
  step %[I click on element having xpath "//a[text()='Trial IND/IDE']"]
end
#@pa_high @FDAAA @pa @CTRPMICRO-29
When(/^I click on Add button$/) do
  step %[I click on element having xpath "#{TrialINDIDE.add_btn_xpath}"]
end

Then(/^Availability of Expanded Access should display a dropdown "([^"]*)" "([^"]*)" and "([^"]*)"$/) do |arg1,arg2,arg3|
  step %[element having xpath "#{TrialINDIDE.availability_of_Expanded_Access_yes_xpath}" should have text as "#{arg1}"]
  step %[element having xpath "#{TrialINDIDE.availability_of_Expanded_Access_no_xpath}" should have text as "#{arg2}"]
  step %[element having xpath "#{TrialINDIDE.availability_of_Expanded_Access_unknown_xpath}" should have text as "#{arg3}"]

end

#@pa_high @FDAAA @pa @CTRPMICRO-68

Then(/^"([^"]*)" label is displayed$/) do |arg|
  expect(get_element_text("xpath","#{TrialINDIDE.availability_of_Expanded_Access_xpath}").split("*").first.strip.chomp(":")).to eq(arg)
end

