require_relative '../support/dataclinicaltrials_api_helper'
require_relative '../support/organization_helper'
require_relative '../support/ct_api_helper'
require_relative '../support/helper'
require 'json'
require 'rest-client'

#$dunit ||= false


Given(/^test I want to Import a trial with NCT ID NCT(\d+)$/) do |arg1|
  @url_import = 'https://clinicaltrials.gov/ct2/show/NCT03093480/xml'



  @response_body_json = Hash.from_xml(@url_import).to_json
  puts @response_body_json
  @trial_id = @response_body_json['TrialRegistrationConfirmation']['paTrialID']
  @nci_trial_id = @response_body_json['TrialRegistrationConfirmation']['nciTrialID']
  puts ''+@trial_id.to_s+@nci_trial_id.to_s


end

Then(/^test I want to verify the Lead Org Trial ID$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable

end
