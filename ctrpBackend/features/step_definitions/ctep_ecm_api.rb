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
  @response = RestClient.get(url)
  @Organization_JSON = JSON.parse(@response)
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


Then(/^the JSON response should be as below for Organization:$/) do |string|
  expect(@Organization_JSON).to eq JSON.parse(string)
end

Then(/^the JSON response should be as below for HealthCareFacility:$/) do |string|
  expect(@HealthCareFacility_JSON).to eq JSON.parse(string)
end

Then(/^the JSON response should be as below for Person:$/) do |string|
  expect(@Person_JSON).to eq JSON.parse(string)
end

Then(/^the JSON response should be as below for HealthCareProvider:$/) do |string|
  expect(@HealthCareProvider_JSON).to eq JSON.parse(string)
end

Then(/^the JSON response should be as below for ClinicalResearchStaff:$/) do |string|
  expect(@ClinicalResearchStaff_JSON).to eq JSON.parse(string)
end