require_relative '../support/home_page_obj'
require_relative '../support/left_menu_navigation_obj'
require_relative '../support/design_details_obj'
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

Then(/^the update of an import should be "([^"]*)"$/) do |message|
  ele_text = get_element_text("xpath","//div[@class='confirm_msg']")
  expect(ele_text.strip).to eq message
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
  @conn.close if @conn
  p @return_db_value
  step %[I click on link having text "#{@return_db_value}"]
  step %[I select "CI, ctrpsubstractor" option by text from dropdown having id "#{CTRPIMPORTUI.assigned_to_id}"]
  tep %[I click on element having id "#{CTRPIMPORTUI.save_id}"]
  step %[I wait for 2 sec]
end


And(/^below field headers should match$/) do |table|
  # table is a table.hashes.keys # => [:CTRP field, :value]
  pending
end
