# require_relative '../support/organization_helper.rb'
# require_relative '../support/person_helper.rb'
# require_relative '../support/helper.rb'

Given(/^I want to create person with values$/) do |table|
  puts table
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



# When(/^I used the "([^"]*)" CTRP service with Content\-Type "([^"]*)" Accept "([^"]*)" for "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
#   @user2 = 'ctrpqatester1'
#   headers = {:content_type => arg2, :accept => arg3}
#   service = arg1.upcase
#   case service
#     when 'POST'
#       service_url = ENV['create_person']
#       @request_hash = Person_helper.prepare_create_person(@person_prefix, @person_firstname, @person_middlename, @person_lastname, @person_suffix, @person_address_line1, @person_address_line2, @person_city, @person_state_or_province, @person_country, @person_postal_code, @person_contact_email, @person_contact_phone, @person_contact_fax, @person_status)
#       payload_string = @request_hash.to_json.to_s
#       @response = Helper.request(service, service_url, @user2, payload_string, headers)
#       @response
#     when 'GET'
#       service_url = ENV['create_person']+@per_id.to_s
#       @response = Helper.request(service, service_url, @user2, nil, headers)
#       @response
#
#     else
#       flunk 'Please choose correct service. Provided service <<' + arg1 + '>> does not exist'
#   end
#   @response_code = @response.code
#   @response_body = JSON.parse(@response.body)
#   @per_id = @response_body['id']
#   puts 'Person ID is: ' + @per_id.to_s
# end


# Then(/^response to "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
#   expect(@response_code.to_s).to eq arg2
# end
#
# Then(/^response body should include above created Person values$/) do
#   Person_helper.verify_person(@person_prefix, @person_firstname, @person_middlename, @person_lastname, @person_suffix, @person_address_line1, @person_address_line2, @person_city, @person_state_or_province, @person_country, @person_postal_code, @person_contact_email, @person_contact_phone, @person_contact_fax, @person_status, @per_id, @response_body)
# end