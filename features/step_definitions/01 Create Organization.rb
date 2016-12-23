require 'json'
require 'rest-client'
require_relative '../support/organization_helper.rb'
require_relative '../support/helper.rb'

Given(/^I want to create Organization with values$/) do |table|
  @org_name = table.rows_hash['name']
  @org_address_line1 = table.rows_hash['address_line1']
  @org_address_line2 = table.rows_hash['address_line2']
  @org_city = table.rows_hash['city']
  @org_state_or_province = table.rows_hash['state_or_province']
  @org_country = table.rows_hash['country']
  @org_postal_code = table.rows_hash['postal_code']
  @org_contact_email = table.rows_hash['contact_email']
  @org_contact_phone = table.rows_hash['contact_phone']
  @org_contact_fax = table.rows_hash['contact_fax']
  @org_contact_tty = table.rows_hash['contact_TTY']
  @org_contact_url = table.rows_hash['contact_URL']
  @org_status = table.rows_hash['status']
end


When(/^I used the "([^"]*)" CTRP service with Content\-Type "([^"]*)" Accept "([^"]*)"$/) do |arg1, arg2, arg3|
  @user2 = 'ctrpqatester1'
  headers = {:content_type => arg2, :accept => arg3}
  service = arg1.upcase
  case service
  when 'POST'
    service_url = ENV['create_organization']
    @request_hash = Organization_helper.prepare_create_organization(@org_name, @org_address_line1, @org_address_line2, @org_city, @org_state_or_province, @org_country, @org_postal_code, @org_contact_email, @org_contact_phone, @org_contact_fax, @org_contact_tty, @org_contact_url, @org_status)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, @user2, payload_string, headers)
    @response
  when 'GET'
    service_url = ENV['create_organization']+@org_id.to_s
    @response = Helper.request(service, service_url, @user2, nil, headers)
    @response
    when 'PUT'
      service_url = ENV['update_organization']+@org_id.to_s
      @request_hash = Organization_helper.prepare_update_organization(@org_name_up, @org_address_line1, @org_address_line2, @org_city, @org_state_or_province, @org_country, @org_postal_code, @org_contact_email, @org_contact_phone, @org_contact_fax, @org_contact_tty, @org_contact_url,@org_id, @org_status)
      payload_string = @request_hash.to_json.to_s
      @response = Helper.request(service, service_url, @user2, payload_string, headers)
      @response
      puts @response.body
  else
    flunk 'Please choose correct service. Provided service <<' + arg1 + '>> does not exist'
  end
  @response_code = @response.code
  @response_body = JSON.parse(@response.body)
  @org_id = @response_body['id']
  puts 'Organization ID is: ' + @org_id.to_s
end


Then(/^response to "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  expect(@response_code.to_s).to eq arg2
end

Then(/^response body should include above created Organization values$/) do
  Organization_helper.verify_organization(@org_name, nil, @org_address_line1, @org_address_line2, @org_city, @org_state_or_province, @org_country, @org_postal_code, @org_contact_email, @org_contact_phone, @org_contact_fax, @org_contact_tty, @org_contact_url, @org_status, @org_id, @response_body)
end

Given(/^an Organization exist with values$/) do |table|
  @org_name = table.rows_hash['name']
  @org_address_line1 = table.rows_hash['address_line1']
  @org_address_line2 = table.rows_hash['address_line2']
  @org_city = table.rows_hash['city']
  @org_state_or_province = table.rows_hash['state_or_province']
  @org_country = table.rows_hash['country']
  @org_postal_code = table.rows_hash['postal_code']
  @org_contact_email = table.rows_hash['contact_email']
  @org_contact_phone = table.rows_hash['contact_phone']
  @org_contact_fax = table.rows_hash['contact_fax']
  @org_contact_tty = table.rows_hash['contact_TTY']
  @org_contact_url = table.rows_hash['contact_URL']
  @org_status = table.rows_hash['status']
  service_url = ENV['create_organization']
  @request_hash = Organization_helper.prepare_create_organization(@org_name, @org_address_line1, @org_address_line2, @org_city, @org_state_or_province, @org_country, @org_postal_code, @org_contact_email, @org_contact_phone, @org_contact_fax, @org_contact_tty, @org_contact_url, @org_status)
  payload_string = @request_hash.to_json.to_s
  headers = {:content_type => 'application/json', :accept => 'application/json'}
  @response = Helper.request('post', service_url, ENV['user1'], payload_string, headers)
  puts 'Response code for Created Organization: ' + @response.code.to_s
  @response_body = JSON.parse(@response.body)
  @org_id = @response_body['id']
  puts 'Organization ID is: ' + @org_id.to_s
end

Given(/^I want to update the organization with values$/) do |table|
  @org_name_up = table.rows_hash['name']
  @org_address_line1 = table.rows_hash['address_line1']
  @org_address_line2 = table.rows_hash['address_line2']
  @org_city = table.rows_hash['city']
  @org_state_or_province = table.rows_hash['state_or_province']
  @org_country = table.rows_hash['country']
  @org_postal_code = table.rows_hash['postal_code']
  @org_contact_email = table.rows_hash['contact_email']
  @org_contact_phone = table.rows_hash['contact_phone']
  @org_contact_fax = table.rows_hash['contact_fax']
  @org_contact_tty = table.rows_hash['contact_TTY']
  @org_contact_url = table.rows_hash['contact_URL']
  @org_status = table.rows_hash['status']
end


