require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/outcome_measures_obj'
require 'selenium-cucumber'

#@PA_HIGH @PA @FDAAA @CTRPMICRO-25 & 27

When(/^I go to Outcome Measures section in PA app$/) do
  step %[I click on element having xpath "//a[text()='Outcome Measures']"]
end
Then(/^for the Outcome measures table these columns should be removed$/) do |table|
  step %[element having xpath "#{OutcomeMeasures.safety_issue_table_xpath}" should not be present]
end
Then(/^I click Edit for one of the Outcome Measures$/) do
  step %[I click on element having xpath "#{OutcomeMeasures.edit_xpath}"]
end
