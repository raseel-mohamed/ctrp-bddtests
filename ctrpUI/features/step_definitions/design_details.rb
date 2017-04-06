require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/design_details_obj'
require 'selenium-cucumber'

When(/^I go to "Design Details" section in PA app$/) do
  step %[I click on element having xpath "//a[text()='Design Details']"]
end

#@PA_HIGH @FDAAA @CTRPMICRO-26
#@PA_HIGH @FDAAA @CTRPMICRO-110

Then(/^Interventional Study Model is a required field$/) do
  step %[I select "Interventional" option by text from dropdown having id "#{DesignDetails.study_type_id}"]
  step %[element having xpath "#{DesignDetails.interventional_study_model_required_label_xpath}" should be present]
  step %[element having id "#{DesignDetails.interventional_study_model_id}" should be present]
end

Then(/^new fields with Interventional study Model and Primary Purpose should be there$/) do |table|
  table_data = table.hashes
  if table_data[0]["Field Name"].eql?("Interventional Study Model")
    verify_option_exists_in_dropdown("id", "#{DesignDetails.interventional_study_model_id}", table_data[0]["List of Value"], true)
  end

  if table_data[1]["Field Name"].eql?("Primary Purpose")
    verify_option_exists_in_dropdown("id", "#{DesignDetails.primary_purpose_id}", table_data[1]["List of Value"], true)
  end

end

#@PA_HIGH @FDAAA @CTRPMICRO-105

Then(/^I verify new field "([^"]*)" should be there$/) do |new_field_name|
   case new_field_name
     when "Model Description"
       step %[element having xpath "#{DesignDetails.model_desc_xpath}" should be present]
     when "Masking Description"
       step %[element having xpath "#{DesignDetails.masking_desc_xpath}" should be present]
     else
       puts "Please provide the correct Field name with case senstive to verify."
   end

end

#@PA_HIGH @FDAAA @CTRPMICRO-106 & 108 & 158

Then(/^these existing fields should be updated$/) do |table|
  table.hashes.each do |arg|
    if arg["Existing Field"] == 'Interventional Model'
      expect(get_element_text("xpath","#{DesignDetails.label_study_model_xpath}").split("*").first).to eq(arg["New Field"])
    end

    if arg["Existing Field"] == 'Subject'
      step %[element having xpath "#{DesignDetails.participant_xpath}" should be present]
    end

    if arg["Existing Field"] == 'Caregiver'
      step %[element having xpath "#{DesignDetails.careprovider_xpath}" should be present]
    end

    if arg["Existing Field"] == "Trial Phase 0"
      verify_option_exists_in_dropdown("id", "#{DesignDetails.trial_phase_id}", arg["New Field"], true)
    end

    if arg["Existing Field"] == "Masking Roles"
      expect(get_element_text("xpath","#{DesignDetails.masking_role_label_xpath}").split("*").first).to eq(arg["New Field"])
    end

  end
end

#@PA_HIGH @FDAAA @CTRPMICRO-109

Then(/^the conditional fields should be$/) do |table|
  table. hashes.each do |arg|
    if arg["Field Name"] == "No Masking"
      step %[I check the checkbox having id "#{DesignDetails.no_masking_id}"]
      step %[checkbox having id "#{DesignDetails.participant_id}" should be unchecked]
      step %[checkbox having id "#{DesignDetails.investigator_id}" should be unchecked]
      step %[checkbox having id "#{DesignDetails.caregiver_id}" should be unchecked]
      step %[checkbox having id "#{DesignDetails.outcomesassessor_id}" should be unchecked]
    end
  end
end

#@PA_HIGH @FDAAA @CTRPMICRO-107

Then(/^these existing fields should be removed$/) do |table|
  step %[element having xpath "#{DesignDetails.masking_xpath}" should not be present]
  step %[element having xpath "#{DesignDetails.study_classification_xpath}" should not be present]
  step %[element having xpath "#{OutcomeMeasures.safety_issue_xpath}" should not be present]
end

#@PA_HIGH @FDAAA @CTRPMICRO-224

Then(/^I verify validations for primary purpose "([^"]*)", trial phase "([^"]*)", Interventional Study Model "([^"]*)", Number of Arms "([^"]*)", masking "([^"]*)", allocation "([^"]*)", target enrollment "([^"]*)", error message "([^"]*)"$/) do |primary_purpose, trial_phase, interventional_study_model, number_of_arms, masking, allocation, target_enrollment, error_message|
  data = {
          'primary_purpose'     => primary_purpose,
          'trial_phase'            => trial_phase,
          'interventional_study_model'  => interventional_study_model,
          'number_of_arms'   => number_of_arms,
          'masking' => masking,
          'allocation' => allocation,
          'target_enrollment' => target_enrollment
        }

  # Replacing empty Strings with single quotes
  data.each do |key, value|
    data[key] = '' if data[key] == ''
  end

  design_details_fill_data(data, error_message)
end

def design_details_fill_data(data, error_message)
  step %[I select "#{data['primary_purpose']}" option by text from dropdown having id "#{DesignDetails.primary_purpose_id}"]
  step %[I select "#{data['trial_phase']}" option by text from dropdown having id "#{DesignDetails.trial_phase_id}"]
  step %[I select "#{data['interventional_study_model']}" option by text from dropdown having id "#{DesignDetails.interventional_study_model_id}"]
  step %[I clear input field having id "#{DesignDetails.number_of_arms_id}"]
  step %[I enter "#{data['number_of_arms']}" into input field having id "#{DesignDetails.number_of_arms_id}"]
  if(data['masking'].eql? 'Participant')
    step %[I check the checkbox having id "#{DesignDetails.participant_id}"]
  end
  step %[I select "#{data['allocation']}" option by text from dropdown having id "#{DesignDetails.allocation_id}"]
  step %[I clear input field having id "#{DesignDetails.enrollment_id}"]
  step %[I enter "#{data['target_enrollment']}" into input field having id "#{DesignDetails.enrollment_id}"]
  step %[I click on element having xpath "//span[@class='save']"]
  check_element_text("xpath", error_message, "//ul[@class='errorMessage']", true)
end

#@PA_HIGH @FDAAA @CTRPMICRO-225

Given(/^I fill all details and click save in Design Details page$/) do
  step %[I select "Treatment" option by text from dropdown having id "#{DesignDetails.primary_purpose_id}"]
  step %[I select "Early Phase I" option by text from dropdown having id "#{DesignDetails.trial_phase_id}"] #unless data['trial_phase'].nil?
  step %[I select "Single Group" option by text from dropdown having id "#{DesignDetails.interventional_study_model_id}"] #unless data['interventional_study_model'].nil?
  step %[I enter "2" into input field having id "#{DesignDetails.number_of_arms_id}"] #unless data[''].nil?
  step %[I check the checkbox having id "#{DesignDetails.participant_id}"] #unless data[''].nil?
  step %[I select "NA" option by text from dropdown having id "#{DesignDetails.allocation_id}"] #unless data['allocation'].nil?
  step %[I enter "1" into input field having id "#{DesignDetails.enrollment_id}"] #unless data[''].nil?
  step %[I click on element having xpath "//span[@class='save']"]
end

#@pa_high @FDAAA @pa @CTRPMICRO-235, 230, 227

Then(/^I verify confirm message "([^"]*)" is displayed$/) do |message|
  ele_text = get_element_text("xpath","//div[@class='confirm_msg']")
  expect(ele_text.strip).to eq message
end

#@PA_HIGH @FDAAA @CTRPMICRO-226

When(/^I enter all details except mandatory fields in Design Details page$/) do
  step %[I select "" option by text from dropdown having id "#{DesignDetails.primary_purpose_id}"]
  step %[I select "" option by text from dropdown having id "#{DesignDetails.trial_phase_id}"]
  step %[I select "" option by text from dropdown having id "#{DesignDetails.interventional_study_model_id}"]
  step %[I clear input field having id "#{DesignDetails.number_of_arms_id}"]
  #step %[I check the checkbox having id "#{DesignDetails.participant_id}"]
  step %[I select "" option by text from dropdown having id "#{DesignDetails.allocation_id}"]
  step %[I clear input field having id "#{DesignDetails.enrollment_id}"]
  step %[I click on element having xpath "//span[@class='save']"]
end

Then(/^I verify below error messages are displayed in Design Details page for mandatory fields$/) do |table|
  table.hashes.each_with_index do |item, index|
    #puts (index+1).to_s
    xpath_ele = "(//ul[@class='errorMessage'])["+(index+1).to_s+"]"
    expect(get_element_text("xpath",xpath_ele).strip).eql?(item['error_message'])
  end
end
