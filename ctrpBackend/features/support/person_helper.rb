
class Person_helper

  @error_string = ' does not match'

def self.load_person_templates(type)
  location = "#{File.dirname(__FILE__)}/../../../data/person_template.json"
  whole_json = JSON(IO.read(location))
  whole_json[type]
end

  def self.prepare_create_person(prefix, firstname, middlename, lastname, suffix, address_line1, address_line2, city, state_or_province, country, postal_code, contact_email, contact_phone, contact_fax, status)
    @request_hash = load_person_templates('create_person')
    @request_hash['prefix'] = prefix
    @request_hash['firstName'] = firstname
    @request_hash['middleName'] = middlename
    @request_hash['lastName'] = lastname
    @request_hash['suffix'] = suffix
    @request_hash['address']['line1'] = address_line1
    @request_hash['address']['line2'] = address_line2
    @request_hash['address']['city'] = city
    @request_hash['address']['stateOrProvince'] = state_or_province
    @request_hash['address']['country'] = country
    @request_hash['address']['postalcode'] = postal_code
    @request_hash['contact'][0]['value'] = contact_email
    @request_hash['contact'][1]['value']= contact_phone
    @request_hash['contact'][2]['value'] = contact_fax
    @request_hash['status'] = status
    @request_hash
  end

  def self.prepare_update_person(prefix, firstname, middlename, lastname, suffix, address_line1, address_line2, city, state_or_province, country, postal_code, contact_email, contact_phone, contact_fax, status)
    @request_hash = load_person_templates('create_person')
    @request_hash['prefix'] = prefix
    @request_hash['firstName'] = firstname
    @request_hash['middleName'] = middlename
    @request_hash['lastName'] = lastname
    @request_hash['suffix'] = suffix
    @request_hash['address']['line1'] = address_line1
    @request_hash['address']['line2'] = address_line2
    @request_hash['address']['city'] = city
    @request_hash['address']['stateOrProvince'] = state_or_province
    @request_hash['address']['country'] = country
    @request_hash['address']['postalcode'] = postal_code
    @request_hash['contact'][0]['value'] = contact_email
    @request_hash['contact'][1]['value']= contact_phone
    @request_hash['contact'][2]['value'] = contact_fax
    @request_hash['status'] = status
    @request_hash
  end

  def self.trigger_create_person_post(service, service_url_method, username, password,headers, person_prefix, person_firstname, person_middlename, person_lastname, person_suffix, person_address_line1, person_address_line2, person_city, person_state_or_province, person_country, person_postal_code, person_contact_email, person_contact_phone, person_contact_fax, person_status)
    service_url = ENV[service_url_method]
    @request_hash = prepare_create_person(person_prefix, person_firstname, person_middlename, person_lastname, person_suffix, person_address_line1, person_address_line2, person_city, person_state_or_province, person_country, person_postal_code, person_contact_email, person_contact_phone, person_contact_fax, person_status)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username,password, payload_string, headers)
    @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    @id = @response_body['id']
    puts ' ID is: ' + @id.to_s
    return @response, @response_code, @response_body, @id
  end

  def self.trigger_get_person(service, service_url_method, username, password,headers, person_id)
    service_url = ENV[service_url_method] + person_id.to_s
    @response = Helper.request(service, service_url, username,password, nil, headers)
    @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    @id = @response_body['id']
    puts ' ID is: ' + @id.to_s
    return @response, @response_code, @response_body, @id
  end

  def self.trigger_update_person_post(service, service_url_method, username, password,headers,person_id, person_prefix, person_firstname, person_middlename, person_lastname, person_suffix, person_address_line1, person_address_line2, person_city, person_state_or_province, person_country, person_postal_code, person_contact_email, person_contact_phone, person_contact_fax, person_status)
    service_url = ENV[service_url_method]+person_id.to_s
    @request_hash = prepare_update_person(person_prefix, person_firstname, person_middlename, person_lastname, person_suffix, person_address_line1, person_address_line2, person_city, person_state_or_province, person_country, person_postal_code, person_contact_email, person_contact_phone, person_contact_fax, person_status)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username,password, payload_string, headers)
    @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    @id = @response_body['id']
    puts ' ID is: ' + @id.to_s
    return @response, @response_code, @response_body, @id
  end

  def self.verify_person(prefix, firstname, middlename, lastname, suffix, ctepid, address_line1, address_line2, city, state_or_province, country, postal_code, contact_email, contact_phone, contact_fax, per_id, status, response)
    assert_equal(prefix, response['prefix'], 'Person prefix' + @error_string)
    assert_equal(firstname, response['firstName'], 'Person firstname' + @error_string)
    assert_equal(middlename, response['middleName'], 'Person middlename' + @error_string)
    assert_equal(lastname, response['lastName'], 'Person lastname' + @error_string)
    assert_equal(suffix, response['suffix'], 'Person suffix' + @error_string)
    assert_equal(ctepid, response['ctepId'], 'Person ctepId' + @error_string)
    assert_equal(address_line1, response['address']['line1'], 'Person address Line1' + @error_string)
    assert_equal(address_line2, response['address']['line2'], 'Person address Line2' + @error_string)
    assert_equal(city, response['address']['city'], 'Person city' + @error_string)
    assert_equal(state_or_province, response['address']['stateOrProvince'], 'Person stateOrProvince' + @error_string)
    assert_equal(country, response['address']['country'], 'Person country' + @error_string)
    assert_equal(postal_code, response['address']['postalcode'], 'Person postalcode' + @error_string)
    assert_equal(contact_email, response['contact'][0]['value'], 'Person email' + @error_string)
    assert_equal(contact_phone, response['contact'][1]['value'], 'Person phone' + @error_string)
    assert_equal(contact_fax, response['contact'][2]['value'], 'Person fax' + @error_string)
    assert_equal(per_id, response['id'], 'Person ID' + @error_string)
    assert_equal(status, response['status'], 'Person status' + @error_string)
  end

end
