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


When(/^I used the "([^"]*)" CTRP service with Content\-Type "([^"]*)" Accept "([^"]*)" for "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  headers = {:content_type => arg2, :accept => arg3}
  service = arg1.upcase
  type = arg4.upcase
  case service
    when 'POST'
      case type
        when 'ORGANIZATION'
          @response = Organization_helper.trigger_create_org_post(service, 'create_organization', ENV['user1'], headers, @org_name, @org_address_line1, @org_address_line2, @org_city, @org_state_or_province, @org_country, @org_postal_code, @org_contact_email, @org_contact_phone, @org_contact_fax, @org_contact_tty, @org_contact_url, @org_status)
        when 'PERSON'
          @response = Person_helper.trigger_create_person_post(service, 'create_person', ENV['user1'], headers, @person_prefix, @person_firstname, @person_middlename, @person_lastname, @person_suffix, @person_address_line1, @person_address_line2, @person_city, @person_state_or_province, @person_country, @person_postal_code, @person_contact_email, @person_contact_phone, @person_contact_fax, @person_status)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    when 'GET'
      case type
        when 'ORGANIZATION'
          @response = Organization_helper.trigger_get_org(service, 'create_organization', ENV['user1'], headers, @id)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    when 'PUT'
      case type
        when 'ORGANIZATION'
          @response = Organization_helper.trigger_update_org_put(service, 'update_organization', ENV['user1'], headers, @id, @org_name_update, @org_address_line1, @org_address_line2, @org_city, @org_state_or_province, @org_country, @org_postal_code, @org_contact_email, @org_contact_phone, @org_contact_fax, @org_contact_tty, @org_contact_url, @org_status)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    else
      flunk 'Please choose correct service. Provided service <<' + arg1 + '>> does not exist'
  end
  @response_code = @response.code
  @response_body = JSON.parse(@response.body)
  @id = @response_body['id']
  puts arg4 + ' ID is: ' + @id.to_s
end


Then(/^response to "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  expect(@response_code.to_s).to eq arg2
end

Then(/^response body should include above created Organization values$/) do
  Organization_helper.verify_organization(@org_name, nil, @org_address_line1, @org_address_line2, @org_city, @org_state_or_province, @org_country, @org_postal_code, @org_contact_email, @org_contact_phone, @org_contact_fax, @org_contact_tty, @org_contact_url, @org_status, @id, @response_body)
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

  headers = {:content_type => 'application/json', :accept => 'application/json'}
  @response = Organization_helper.trigger_create_org_post('post', 'create_organization', ENV['user1'], headers, @org_name, @org_address_line1, @org_address_line2, @org_city, @org_state_or_province, @org_country, @org_postal_code, @org_contact_email, @org_contact_phone, @org_contact_fax, @org_contact_tty, @org_contact_url, @org_status)
  puts 'Response code for Created Organization: ' + @response.code.to_s
  @response_body = JSON.parse(@response.body)
  @id = @response_body['id']
  puts 'Organization ID is: ' + @id.to_s
end

Given(/^I want to update the organization with values$/) do |table|
  @org_name_update = table.rows_hash['name']
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


