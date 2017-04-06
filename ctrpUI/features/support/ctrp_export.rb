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
    flunk "Not found "
  end
end

Then(/^the field "([^"]*)" should be there$/) do |arg1|
  case arg1
    when 'oversight_info.fda_regulated_drug = Yes'
      @data_xml_export.search('clinical_study').each do |fda_regulated_drug|
        @fda_regulated_drug_xml = fda_regulated_drug.at('fda_regulated_drug').text
      end
      if @fda_regulated_drug_xml.nil?
        flunk "Not found "
      else
        assert_equal(@fda_regulated_drug_xml, 'Yes', 'Validating FDA Regulated Drug')
      end
    when 'oversight_info.fda_regulated_device = Yes'
      @data_xml_export.search('clinical_study').each do |fda_regulated_device|
        @fda_regulated_device_xml = fda_regulated_device.at('fda_regulated_device').text
      end
      if @fda_regulated_device_xml.nil?
        flunk "Not found "
      else
        assert_equal(@fda_regulated_device_xml, 'Yes', 'Validating FDA Regulated Device')
      end
    when 'oversight_info.post_prior_to_approval = Yes'
      @data_xml_export.search('clinical_study').each do |post_prior_to_approval|
        @post_prior_to_approval_xml = post_prior_to_approval.at('post_prior_to_approval').text
      end
      if @post_prior_to_approval_xml.nil?
        flunk "Not found "
      else
        assert_equal(@post_prior_to_approval_xml, 'Yes', 'Validating post_prior_to_approval')
      end
    when 'oversight_info.ped_postmarket_surv = Yes'
      @data_xml_export.search('clinical_study').each do |ped_postmarket_surv|
        @ped_postmarket_surv_xml = ped_postmarket_surv.at('ped_postmarket_surv').text
      end
      if @ped_postmarket_surv_xml.nil?
        flunk "Not found "
      else
        assert_equal(@ped_postmarket_surv_xml, 'Yes', 'Validating ped_postmarket_surv')
      end
    when 'oversight_info.exported_from_us = Yes'
      @data_xml_export.search('clinical_study').each do |exported_from_us|
        @exported_from_us_xml = exported_from_us.at('exported_from_us').text
      end
      if @exported_from_us_xml.nil?
        flunk "Not found "
      else
        assert_equal(@exported_from_us_xml, 'Yes', 'Validating exported_from_us')
      end
    else
      flunk 'Please choose correct case.'
  end
end

