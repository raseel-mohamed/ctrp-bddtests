require 'nokogiri'
require 'active_support'
require 'time'

Given(/^I click to view xml of "([^"]*)"$/) do |arg1|
  step %[I navigate to "#{ENV['REG_APP']}"]
  step %[I enter "#{ENV['REG_USER_ID']}" into input field having id "#{HomePageREG.username_id}"]
  step %[I enter "#{ENV['REG_USER_PASS']}" into input field having id "#{HomePageREG.password_id}"]
  step %[I click on element having id "#{HomePageREG.login_id}"]
  step %[I click on element having id "#{HomePageREG.accept_disclaimer_id}"]
  step %[I enter "#{arg1}" into input field having id "#{SearchTrialReg.trial_search_text_id}"]
  step %[I click on element having id "#{SearchTrialReg.trial_search_button_id}"]
  step %[I click on element having id "#{SearchTrialReg.trial_search_my_trial}"]
  # Remove columns for Action button to get visible
  $driver.find_element(:xpath, '//*[@id="row_wrapper"]/div[2]/button').click
  $driver.find_element(:xpath, '/html/body/ul[5]/li[2]').click
  $driver.find_element(:xpath, '/html/body/ul[5]/li[3]').click
  $driver.find_element(:xpath, '/html/body/ul[5]/li[4]').click
  $driver.find_element(:xpath, '/html/body/div[7]').click
  step %[I wait for 2 sec]
  $driver.find_element(:xpath, '//*[@id="row"]/tbody/tr/td[7]/div/button').click
  $driver.find_element(:xpath, '//*[@id="actmenu"]/li[5]/a').click
  step %[I switch to new window]
  @export_xml = $driver.page_source
  # puts @export_xml
  @data_xml_export = Nokogiri::XML(@export_xml)
  @data_xml_export.search('clinical_study').each do |valid_xml|
    @valid_xml = valid_xml.at('study_type').text
  end
  if @valid_xml.nil?
    flunk "***** Not able to generate XML. ***** "
  end
end

Then(/^the field "([^"]*)" should be there$/) do |arg1|
  case arg1
    when 'oversight_info.fda_regulated_drug = Yes'
      @fda_regulated_drug_xml = @data_xml_export.xpath("//clinical_study//oversight_info//fda_regulated_drug")
      if @fda_regulated_drug_xml.empty?
        flunk "Element fda_regulated_drug Not found"
      else
        assert_equal(@fda_regulated_drug_xml.text, 'Yes', 'Validating FDA Regulated Drug')
      end
    #  @data_xml_export.search('clinical_study').each do |fda_regulated_drug|
    #    @fda_regulated_drug_xml = fda_regulated_drug.at('fda_regulated_drug').text
    # # end
    #  if @fda_regulated_drug_xml.nil?
    #    flunk "Not found "
    #  else
    #    assert_equal(@fda_regulated_drug_xml, 'Yes', 'Validating FDA Regulated Drug')
    #  end
    #  end
    when 'oversight_info.fda_regulated_drug = No'
      @fda_regulated_drug_xml = @data_xml_export.xpath("//clinical_study//oversight_info//fda_regulated_drug")
      if @fda_regulated_drug_xml.empty?
        flunk "Element fda_regulated_drug Not found"
      else
        assert_equal(@fda_regulated_drug_xml.text, 'No', 'Validating FDA Regulated Drug')
      end

    when 'oversight_info.fda_regulated_device = Yes'
      @fda_regulated_device_xml = @data_xml_export.xpath("//clinical_study//oversight_info//fda_regulated_device")
      if @fda_regulated_device_xml.empty?
        flunk "Element @fda_regulated_device_xml Not found"
      else
        assert_equal(@fda_regulated_device_xml.text, 'Yes', 'Validating FDA Regulated Device')
      end

    when 'oversight_info.fda_regulated_device = No'
      @fda_regulated_device_xml = @data_xml_export.xpath("//clinical_study//oversight_info//fda_regulated_device")
      if @fda_regulated_device_xml.empty?
        flunk "Element @fda_regulated_device_xml Not found"
      else
        assert_equal(@fda_regulated_device_xml.text, 'No', 'Validating FDA Regulated Device')
      end

    when 'oversight_info.post_prior_to_approval = Yes'
      @post_prior_to_approval = @data_xml_export.xpath("//clinical_study//oversight_info//post_prior_to_approval")
      if @post_prior_to_approval.empty?
        flunk "Element @post_prior_to_approval Not found"
      else
        assert_equal(@post_prior_to_approval.text, 'Yes', 'Validating post_prior_to_approval')
      end

    when 'oversight_info.post_prior_to_approval = No'
      @post_prior_to_approval = @data_xml_export.xpath("//clinical_study//oversight_info//post_prior_to_approval")
      if @post_prior_to_approval.empty?
        flunk "Element @post_prior_to_approval Not found"
      else
        assert_equal(@post_prior_to_approval.text, 'No', 'Validating post_prior_to_approval')
      end

    when 'oversight_info.ped_postmarket_surv = Yes'
      @ped_postmarket_surv_xml = @data_xml_export.xpath("//clinical_study//oversight_info//ped_postmarket_surv")
      if @ped_postmarket_surv_xml.empty?
        flunk "Element @ped_postmarket_surv Not found"
      else
        assert_equal(@ped_postmarket_surv_xml.text, 'Yes', 'Validating @ped_postmarket_surv')
      end

    when 'oversight_info.ped_postmarket_surv = No'
      @ped_postmarket_surv_xml = @data_xml_export.xpath("//clinical_study//oversight_info//ped_postmarket_surv")
      if @ped_postmarket_surv_xml.empty?
        flunk "Element @ped_postmarket_surv Not found"
      else
        assert_equal(@ped_postmarket_surv_xml.text, 'No', 'Validating @ped_postmarket_surv')
      end

    when 'oversight_info.exported_from_us = Yes'
      @exported_from_us_xml = @data_xml_export.xpath("//clinical_study//oversight_info//exported_from_us")
      if @exported_from_us_xml.empty?
        flunk "Element @exported_from_us Not found"
      else
        assert_equal(@exported_from_us_xml.text, 'Yes', 'Validating @exported_from_us')
      end

    when 'oversight_info.exported_from_us = No'
      @exported_from_us_xml = @data_xml_export.xpath("//clinical_study//oversight_info//exported_from_us")
      if @exported_from_us_xml.empty?
        flunk "Element @exported_from_us Not found"
      else
        assert_equal(@exported_from_us_xml.text, 'No', 'Validating @exported_from_us')
      end

    when 'study_design.interventional_design.model_description'
      @model_description_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//model_description")
      if @model_description_xml.empty?
        flunk "Element model_description Not found"
      else
        assert_equal(@model_description_xml.text, 'Model Description has been added', 'Validating model_description')
      end

    when 'study_design.interventional_design.masking_description'
      @masking_description_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//masking_description")
      if @masking_description_xml.empty?
        flunk "Element masking_description Not found"
      else
        assert_equal(@masking_description_xml.text, 'Masking Description has been added', 'Validating masking_description')
      end

    when 'Eligibility.gender_based = Yes'
      @gender_based_xml = @data_xml_export.xpath("//clinical_study//eligibility//gender_based")
      if @gender_based_xml.empty?
        flunk "Element @gender_based Not found"
      else
        assert_equal(@gender_based_xml.text, 'Yes', 'Validating @gender_based')
      end

    when 'Eligibility.gender_based = No'
      @gender_based_xml = @data_xml_export.xpath("//clinical_study//eligibility//gender_based")
      if @gender_based_xml.empty?
        flunk "Element @gender_based Not found"
      else
        assert_equal(@gender_based_xml.text, 'No', 'Validating @gender_based')
      end

    when 'Eligibility.gender_description'
      @gender_description_xml = @data_xml_export.xpath("//clinical_study//eligibility//gender_description")
      if @gender_description_xml.empty?
        flunk "Element @gender_description Not found"
      else
        assert_equal(@gender_description_xml.text, 'Gender Eligibility Description has been added', 'Validating @gender_description')
      end

    when 'ind_info.expanded_access_nct_id'
      @expanded_access_nct_id_xml = @data_xml_export.xpath("//clinical_study//ind_info//expanded_access_nct_id")
      if @expanded_access_nct_id_xml.empty?
        flunk "Element @expanded_access_nct_id Not found"
      else
        assert_equal(@expanded_access_nct_id_xml.text, 'NCT03102580', 'Validating @expanded_access_nct_id')
      end

    when 'delayed_posting = Yes'
      @delayed_posting_xml = @data_xml_export.xpath("//clinical_study//delayed_posting")
      if @delayed_posting_xml.empty?
        flunk "Element delayed_posting Not found"
      else
        assert_equal(@delayed_posting_xml.text, 'Yes', 'Validating delayed_posting')
      end

    when 'delayed_posting = No'
      @delayed_posting_xml = @data_xml_export.xpath("//clinical_study//delayed_posting")
      if @delayed_posting_xml.empty?
        flunk "Element delayed_posting Not found"
      else
        assert_equal(@delayed_posting_xml.text, 'No', 'Validating delayed_posting')
      end

    else
      flunk 'Please choose correct case.'
  end
end

Then(/^the field "([^"]*)" should not be there$/) do |arg1|
  case arg1

    when 'oversight_info.fda_regulated_drug'
      @fda_regulated_drug_xml = @data_xml_export.xpath("//clinical_study//oversight_info//fda_regulated_drug")
      if @fda_regulated_drug_xml.empty?
        puts "fda_regulated_drug element not there as Expected"
      else
        flunk "Element fda_regulated_drug should not be there"
      end

    when 'oversight_info.fda_regulated_device'
      @fda_regulated_device_xml = @data_xml_export.xpath("//clinical_study//oversight_info//fda_regulated_device")
      if @fda_regulated_device_xml.empty?
        puts "fda_regulated_device element not there as Expected"
      else
        flunk "Element fda_regulated_device should not be there"
      end

    when 'oversight_info.post_prior_to_approval'
      @post_prior_to_approval_xml = @data_xml_export.xpath("//clinical_study//oversight_info//post_prior_to_approval")
      if @post_prior_to_approval_xml.empty?
        puts "post_prior_to_approval element not there as Expected"
      else
        flunk "Element post_prior_to_approval should not be there"
      end

    when 'oversight_info.ped_postmarket_surv'
      @ped_postmarket_surv_xml = @data_xml_export.xpath("//clinical_study//oversight_info//ped_postmarket_surv")
      if @ped_postmarket_surv_xml.empty?
        puts "ped_postmarket_surv element not there as Expected"
      else
        flunk "Element ped_postmarket_surv should not be there"
      end

    when 'oversight_info.exported_from_us'
      @exported_from_us_xml = @data_xml_export.xpath("//clinical_study//oversight_info//exported_from_us")
      if @exported_from_us_xml.empty?
        puts "exported_from_us element not there as Expected"
      else
        flunk "Element exported_from_us should not be there"
      end

    when 'ind_info.expanded_access_nct_id'
      @expanded_access_nct_id_xml = @data_xml_export.xpath("//clinical_study//ind_info//expanded_access_nct_id")
      if @expanded_access_nct_id_xml.empty?
        puts "expanded_access_nct_id element not there as Expected"
      else
        flunk "Element expanded_access_nct_id should not be there"
      end

    when 'ind_info.expanded_access_status'
      @expanded_access_status_xml = @data_xml_export.xpath("//clinical_study//ind_info//expanded_access_status")
      if @expanded_access_status_xml.empty?
        puts "expanded_access_status element not there as Expected"
      else
        flunk "Element expanded_access_status should not be there"
      end

    when 'delayed_posting'
      @delayed_posting_xml = @data_xml_export.xpath("//clinical_study//delayed_posting")
      if @delayed_posting_xml.empty?
        puts "@delayed_posting element not there as Expected"
      else
        flunk "Element @delayed_posting should not be there"
      end

    when 'study_design.interventional_design.model_description'
      @model_description_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//model_description")
      if @model_description_xml.empty?
        puts "Model description element not there as Expected"
      else
        flunk "Element model_description should not be there"
      end

    when 'study_design.interventional_design.masking_description'
      @masking_description_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//masking_description")
      if @masking_description_xml.empty?
        puts "Masking description element not there as Expected"
      else
        flunk "Element masking_description should not be there"
      end

    when 'Eligibility.gender_based'
      @gender_based_xml = @data_xml_export.xpath("//clinical_study//eligibility//gender_based")
      if @gender_based_xml.empty?
        puts "@gender_based element not there as Expected"
      else
        flunk "Element @gender_based should not be there"
      end

    when 'Eligibility.gender_description'
      @gender_description_xml = @data_xml_export.xpath("//clinical_study//eligibility//gender_description")
      if @gender_description_xml.empty?
        puts "@gender_description element not there as Expected"
      else
        flunk "Element @gender_description_xml should not be there"
      end

    when 'oversight_info.regulatory_authority'
      @regulatory_authority_xml = @data_xml_export.xpath("//clinical_study//oversight_info//regulatory_authority")
      if @regulatory_authority_xml.empty?
        puts "@regulatory_authority element not there as Expected"
      else
        flunk "Element @regulatory_authority should have been removed"
      end

    when 'study_design.endpoint'
      @endpoint_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//endpoint")
      if @endpoint_xml.empty?
        puts "@endpoint element not there as Expected"
      else
        flunk "Element @endpoint should have been removed"
      end

    when 'primary_outcome.outcome_safety_issue'
      @outcome_safety_issue_xml = @data_xml_export.xpath("//clinical_study//primary_outcome//outcome_safety_issue")
      if @outcome_safety_issue_xml.empty?
        puts "primary_outcome @outcome_safety_issue element not there as Expected"
      else
        flunk "Element primary_outcome @outcome_safety_issue should have been removed"
      end

    when 'secondary_outcome.outcome_safety_issue'
      @outcome_safety_issue_xml = @data_xml_export.xpath("//clinical_study//secondary_outcome//outcome_safety_issue")
      if @outcome_safety_issue_xml.empty?
        puts "secondary_outcome @outcome_safety_issue element not there as Expected"
      else
        flunk "Element secondary_outcome @outcome_safety_issue should have been removed"
      end

    when 'study_design.interventional_design.masking'
      @masking_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//masking")
      if @masking_xml.empty?
        puts "Masking element not there as Expected"
      else
        flunk "Element masking should have been removed"
      end

    when 'indinfo.has_expanded_access'
      @has_expanded_access_xml = @data_xml_export.xpath("//clinical_study//ind_info//has_expanded_access")
      if @has_expanded_access_xml.empty?
        puts "has_expanded_access element not there as Expected"
      else
        flunk "Element has_expanded_access should have been removed"
      end

    when 'expanded_access_status'
      @expanded_access_status_xml = @data_xml_export.xpath("//clinical_study//expanded_access_status")
      if @expanded_access_status_xml.empty?
        puts "expanded_access_status element not there as Expected"
      else
        flunk "Element expanded_access_status should have been removed"
      end

    else
      flunk 'Please choose correct case.'
  end
end


Then(/^the new value as "([^"]*)" should be there in "([^"]*)"$/) do |arg1, arg2|
  case arg1
    when 'Device Feasibility'
      @interventional_subtype_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//interventional_subtype")
      if @interventional_subtype_xml.empty?
        flunk "Element interventional_subtype Not found"
      else
        assert_equal(@interventional_subtype_xml.text, 'Device Feasibility', 'Validating interventional_subtype')
      end

    when 'Sequential Assignment'
      @assignment_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//assignment")
      if @assignment_xml.empty?
        flunk "Element assignment Not found"
      else
        assert_equal(@assignment_xml.text, 'Sequential Assignment', 'Validating assignment')
      end

    when 'Early Phase I'
      @phase_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//phase")
      if @phase_xml.empty?
        flunk "Element phase Not found"
      else
        assert_equal(@phase_xml.text, 'Early Phase I', 'Validating phase')
      end

    else
      flunk 'Please choose correct case.'
  end
end

Then(/^the field "([^"]*)" should be populated$/) do |arg1|
  case arg1
    when 'start_date_type'
      @start_date_type_xml = @data_xml_export.xpath("//clinical_study//start_date_type")
      if @start_date_type_xml.empty?
        flunk "Element start_date_type Not found"
      else
        assert_equal(@start_date_type_xml.text, 'Actual', 'Validating start_date_type')
      end
    when 'start_date'
      @start_date_xml = @data_xml_export.xpath("//clinical_study//start_date")
      if @start_date_xml.empty?
        flunk "Element start_date Not found"
      else
        assert_equal(@start_date_xml.text, '2014-07-15', 'Validating start_date')
      end
    when 'primary_compl_date_type'
      @primary_compl_date_type_xml = @data_xml_export.xpath("//clinical_study//primary_compl_date_type")
      if @primary_compl_date_type_xml.empty?
        flunk "Element primary_compl_date_type Not found"
      else
        assert_equal(@primary_compl_date_type_xml.text, 'Actual', 'Validating primary_compl_date_type')
      end
    when 'primary_compl_date'
      @primary_compl_date_xml = @data_xml_export.xpath("//clinical_study//primary_compl_date")
      if @primary_compl_date_xml.empty?
        flunk "Element primary_compl_date Not found"
      else
        assert_equal(@primary_compl_date_xml.text, '2015-07-16', 'Validating primary_compl_date')
      end
    when 'completion_date_type'
      @completion_date_type_xml = @data_xml_export.xpath("//clinical_study//last_follow_up_date_type")
      if @completion_date_type_xml.empty?
        flunk "Element completion_date_type Not found"
      else
        assert_equal(@completion_date_type_xml.text, 'Actual', 'Validating completion_date_type')
      end
    when 'completion_date'
      @completion_date_xml = @data_xml_export.xpath("//clinical_study//last_follow_up_date")
      if @completion_date_xml.empty?
        flunk "Element completion_date Not found"
      else
        assert_equal(@completion_date_xml.text, '2015-07-17', 'Validating completion_date')
      end

    else
      flunk 'Please choose correct case.'
  end
end


Then(/^the field "([^"]*)" with "([^"]*)" should be there$/) do |arg1, arg2|
  @args = arg1+arg2
  @arg = @args.to_s
  case @arg
    when 'study_design.interventional_design.no_maskingYes'
      @no_masking_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//no_masking")
      if @no_masking_xml.empty?
        flunk "Element no_masking Not found"
      else
        assert_equal(@no_masking_xml.text, 'Yes', 'Validating no_masking')
      end
    when 'study_design.interventional_design.no_maskingNo'
      @no_masking_xml = @data_xml_export.xpath("//clinical_study//study_design//interventional_design//no_masking")
      if @no_masking_xml.empty?
        flunk "Element no_masking Not found"
      else
        assert_equal(@no_masking_xml.text, 'No', 'Validating no_masking')
      end
    when 'eligibility.genderMale'
      @gender_xml = @data_xml_export.xpath("//clinical_study//eligibility//gender")
      if @gender_xml.empty?
        flunk "Element @gender Not found"
      else
        assert_equal(@gender_xml.text, 'Male', 'Validating @gender')
      end
    when 'eligibility.genderFemale'
      @gender_xml = @data_xml_export.xpath("//clinical_study//eligibility//gender")
      if @gender_xml.empty?
        flunk "Element @gender Not found"
      else
        assert_equal(@gender_xml.text, 'Female', 'Validating @gender')
      end
    when 'eligibility.genderAll'
      @gender_xml = @data_xml_export.xpath("//clinical_study//eligibility//gender")
      if @gender_xml.empty?
        flunk "Element @gender Not found"
      else
        assert_equal(@gender_xml.text, 'All', 'Validating @gender')
      end
    when 'indinfo.has_expanded_accessYes'
      @has_expanded_access_xml = @data_xml_export.xpath("//clinical_study//ind_info//has_expanded_access")
      if @has_expanded_access_xml.empty?
        flunk "Element @has_expanded_access Not found"
      else
        assert_equal(@has_expanded_access_xml.text, 'Yes', 'Validating @has_expanded_access')
      end
    when 'indinfo.has_expanded_accessNo'
      @has_expanded_access_xml = @data_xml_export.xpath("//clinical_study//ind_info//has_expanded_access")
      if @has_expanded_access_xml.empty?
        flunk "Element @has_expanded_access Not found"
      else
        assert_equal(@has_expanded_access_xml.text, 'No', 'Validating @has_expanded_access')
      end
    when 'indinfo.has_expanded_accessUnknown'
      @has_expanded_access_xml = @data_xml_export.xpath("//clinical_study//ind_info//has_expanded_access")
      if @has_expanded_access_xml.empty?
        flunk "Element @has_expanded_access Not found"
      else
        assert_equal(@has_expanded_access_xml.text, 'Unknown', 'Validating @has_expanded_access')
      end

    else
      flunk 'Please choose correct case.'
  end
end
