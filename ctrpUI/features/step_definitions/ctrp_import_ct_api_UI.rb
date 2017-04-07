require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/design_details_obj'
require_relative '../support/ctrp_import_ct_api_UI_obj'
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
  #from_UI = "Message. An update to trial(s) with identifiers NCT03093480 and NCI-2017-00380 has been made successfully."
  ele_text = get_element_text("xpath", "//div[@class='confirm_msg']")
  #@NCI_ID = ele_text.split("#{@NCT_ID}").last.split('has been made successfully.').first.gsub!("and","").gsub!(" ","")
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


And(/^I should be able to select the Trial$/) do
  begin
    @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
  rescue PGconn::Error => e
    @conn = e.message
  end
  @res = @conn.exec("select nci_id from study_protocol where nct_id = '"+"NCT03093480"+"' and status_code = '"+"ACTIVE"+"'")
  @return_db_value = @res.getvalue(0, 0).to_s
  p @return_db_value
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
  #step %[I scroll to element having xpath '//a[@onclick="displayTrialHistory(#{@return_db_value});"]']
  #step %[I click on element having text "#{@return_db_value}"]
  $driver.find_element(:xpath => "//a[contains(text(),'#{@return_db_value}')]").click

  step %[I wait for 5 sec]
end


And(/^below field headers should match$/) do |table|
  # table is a table.hashes.keys # => [:CTRP field, :value]
  step %[I switch to new window]
  table_data = table.rows_hash
  p table_data['Lead Organization Trial ID']

  actual_trial_category = table_data['Trial Category']
  actual_submission_source = table_data['Submission Source']
  actual_last_submitter = table_data['Last Submitter']
  actual_last_submitter_organization = table_data['Last Submitter Organization']
  actual_current_trial_status = table_data['Current Trial Status']
  #actual_current_trial_status_date = table_data['Current Trial Status Date']
  actual_current_trial_status_date = get_element_text("xpath","//span[text()='Current Trial Status Date:']/following-sibling::span").strip
  actual_processing_status = get_element_text("xpath","//span[text()='Processing Status:']/following-sibling::span").strip
  #actual_processing_status = table_data['Processing Status']
  #actual_lead_organization_trial_id = get_element_text("xpath","//span[text()=' Lead Organization Trial ID:']/following-sibling::span").strip
  actual_lead_organization_trial_id = get_element_text("xpath",".//*[@id='content']/div[1]/div[2]/div[1]/span[2]").strip
  actual_lead_organization = get_element_text("xpath", "//span[text()='Lead Organization:']/following-sibling::span").strip

  expected_trial_category = get_element_text("xpath", "//span[text()='Trial Category:']/following-sibling::span").strip
  expected_submission_source = get_element_text("xpath", "//span[text()='Submission Source:']/following-sibling::span").strip
  expected_last_submitter = get_element_text("xpath", "//span[text()='Last Submitter:']/following-sibling::span").strip
  expected_last_submitter_organization = get_element_text("xpath", "//span[text()='Last Submitter Organization:']/following-sibling::span").strip
  expected_current_trial_status = get_element_text("xpath", "//span[text()=' Current Trial Status:']/following-sibling::span").strip
  expected_current_trial_status_date = get_element_text("xpath", "//span[text()='Current Trial Status Date:']/following-sibling::span").strip
  expected_processing_status = get_element_text("xpath", "//span[text()='Processing Status:']/following-sibling::span").strip

  sleep(5)
  step %[I navigate to "https://clinicaltrials.gov/"]
  step %[I enter "#{@NCT_ID}" into input field having id "home-search-query"]
  step %[I click on element having xpath "//input[@value='Search']"]
  step %[I click on element having xpath "//a[contains(@title,'#{@NCT_ID}')]"]
  step %[I scroll to end of page]

  expected_lead_organization_trial_id = get_element_text("xpath", "//td[text()='Other Study ID Numbers:']/following-sibling::td").split("\n").first
  expected_lead_organization = get_element_text("xpath", "//td[text()='Responsible Party:']/following-sibling::td").strip

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


