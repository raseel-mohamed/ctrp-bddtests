
class Person_helper

  @error_string = ' does not match'

def self.load_person_templates(type)
  location = "#{File.dirname(__FILE__)}/../../../data/person_template.json"
  whole_json = JSON(IO.read(location))
  # whole_json = JSON(IO.read('./public/patient_message_templates.json'))
  puts 'json'
  puts whole_json[type]
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


end
