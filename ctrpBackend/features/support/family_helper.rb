class Family_helper

  @error_string = ' does not match'

  def self.load_family_templates(type)
    location = "#{File.dirname(__FILE__)}/../../../data/family_template.json"
    whole_json = JSON(IO.read(location))
    whole_json[type]
  end

  def self.trigger_get_family(service, service_url_method, service_url_by, username,password, headers, family_search_val, flag)
    service_url = ENV[service_url_method] + service_url_by + family_search_val.to_s
    puts service_url
    @response = Helper.request(service, service_url, username, password,nil, headers)
    @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    case flag
      when 'NAME', 'ORGANIZATIONID'
        list_key = 'family'
        @response_body[list_key].each { |this_family|
          @id = this_family['id']
          puts 'Family ID is: ' + @id.to_s
        }
      when 'ID'
        @id = @response_body['id']
        puts 'Family ID is: ' + @id.to_s
      else
        flunk 'Please provide correct verification flag. Provided flag <<' + flag + '>> does not exist'
    end
    return @response,@response_code, @response_body, @id
  end

  def self.verify_family(name, start_date, serial_number, family_id, organization_id, type, start_date1, end_date, id, status, response, flag)
    @end_date_null = end_date=='null' ? nil : end_date
    case flag
      when 'NAME', 'ORGANIZATIONID'
        puts flag
        response['family'].each { |this_family|
          assert_equal(name, this_family['name'], 'family name ' + @error_string)
          assert_equal(start_date.to_s, this_family['startDate'].to_s, 'family start date ' + @error_string)
          assert_equal(serial_number.to_s, this_family['p30SerialNumber'].to_s, 'family serial number ' + @error_string)
          assert_equal(family_id.to_s, this_family['member'][0]['familyId'].to_s, 'family ID ' + @error_string)
          assert_equal(organization_id.to_s, this_family['member'][0]['organizationId'].to_s, 'family Org ID ' + @error_string)
          assert_equal(type.to_s, this_family['member'][0]['type'].to_s, 'family type ' + @error_string)
          assert_equal(start_date1.to_s, this_family['member'][0]['startDate'].to_s, 'family start date ' + @error_string)
          assert_equal(@end_date_null.to_s, this_family['member'][0]['endDate'].to_s, 'family end date ' + @error_string)
          assert_equal(id.to_s, this_family['id'].to_s, 'family id ' + @error_string)
          assert_equal(status.to_s, this_family['status'].to_s, 'family status ' + @error_string)
        }
      when 'ID'
        assert_equal(name, response['name'], 'family name ' + @error_string)
        assert_equal(start_date.to_s, response['startDate'].to_s, 'family start date ' + @error_string)
        assert_equal(serial_number.to_s, response['p30SerialNumber'].to_s, 'family serial number ' + @error_string)
        assert_equal(family_id.to_s, response['member'][0]['familyId'].to_s, 'family ID ' + @error_string)
        assert_equal(organization_id.to_s, response['member'][0]['organizationId'].to_s, 'family Org ID ' + @error_string)
        assert_equal(type.to_s, response['member'][0]['type'].to_s, 'family type ' + @error_string)
        assert_equal(start_date1.to_s, response['member'][0]['startDate'].to_s, 'family start date ' + @error_string)
        assert_equal(@end_date_null.to_s, response['member'][0]['endDate'].to_s, 'family end date ' + @error_string)
        assert_equal(id.to_s, response['id'].to_s, 'family id ' + @error_string)
        assert_equal(status.to_s, response['status'].to_s, 'family status ' + @error_string)
      else
        flunk 'Please provide correct verification flag. Provided flag <<' + flag + '>> does not exist'
    end

  end


end
