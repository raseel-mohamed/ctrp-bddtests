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
      step %[element having xpath "#{DesignDetails.masking_role_label_xpath}" should have text as "#{arg["New Field"]}"]
    end

  end
end

#@PA_HIGH @FDAAA @CTRPMICRO-109

Then(/^the conditional fields should be$/) do |table|
  table. hashes.each do |arg|
    if arg["Field Name"] == "No Masking"
      step %[I check the checkbox having id "#{DesignDetails.no_masking_id}"]

      step %[element having id "#{DesignDetails.participant_id }" should be disabled]
      step %[element having id "#{DesignDetails.investigator_id}" should be disabled]
      step %[element having id "#{DesignDetails.caregiver_id}" should be disabled]
      step %[element having id "#{DesignDetails.outcomesassessor_id}" should be disabled]
    end
  end
end

#@PA_HIGH @FDAAA @CTRPMICRO-107

Then(/^these existing fields should be removed$/) do |table|
  step %[element having xpath "#{DesignDetails.masking_xpath}" should not be present]
  step %[element having xpath "#{DesignDetails.study_classification_xpath}" should not be present]
end


