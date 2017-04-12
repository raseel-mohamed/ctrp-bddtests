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

#@pa_high @FDAAA @pa @CTRPMICRO-230

And(/^I fill all details and click save in Outcome Measures section\(PA\)$/) do
  step %[I click on element having xpath "//span[@class = 'add']"]
  step %[I select "Primary" option by text from dropdown having xpath "#{OutcomeMeasures.outcome_measure_type_xpath}"]
  step %[I clear input field having id "#{OutcomeMeasures.title_id}"]
  step %[I enter "xyz" into input field having id "#{OutcomeMeasures.title_id}"]
  step %[I clear input field having id "#{OutcomeMeasures.time_frame_id}"]
  step %[I enter "abc" into input field having id "#{OutcomeMeasures.time_frame_id}"]
  step %[I click on element having xpath "//span[@class='save']"]
end

#@pa_high @FDAAA @pa @CTRPMICRO-232

And(/^I click on the Add button$/) do
  step %[I click on element having xpath "//span[@class = 'add']"]
end

Then(/^I verify validations for outcome measure type "([^"]*)",title "([^"]*)",time frame "([^"]*)",error message "([^"]*)"$/) do |outcome_measure_type, title, time_frame, error_message|
  data = {
      'outcome_measure_type'     => outcome_measure_type,
      'title'            => title,
      'time_frame'  => time_frame,
  }
  data.each do |key, value|
    data[key] = '' if data[key] == ''
  end

  outcome_measures_fill_data(data, error_message)
end
def outcome_measures_fill_data(data, error_message)
  step %[I select "#{data['outcome_measure_type']}" option by text from dropdown having id "#{OutcomeMeasures.outcome_measure_type_id}"]
  step %[I clear input field having id "#{OutcomeMeasures.title_id}"]
  step %[I enter "#{data['title']}" into input field having id "#{OutcomeMeasures.title_id}"]
  step %[I clear input field having id "#{OutcomeMeasures.time_frame_id}"]
  step %[I enter "#{data['time_frame']}" into input field having id "#{OutcomeMeasures.time_frame_id}"]
  step %[I click on element having xpath "//span[@class='save']"]
  check_element_text("xpath", error_message, "//ul[@class='errorMessage']", true)
end

#@pa_high @FDAAA @pa @CTRPMICRO-233

And(/^I enter all details except mandatory fields in Outcome Measures section\(PA\)$/) do
  step %[I click on element having xpath "//span[@class = 'add']"]
  step %[I select "--Select--" option by text from dropdown having id "#{OutcomeMeasures.outcome_measure_type_id}"]
  step %[I clear input field having id "#{OutcomeMeasures.title_id}"]
  step %[I enter "" into input field having id "#{OutcomeMeasures.title_id}"]
  step %[I clear input field having id "#{OutcomeMeasures.time_frame_id}"]
  step %[I enter "" into input field having id "#{OutcomeMeasures.time_frame_id}"]
  step %[I click on element having xpath "//span[@class='save']"]
end

Then(/^I verify below error messages are displayed in Outcome Measures page for mandatory fields$/) do |table|
  table.hashes.each_with_index do |item, index|
    xpath_ele = "(//ul[@class='errorMessage'])["+(index+1).to_s+"]"
    expect(get_element_text("xpath",xpath_ele).strip).eql?(item['error_message'])
  end
end
