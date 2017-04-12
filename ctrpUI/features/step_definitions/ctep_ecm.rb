require_relative '../support/home_page_obj'
require_relative '../support/po_left_menu_navigation_obj.rb'
require_relative '../support/ctep_ecm_po_obj'
require 'selenium-cucumber'


When(/^I Login into CTRP PO and Navigate to Org search screen$/) do
  step %[I navigate to "#{ENV['PO_APP']}"]
  step %[I enter "#{ENV['PO_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PO_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.pologin_id}"]
  step %[I click on element having id "#{HomePagePA.poaccept_disclaimer_id}"]
  step %[I click on element having id "#{PoLeftMenuNavigation.org_search_id}"]
  step %[I enter "FOX" into input field having id "#{CTEPECMPO.ctep_org_id}"]
  step %[I click on element having id "#{CTEPECMPO.search_btn}"]
  step %[I click on element having id "#{CTEPECMPO.po_org_curate_btn}"]
  step %[element having id "wwctrl_organization.name" should have text as "FoxHollow Technologies Inc"]

end

Given(/^I run the MOCK service for the JMS Notification$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The Org with Change Request section is updated$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Search for the Org "([^"]*)" and Change Requestion section should be displayed$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end



Given(/^Navigate to the ResearchOrganization section$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^The ResearchOrganization is updated$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Search for Org "([^"]*)" and navigate to the HealthCareFacility section$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The HealthCareFacility is updated$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

#@PA_HIGH  @PO @ECMUI @CTRPMICRO-ABC0

When(/^I Login into CTRP PO and Navigate to Person search screen$/) do
  step %[I navigate to "#{ENV['PO_APP']}"]
  step %[I enter "#{ENV['PO_USER_ID']}" into input field having id "#{HomePagePA.username_id}"]
  step %[I enter "#{ENV['PO_USER_PASS']}" into input field having id "#{HomePagePA.password_id}"]
  step %[I click on element having id "#{HomePagePA.pologin_id}"]
  step %[I click on element having id "#{HomePagePA.poaccept_disclaimer_id}"]
  step %[I click on element having id "#{PoLeftMenuNavigation.person_search_id}"]
end

And(/^Search for Person "([^"]*)" and navigate to the Person Information section$/) do |id|
  step %[I enter "#{id}" into input field having id "#{CTEPECMPO.ctep_person_id}"]
  step %[I click on element having id "#{CTEPECMPO.search_btn}"]
  step %[I click on element having id "#{CTEPECMPO.person_curate_id}"]
end

Then(/^The Person is updated with new values from CTEP$/) do |table|
  table.hashes.each do |arg|
    if arg["Existing First Name"] == 'Rosita'
      ele_text = get_element_attribute("xpath", "//input[@id='curateEntityForm_person_firstName']", "value")
      expect(ele_text.strip).to eq arg["New First Name"]
    end
  end
end

Then(/^The HealthCareProvider is updated with new values from CTEP$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The ClinicalResearchStaff is updated with new values from CTEP$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
