require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/design_details_obj'
require_relative '../support/ctrp_import_ct_api_UI_obj'
require 'time'
require 'active_support/all'
require 'nokogiri'
require 'selenium-cucumber'


Given(/^I am logged in to PA$/) do

  step %[I navigate to "#{ENV['PA_APP']}"]
  step %[I enter "#{ENV['PA_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PA_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.login_id}"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having id "importCtGovMenuOption"]
end

Given(/^I want to Import the trial with NCT ID "([^"]*)" in PA$/) do |arg1|
  begin
    @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
  rescue PGconn::Error => e
    @conn = e.message
  end
  @conn.exec("update study_protocol set status_code = 'INACTIVE' where nct_id in ('" + arg1 + "')")
  @conn.close if @conn

  step %[I clear input field having id "nctID"]
  step %[I enter "#{arg1}" into input field having id "nctID"]
  step %[I click on element having xpath "//span[@class='search']"]
  step %[I click on element having xpath "(//span[@class='search'])[2]"]
  @NCT_ID = arg1
end

Given(/^I am logged in to Registry$/) do
  step %[I navigate to "#{ENV['REG_APP']}"]
  step %[I enter "#{ENV['REG_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['REG_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having xpath "//button[@id='loginButton']"]
  step %[I click on element having id "#{HomePagePA.accept_disclaimer_id}"]
  step %[I click on element having xpath "//a[text()='Register Trial ']"]
  step %[I click on element having xpath "//a[text()='Industrial/Other']"]
end

And(/^I want to Import the trial with NCT ID "([^"]*)" in Registry$/) do |arg1|
  begin
    @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
  rescue PGconn::Error => e
    @conn = e.message
  end
  @conn.exec("update study_protocol set status_code = 'INACTIVE' where nct_id in ('" + arg1 + "')")
  @conn.close if @conn

  step %[I clear input field having id "nctID"]
  step %[I enter "#{arg1}" into input field having id "nctID"]
  step %[I click on element having xpath "//i[@class='fa-search']"]
  step %[I click on element having xpath "//span[@id='importText']"]
end

Then(/^the import should be "([^"]*)" in Registry$/) do |message|
  ele_text = get_element_text("xpath","//div[@class='alert alert-success']").split('A unique ').first
  expect(ele_text.strip).to eq message
end

And(/^I want to make an update to the Imported trial with NCT ID "([^"]*)"$/) do |arg1|
  step %[I clear input field having id "nctID"]
  step %[I enter "#{arg1}" into input field having id "nctID"]
  step %[I click on element having xpath "//span[@class='search']"]
  step %[I click on element having xpath "(//span[@class='search'])[2]"]
end

Then(/^I verify the update of an import message$/) do
  begin
    @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
  rescue PGconn::Error => e
    @conn = e.message
  end
  @res = @conn.exec("select nci_id from study_protocol where nct_id = '"+"NCT03093480"+"' and status_code = '"+"ACTIVE"+"'")
  @return_db_value = @res.getvalue(0, 0).to_s
  @conn.close if @conn
  expected_message = "Message. An update to trial(s) with identifiers NCT03093480 and #{@return_db_value} has been made successfully."
  ele_text = get_element_text("xpath","//div[@class='confirm_msg']")
  expect(ele_text.strip).to eq expected_message
end

Then(/^the import should be "([^"]*)" in PA$/) do |message|
  ele_text = get_element_text("xpath","//div[@class='confirm_msg']").split('A unique ').first
  expect(ele_text.strip).to eq message
end

Then(/^I should be able to View the log of Imported Trial$/) do
  ele_text = get_element_text("xpath", "//div[@class='confirm_msg']")
  @NCI_ID = ele_text.split('A unique NCI identifier').last.split('has been assigned to').first.strip

  step %[I click on element having xpath "//a[text()='View Log']"]

  step %[I enter "#{@NCI_ID}" into input field having id "nciIdentifier"]
  step %[I enter "#{@NCT_ID}" into input field having id "nctIdentifier"]
  step %[I click on element having xpath "//span[@class='search']"]
end

And(/^I should be able to search with the NCT ID "([^"]*)"$/) do |arg1|
  step %[I click on element having id "#{LeftMenuNavigation.search_trial_menu_id}"]
  step %[I enter "#{arg1}" into input field having id "#{SearchTrial.trial_search_text_id}"]
  step %[I click on element having class "#{SearchTrial.trial_search_button_id}"]
end


And(/^I should be able to select the Trial using NCT ID "([^"]*)"$/) do |nct_id|
  begin
    @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
  rescue PGconn::Error => e
    @conn = e.message
  end
  @res = @conn.exec("select nci_id from study_protocol where nct_id = '"+"#{nct_id}"+"' and status_code = '"+"ACTIVE"+"'")
  @return_db_value = @res.getvalue(0, 0).to_s
  @conn.close if @conn
  step %[I scroll to end of page]
  step %[I click on link having text "#{@return_db_value}"]
  step %[I scroll to element having id "#{CTRPIMPORTUI.assigned_to_id}"]
  step %[I select "CI, ctrpsubstractor" option by text from dropdown having id "#{CTRPIMPORTUI.assigned_to_id}"]
  step %[I click on element having class "#{CTRPIMPORTUI.save_class}"]
  sleep(2)
  step %[I scroll to end of page]
  step %[I click on element having xpath "//a[text()='Trial Validation']"]
  step %[I scroll to end of page]
  step %[I click on element having class "confirm"]
  sleep(2)
  step %[I click on element having id "ctGovImportLogMenuOption"]
  step %[I clear input field having id "nciIdentifier"]
  step %[I enter "#{@return_db_value}" into input field having id "nciIdentifier"]
  step %[I click on element having class "search"]
  step %[I wait for 5 sec]
  $driver.find_element(:xpath => "//a[contains(text(),'#{@return_db_value}')]").click
  step %[I switch to new window]
end

And(/^I navigate to Trial Validation page using NCT ID "([^"]*)"$/) do |nct_id|
  begin
    @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
  rescue PGconn::Error => e
    @conn = e.message
  end
  @res = @conn.exec("select nci_id from study_protocol where nct_id = '"+"#{nct_id}"+"' and status_code = '"+"ACTIVE"+"'")
  @return_db_value = @res.getvalue(0, 0).to_s
  @conn.close if @conn
  step %[I scroll to end of page]
  step %[I click on link having text "#{@return_db_value}"]
  step %[I scroll to element having id "#{CTRPIMPORTUI.assigned_to_id}"]
  step %[I select "CI, ctrpsubstractor" option by text from dropdown having id "#{CTRPIMPORTUI.assigned_to_id}"]
  step %[I click on element having class "#{CTRPIMPORTUI.save_class}"]
  sleep(2)
  step %[I scroll to end of page]
  step %[I click on element having xpath "//a[text()='Trial Validation']"]
end


And(/^below field headers should match$/) do |table|
  ct_env = ENV['ctgov'].to_s
  url_ctgov = ''+ ct_env + '/'+"#{@NCT_ID}" +'/xml'
  @response_ctgov = Helper.request('get', url_ctgov, '', '', nil, {})
  @data_xml_ctgov = Nokogiri::XML(@response_ctgov)
  @response_json_ctgov = Hash.from_xml(@response_ctgov).to_json
  @data_hash_ctgov = JSON.parse(@response_json_ctgov)

  expected_lead_organization_trial_id = @data_hash_ctgov['clinical_study']['id_info']['org_study_id']
  expected_lead_organization = @data_hash_ctgov['clinical_study']['sponsors']['lead_sponsor']['agency']

  table_data = table.rows_hash

  actual_trial_category = table_data['Trial Category']
  actual_submission_source = table_data['Submission Source']
  actual_last_submitter = table_data['Last Submitter']
  actual_last_submitter_organization = table_data['Last Submitter Organization']
  actual_current_trial_status = table_data['Current Trial Status']
  actual_current_trial_status_date = get_element_text("xpath","//span[text()='Current Trial Status Date:']/following-sibling::span").strip
  actual_processing_status = get_element_text("xpath","//span[text()='Processing Status:']/following-sibling::span").strip
  actual_lead_organization_trial_id = get_element_text("xpath","//span[text()=' Lead Organization Trial ID:']/following-sibling::span").strip
  actual_lead_organization = get_element_text("xpath", "//span[text()='Lead Organization:']/following-sibling::span").strip

  expected_trial_category = get_element_text("xpath", "//span[text()='Trial Category:']/following-sibling::span").strip
  expected_submission_source = get_element_text("xpath", "//span[text()='Submission Source:']/following-sibling::span").strip
  expected_last_submitter = get_element_text("xpath", "//span[text()='Last Submitter:']/following-sibling::span").strip
  expected_last_submitter_organization = get_element_text("xpath", "//span[text()='Last Submitter Organization:']/following-sibling::span").strip
  expected_current_trial_status = get_element_text("xpath", "//span[text()=' Current Trial Status:']/following-sibling::span").strip
  expected_current_trial_status_date = get_element_text("xpath", "//span[text()='Current Trial Status Date:']/following-sibling::span").strip
  expected_processing_status = get_element_text("xpath", "//span[text()='Processing Status:']/following-sibling::span").strip

  expect(expected_lead_organization_trial_id).to eq actual_lead_organization_trial_id
  expect(expected_lead_organization).to eq actual_lead_organization
  expect(expected_trial_category).to eq actual_trial_category
  expect(expected_submission_source).to eq actual_submission_source
  expect(expected_last_submitter).to eq actual_last_submitter
  expect(expected_last_submitter_organization).to eq actual_last_submitter_organization
  expect(expected_current_trial_status).to eq actual_current_trial_status
  expect(expected_current_trial_status_date).to eq actual_current_trial_status_date
  expect(expected_processing_status).to eq actual_processing_status

end


And(/^In the Trial Identification below fields should match$/) do |table|
  sleep(2)
  step %[I click on element having xpath "//a[contains(text(),'Trial Identification')]"]

  ct_env = ENV['ctgov'].to_s
  url_ctgov = ''+ ct_env + '/'+"#{@NCT_ID}" +'/xml'
  @response_ctgov = Helper.request('get', url_ctgov, '', '', nil, {})
  @data_xml_ctgov = Nokogiri::XML(@response_ctgov)
  @response_json_ctgov = Hash.from_xml(@response_ctgov).to_json
  @data_hash_ctgov = JSON.parse(@response_json_ctgov)
  table_data = table.rows_hash

  actual_abbreviated_trial = table_data['Abbreviated Trial?']
  actual_submission_source = table_data['Submission Source']
  actual_trial_type = get_element_text("xpath","//td[contains(text(),'Trial Type')]//following-sibling::td").strip
  actual_lead_organization_trial_id = get_element_text("xpath","//td[contains(text(),'Lead Organization Trial ID')]/following-sibling::td").strip
  actual_clinical_trials_gov_identifier = get_element_text("xpath","//td[contains(text(),'ClinicalTrials.gov Identifier')]/following-sibling::td").strip
  actual_other_identifier = get_element_text("xpath","//td[contains(text(),'Other Identifier')]/following-sibling::td").strip
  actual_last_verification_date = get_element_text("xpath","//td[contains(text(),'Last Verification Date')]/following-sibling::td").strip
  actual_official_title = get_element_text("xpath", "//td[contains(text(),'Official Title')]/following-sibling::td").strip

  expected_abbreviated_trial = get_element_text("xpath","//td[contains(text(),'Abbreviated Trial?')]/following-sibling::td").strip
  expected_submission_source = get_element_text("xpath","//td[contains(text(),'Submission Source')]/following-sibling::td").strip
  expected_trial_type = @data_hash_ctgov['clinical_study']['study_type']
  expected_lead_organzational_trial_id = @data_hash_ctgov['clinical_study']['id_info']['org_study_id']
  expected_clinical_trials_gov_identifier = @data_hash_ctgov['clinical_study']['id_info']['nct_id']
  expected_other_identifier = @data_hash_ctgov['clinical_study']['id_info']['secondary_id']
  expected_last_verification_date = @data_hash_ctgov['clinical_study']['location_countries']['verification_date']
  expected_official_title = @data_hash_ctgov['clinical_study']['official_title']

  expect(expected_abbreviated_trial).to eq actual_abbreviated_trial
  expect(expected_submission_source).to eq actual_submission_source
  expect(expected_trial_type).to eq actual_trial_type
  expect(expected_lead_organzational_trial_id).to eq actual_lead_organization_trial_id
  expect(expected_clinical_trials_gov_identifier).to eq actual_clinical_trials_gov_identifier
  expect(expected_other_identifier).to eq actual_other_identifier
  expect(expected_last_verification_date).to eq actual_last_verification_date
  expect(expected_official_title).to eq actual_official_title

end

And(/^In the Trial Validation below fields should match$/) do |table|
  ct_env = ENV['ctgov'].to_s
  url_ctgov = ''+ ct_env + '/'+"#{@NCT_ID}" +'/xml'
  #url_ctgov = "https://clinicaltrials.gov/ct2/show/NCT03093337/xml"
  @response_ctgov = Helper.request('get', url_ctgov, '', '', nil, {})
  @data_xml_ctgov = Nokogiri::XML(@response_ctgov)
  @response_json_ctgov = Hash.from_xml(@response_ctgov).to_json
  @data_hash_ctgov = JSON.parse(@response_json_ctgov)

  table_data = table.rows_hash

  actual_lead_organization_trial_id = get_element_text("xpath","//div[@id='identifierDiv_1']").strip
  actual_clinical_trials_gov_identifier = get_element_text("xpath","//div[@id='identifierDiv_2']").strip
  actual_other_identifier = get_element_text("xpath","//div[@id='identifierDiv_3']").strip
  actual_abbreviated_trial = table_data['Abbreviated Trial?']
  actual_official_title = get_element_text("xpath", "//textarea[@id='officialTitle']").strip
  actual_trial_phase = get_element_text("xpath", "//select[@id='gtdDTO.phaseCode']//option[@selected]").strip
  actual_primary_purpose = get_element_text("xpath","//select[@id='gtdDTO.primaryPurposeCode']//option[@selected]").strip
  actual_lead_organization = get_element_attribute("xpath","//input[@id='nciIdentifier']","value")
  actual_sponsor = get_element_attribute("xpath","//input[@id='gtdDTO.sponsorName']","value")

  expected_lead_organzational_trial_id = @data_hash_ctgov['clinical_study']['id_info']['org_study_id']
  expected_clinical_trials_gov_identifier = @data_hash_ctgov['clinical_study']['id_info']['nct_id']
  expected_other_identifier = @data_hash_ctgov['clinical_study']['id_info']['secondary_id']
  expected_abbreviated_trial = get_element_text("xpath","//span[contains(text(),'Abbreviated Trial?')]/parent::td/following-sibling::td").strip
  expected_official_title = @data_hash_ctgov['clinical_study']['official_title']
  expected_trial_phase = @data_hash_ctgov['clinical_study']['phase'].gsub!('/','')
  expected_primary_purpose = @data_hash_ctgov['clinical_study']['study_design_info']['primary_purpose']
  expected_lead_organization = @data_hash_ctgov['clinical_study']['sponsors']['lead_sponsor']['agency']
  expected_sponsor = @data_hash_ctgov['clinical_study']['sponsors']['lead_sponsor']['agency']

  expect(expected_lead_organzational_trial_id).to eq actual_lead_organization_trial_id
  expect(expected_clinical_trials_gov_identifier).to eq actual_clinical_trials_gov_identifier
  expect(expected_other_identifier).to eq actual_other_identifier
  expect(expected_abbreviated_trial).to eq actual_abbreviated_trial
  expect(expected_official_title).to eq actual_official_title
  expect(expected_trial_phase).to eq actual_trial_phase
  expect(expected_primary_purpose).to eq actual_primary_purpose
  expect(expected_lead_organization).to eq actual_lead_organization
  expect(expected_sponsor).to eq actual_sponsor

end