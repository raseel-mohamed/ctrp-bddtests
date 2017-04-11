require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/trial_ind_ide_obj'
require 'selenium-cucumber'

And(/^I navigate to IND\/IDE screen$/) do
  step %[I click on element having xpath "//a[text()='Trial IND/IDE']"]
end

#@pa_high @FDAAA @pa @CTRPMICRO-29
When(/^I click on Add button$/) do
  step %[I click on element having xpath "#{TrialINDIDE.add_btn_xpath}"]
end

Then(/^Availability of Expanded Access should display a dropdown "([^"]*)" "([^"]*)" and "([^"]*)"$/) do |arg1,arg2,arg3|
  step %[element having xpath "#{TrialINDIDE.ava_of_exp_acc_yes_xpath}" should have text as "#{arg1}"]
  step %[element having xpath "#{TrialINDIDE.ava_of_exp_acc_no_xpath}" should have text as "#{arg2}"]
  step %[element having xpath "#{TrialINDIDE.ava_of_exp_acc_unknown_xpath}" should have text as "#{arg3}"]

end

#@pa_high @FDAAA @pa @CTRPMICRO-68

Then(/^"([^"]*)" label is displayed$/) do |arg|
  expect(get_element_text("xpath","#{TrialINDIDE.ava_of_exp_acc_xpath}").split("*").first.strip.chomp(":")).to eq(arg)
end

#@pa_high @FDAAA @pa @CTRPMICRO-231

Then(/^Expanded Access Record label should be displayed$/) do
  step %[element having xpath "//label[@for='expandedAccessNctId']" should be present]
end


Then(/^the conditional field should be$/) do |table|
    table. hashes.each do |arg|
      if arg["Field Name"] == "Availability of Expanded Access"
        step %[I select "Yes" option by text from dropdown having xpath "//select[@id='group4']"]
        step %[I select "Yes" option by text from dropdown having xpath "//select[@id='group4']"]
      end
    end
  end


When(/^I select "([^"]*)" for Availability of Expanded Access dropdown$/) do |arg|
  step %[I select "#{arg}" option by text from dropdown having xpath "//select[@id='group4']"]
end

#@pa_high @FDAAA @pa @CTRPMICRO-235

When(/^I fill all details and click save in IND\/IDE\(PA\) screen$/) do
  step %[I select radio button having id "#{TrialINDIDE.ind_ide_type_id}"]
  step %[I clear input field having id "#{TrialINDIDE.number_id}"]
  step %[I enter "3" into input field having id "#{TrialINDIDE.number_id}"]
  step %[I select "CDRH" option by text from dropdown having id "#{TrialINDIDE.grantor_id}"]
  step %[I select "Investigator" option by text from dropdown having id "#{TrialINDIDE.holder_type_id}"]
  step %[I select "No" option by text from dropdown having id "#{TrialINDIDE.ava_of_ex_acc_id}"]
  step %[I click on element having xpath "//span[@class='save']"]
end

#@pa_high @FDAAA @pa @CTRPMICRO-237

When(/^I enter all details except mandatory fields in IND\/IDE\(PA\) screen$/) do
  step %[I clear input field having id "#{TrialINDIDE.number_id}"]
  step %[I enter "" into input field having id "#{TrialINDIDE.number_id}"]
  step %[I select "--Select--" option by text from dropdown having id "#{TrialINDIDE.grantor_id}"]
  step %[I select "-Select-" option by text from dropdown having id "#{TrialINDIDE.holder_type_id}"]
  step %[I click on element having xpath "//span[@class='save']"]
end

Then(/^I verify below error messages are displayed in IND\/IDE\(PA\) screen for mandatory fields$/) do |table|
  table.hashes.each_with_index do |item, index|
    xpath_ele = "(//ul[@class='errorMessage'])["+(index+1).to_s+"]"
    expect(get_element_text("xpath",xpath_ele).strip).eql?(item['error_message'])
  end
end

#@pa_high @FDAAA @pa @CTRPMICRO-236

Then(/^I verify validations for ind ide type "([^"]*)",number "([^"]*)",grantor "([^"]*)",holder type "([^"]*)",error message "([^"]*)"$/) do |ind_ide_type, number, grantor, holder_type, error_message|
  data = {
      'ind_ide_type' => ind_ide_type,
      'number' => number,
      'grantor' => grantor,
      'holder_type' => holder_type,
  }

  data.each do |key, value|
    data[key] = '' if data[key] == ''
  end

  trial_ind_ide_fill_data(data, error_message)
end

def trial_ind_ide_fill_data(data, error_message)

  if !(data['ind_ide_type'].nil? || data['ind_ide_type'].eql?(''))
    if data['ind_ide_type'].eql? 'IDE'
      step %[I select radio button having id "#{TrialINDIDE.ind_ide_type_id}"]
    elsif data['ind_ide_type'].eql? 'IND'
      step %[I select radio button having id "#{TrialINDIDE.ind_ind_type_id}"]
    end
  end

  step %[I clear input field having id "#{TrialINDIDE.number_id}"]
  step %[I enter "#{data['number']}" into input field having id "#{TrialINDIDE.number_id}"]
  step %[I select "#{data['grantor']}" option by text from dropdown having id "#{TrialINDIDE.grantor_id}"]
  step %[I select "#{data['holder_type']}" option by text from dropdown having id "#{TrialINDIDE.holder_type_id}"]
  step %[I click on element having xpath "//span[@class='save']"]

  if data['ind_ide_type'].eql?('')
    new_error_message = error_message.split('.')
    check_element_text("xpath", new_error_message.first.strip, "(//ul[@class='errorMessage'])[1]", true)
    check_element_text("xpath", new_error_message.last.strip, "(//ul[@class='errorMessage'])[2]", true)
  else
    check_element_text("xpath", error_message, "//ul[@class='errorMessage']", true)
  end

end

#@pa_high @FDAAA @pa @CTRPMICRO-234

Then(/^Expanded Access Record label should not be displayed$/) do
  step %[element having xpath "#{TrialINDIDE.exp_acc_rec_xpath}" should not be present]
end


Given(/^I login into CTRP and search for an Imported trial with NCI ID "([^"]*)"$/) do |arg1|
  step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  step %[I wait for 2 sec]
  step %[I enter "#{arg1}" into input field having id "#{SearchTrial.trial_search_text_id}"]
  step %[I click on element having class "#{SearchTrial.trial_search_button_id}"]
  step %[I click on link having text "#{arg1}"]
  step %[I wait for 2 sec]
end