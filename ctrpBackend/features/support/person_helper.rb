
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

  def self.trigger_create_person_post(service, service_url_method, username, password,headers, person_prefix, person_firstname, person_middlename, person_lastname, person_suffix, person_address_line1, person_address_line2, person_city, person_state_or_province, person_country, person_postal_code, person_contact_email, person_contact_phone, person_contact_fax, person_status)
    service_url = ENV[service_url_method]
    @request_hash = prepare_create_person(person_prefix, person_firstname, person_middlename, person_lastname, person_suffix, person_address_line1, person_address_line2, person_city, person_state_or_province, person_country, person_postal_code, person_contact_email, person_contact_phone, person_contact_fax, person_status)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username,password, payload_string, headers)
    @response
  end

  def self.trigger_get_person(service, service_url_method, username, password,headers, org_id)
    service_url = ENV[service_url_method] + org_id.to_s
    @response = Helper.request(service, service_url, username,password, nil, headers)
    @response
  end

  def self.trigger_update_person_put(service, service_url_method, username, password,headers, org_id, org_name, org_address_line1, org_address_line2, org_city, org_state_or_province, org_country, org_postal_code, org_contact_email, org_contact_phone, org_contact_fax, org_contact_tty, org_contact_url, org_status)
    service_url = ENV[service_url_method] + org_id.to_s
    @request_hash = Organization_helper.prepare_update_organization(org_name, org_address_line1, org_address_line2, org_city, org_state_or_province, org_country, org_postal_code, org_contact_email, org_contact_phone, org_contact_fax, org_contact_tty, org_contact_url, org_id, org_status)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username, password,payload_string, headers)
    @response
  end

end
