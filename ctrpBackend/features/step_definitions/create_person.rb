# require_relative '../support/organization_helper.rb'
# require_relative '../support/person_helper.rb'
# require_relative '../support/helper.rb'

Given(/^I want to create person with values$/) do |table|
  @person_prefix = table.rows_hash['prefix']
  @person_firstname = table.rows_hash['firstname']
  @person_middlename = table.rows_hash['middlename']
  @person_lastname = table.rows_hash['lastname']
  @person_suffix = table.rows_hash['suffix']
  @person_address_line1 = table.rows_hash['address_line1']
  @person_address_line2 = table.rows_hash['address_line2']
  @person_city = table.rows_hash['city']
  @person_state_or_province = table.rows_hash['state_or_province']
  @person_country = table.rows_hash['country']
  @person_postal_code = table.rows_hash['postal_code']
  @person_contact_email = table.rows_hash['contact_email']
  @person_contact_phone = table.rows_hash['contact_phone']
  @person_contact_fax = table.rows_hash['contact_fax']
  @person_status = table.rows_hash['status']
end

And(/^response body should include above created person values$/) do
  Person_helper.verify_person(@person_prefix, @person_firstname, @person_middlename, @person_lastname, @person_suffix, nil, @person_address_line1, @person_address_line2, @person_city, @person_state_or_province, @person_country, @person_postal_code, @person_contact_email, @person_contact_phone, @person_contact_fax, @id, @person_status, @response_body)
end

Given(/^a person exists with values$/) do |table|
  @person_prefix = table.rows_hash['prefix']
  @person_firstname = table.rows_hash['firstname']
  @person_middlename = table.rows_hash['middlename']
  @person_lastname = table.rows_hash['lastname']
  @person_suffix = table.rows_hash['suffix']
  @person_address_line1 = table.rows_hash['address_line1']
  @person_address_line2 = table.rows_hash['address_line2']
  @person_city = table.rows_hash['city']
  @person_state_or_province = table.rows_hash['state_or_province']
  @person_country = table.rows_hash['country']
  @person_postal_code = table.rows_hash['postal_code']
  @person_contact_email = table.rows_hash['contact_email']
  @person_contact_phone = table.rows_hash['contact_phone']
  @person_contact_fax = table.rows_hash['contact_fax']
  @person_status = table.rows_hash['status']

@service = 'POST'
headers = {:content_type => 'application/json', :accept => 'application/json'}
  @response, @response_code, @response_body, @id  = Person_helper.trigger_create_person_post(@service, 'create_person', ENV['user1'], ENV['user1_password'], headers, @person_prefix, @person_firstname, @person_middlename, @person_lastname, @person_suffix, @person_address_line1, @person_address_line2, @person_city, @person_state_or_province, @person_country, @person_postal_code, @person_contact_email, @person_contact_phone, @person_contact_fax, @person_status)
puts 'Response code for Created Person: ' + @response.code.to_s
@response_body = JSON.parse(@response.body)
@id = @response_body['id']
puts 'Person ID is: ' + @id.to_s
end

And(/^I want to update the person with values$/) do |table|
  @person_prefix = table.rows_hash['prefix']
  @person_firstname = table.rows_hash['firstname']
  @person_middlename = table.rows_hash['middlename']
  @person_lastname = table.rows_hash['lastname']
  @person_suffix = table.rows_hash['suffix']
  @person_address_line1 = table.rows_hash['address_line1']
  @person_address_line2 = table.rows_hash['address_line2']
  @person_city = table.rows_hash['city']
  @person_state_or_province = table.rows_hash['state_or_province']
  @person_country = table.rows_hash['country']
  @person_postal_code = table.rows_hash['postal_code']
  @person_contact_email = table.rows_hash['contact_email']
  @person_contact_phone = table.rows_hash['contact_phone']
  @person_contact_fax = table.rows_hash['contact_fax']
  @person_status = table.rows_hash['status']
end

And(/^response body should include above updated person values$/) do
  Person_helper.verify_person(@person_prefix, @person_firstname, @person_middlename, @person_lastname, @person_suffix, nil, @person_address_line1, @person_address_line2, @person_city, @person_state_or_province, @person_country, @person_postal_code, @person_contact_email, @person_contact_phone, @person_contact_fax, @id, @person_status, @response_body)
end