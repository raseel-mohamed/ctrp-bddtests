require_relative '../support/helper.rb'
require 'json'
require 'rest-client'

#@CTRPMICRO-199

Given(/^I send a GET request "([^"]*)" for ResearchOrganization$/) do |url|
  @response = RestClient.get(url)
  @ResearchOrganization_JSON = JSON.parse(@response)
end

Then(/^the response status code should be '(\d+)'$/) do |response_code|
  expect(@response.code).to eq response_code.to_i
end

Then(/^the JSON response should be as below for ResearchOrganization:$/) do |string|
  expect(@ResearchOrganization_JSON).to eq JSON.parse(string)
end


#@CTRPMICRO-204
Given(/^I send a GET request for "([^"]*)" for Organization$/) do |url|
  begin
    @response = RestClient.get(url)
    @Organization_JSON = JSON.parse(@response)
  rescue Exception => e
    response = e.response
    @response_JSON = JSON.parse(response)
  end

end

#@CTRPMICRO-204
Given(/^I send a GET request for "([^"]*)" for HealthCareFacility$/) do |url|
  @response = RestClient.get(url)
  @HealthCareFacility_JSON = JSON.parse(@response)
end

Given(/^I send a GET request for "([^"]*)" for Person$/) do |url|
  @response = RestClient.get(url)
  @Person_JSON = JSON.parse(@response)
end

Given(/^I send a GET request for "([^"]*)" for HealthCareProvider$/) do |url|
  @response = RestClient.get(url)
  @HealthCareProvider_JSON = JSON.parse(@response)
end

Given(/^I send a GET request for "([^"]*)" for ClinicalResearchStaff$/) do |url|
  @response = RestClient.get(url)
  @ClinicalResearchStaff_JSON = JSON.parse(@response)
end

Then(/^the JSON response should be displayed for Organization$/) do
  expect(@Organization_JSON['identifier']['extension']).to eq('OH029')
end

Then(/^the JSON response should be as below for HealthCareFacility:$/) do |string|
  expect(@HealthCareFacility_JSON).to eq JSON.parse(string)
end

Then(/^the JSON response should be displayed for Person$/) do
  expect(@Person_JSON['identifier']['extension']).to eq('513057')
end

Then(/^the JSON response should be as below for HealthCareProvider:$/) do |string|
  expect(@HealthCareProvider_JSON).to eq JSON.parse(string)
end

Then(/^the JSON response should be as below for ClinicalResearchStaff:$/) do |string|
  expect(@ClinicalResearchStaff_JSON).to eq JSON.parse(string)
end

Then(/^I should see error in JSON response for Organization$/) do
  expect(@response_JSON['code']).to eq 1
  expect(@response_JSON['type']).to eq 'CTEPEntException'
  expect(@response_JSON['message']).to  include('No such file or directory')
end