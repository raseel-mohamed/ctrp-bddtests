class Organization_helper

  @error_string = ' does not match'

  def self.load_organization_templates(type)
    location = "#{File.dirname(__FILE__)}/../../../data/organization_template.json"
    whole_json = JSON(IO.read(location))
    whole_json[type]
  end

  def self.prepare_create_organization(name, address_line1, address_line2, city, state_or_province, country, postal_code, contact_email, contact_phone, contact_fax, contact_TTY, contact_URL, status)
    @request_hash = load_organization_templates('create_organization')
    @request_hash['name'] = name
    @request_hash['address']['line1'] = address_line1
    @request_hash['address']['line2'] = address_line2
    @request_hash['address']['city'] = city
    @request_hash['address']['stateOrProvince'] = state_or_province
    @request_hash['address']['country'] = country
    @request_hash['address']['postalcode'] = postal_code
    @request_hash['contact'][0]['value'] = contact_email
    @request_hash['contact'][1]['value']= contact_phone
    @request_hash['contact'][2]['value'] = contact_fax
    @request_hash['contact'][3]['value'] = contact_TTY
    @request_hash['contact'][4]['value'] = contact_URL
    @request_hash['status'] = status
    @request_hash
  end

  def self.prepare_update_organization(name, address_line1, address_line2, city, state_or_province, country, postal_code, contact_email, contact_phone, contact_fax, contact_TTY, contact_URL, org_id, status)
    @request_hash = load_organization_templates('update_organization')
    @request_hash['name'] = name
    @request_hash['address']['line1'] = address_line1
    @request_hash['address']['line2'] = address_line2
    @request_hash['address']['city'] = city
    @request_hash['address']['stateOrProvince'] = state_or_province
    @request_hash['address']['country'] = country
    @request_hash['address']['postalcode'] = postal_code
    @request_hash['contact'][0]['value'] = contact_email
    @request_hash['contact'][1]['value']= contact_phone
    @request_hash['contact'][2]['value'] = contact_fax
    @request_hash['contact'][3]['value'] = contact_TTY
    @request_hash['contact'][4]['value'] = contact_URL
    @request_hash['id'] = org_id
    @request_hash['status'] = status
    @request_hash
  end

  def self.trigger_create_org_post(service, service_url_method, username, headers, org_name, org_address_line1, org_address_line2, org_city, org_state_or_province, org_country, org_postal_code, org_contact_email, org_contact_phone, org_contact_fax, org_contact_tty, org_contact_url, org_status)
    service_url = ENV[service_url_method]
    @request_hash = prepare_create_organization(org_name, org_address_line1, org_address_line2, org_city, org_state_or_province, org_country, org_postal_code, org_contact_email, org_contact_phone, org_contact_fax, org_contact_tty, org_contact_url, org_status)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username, payload_string, headers)
    @response
  end

  def self.trigger_get_org(service, service_url_method, username, headers, org_id)
    service_url = ENV[service_url_method] + org_id.to_s
    @response = Helper.request(service, service_url, username, nil, headers)
    @response
  end

  def self.trigger_update_org_put(service, service_url_method, username, headers, org_id, org_name, org_address_line1, org_address_line2, org_city, org_state_or_province, org_country, org_postal_code, org_contact_email, org_contact_phone, org_contact_fax, org_contact_tty, org_contact_url, org_status)
    service_url = ENV[service_url_method] + org_id.to_s
    @request_hash = Organization_helper.prepare_update_organization(org_name, org_address_line1, org_address_line2, org_city, org_state_or_province, org_country, org_postal_code, org_contact_email, org_contact_phone, org_contact_fax, org_contact_tty, org_contact_url, org_id, org_status)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username, payload_string, headers)
    @response
  end

  def self.verify_organization(name, ctep_id, address_line1, address_line2, city, state_or_province, country, postal_code, contact_email, contact_phone, contact_fax, contact_tty, contact_url, status, org_id, response)
    assert_equal(name, response['name'], 'Organization name' + @error_string)
    assert_equal(ctep_id, response['ctepId'], 'Organization ctepId' + @error_string)
    assert_equal(address_line1, response['address']['line1'], 'Organization address Line1' + @error_string)
    assert_equal(address_line2, response['address']['line2'], 'Organization address Line2' + @error_string)
    assert_equal(city, response['address']['city'], 'Organization city' + @error_string)
    assert_equal(state_or_province, response['address']['stateOrProvince'], 'Organization stateOrProvince' + @error_string)
    assert_equal(country, response['address']['country'], 'Organization country' + @error_string)
    assert_equal(postal_code, response['address']['postalcode'], 'Organization name' + @error_string)
    assert_equal(contact_email, response['contact'][0]['value'], 'Organization email' + @error_string)
    assert_equal(contact_phone, response['contact'][1]['value'], 'Organization phone' + @error_string)
    assert_equal(contact_fax, response['contact'][2]['value'], 'Organization fax' + @error_string)
    assert_equal(contact_tty, response['contact'][3]['value'], 'Organization TTY' + @error_string)
    assert_equal(contact_url, response['contact'][4]['value'], 'Organization URL' + @error_string)
    assert_equal(status, response['status'], 'Organization status' + @error_string)
    assert_equal(org_id, response['id'], 'Organization ID' + @error_string)
  end

end
