
Given(/^I want to search a family with following fileds: "([^"]*)" and values: "([^"]*)"$/) do |arg1, arg2|
  fields = arg1.upcase
  case fields
    when 'NAME'
      @family_search_by_url = 'families?name='
      @family_search_val = arg2
      @search_by_flag = fields
    when 'ID'
      @family_search_by_url = 'family/'
      @family_search_val = arg2.to_s
      @search_by_flag = fields
    when 'ORGANIZATIONID'
      @family_search_by_url = 'families?organizationId='
      @family_search_val = arg2.to_s
      @search_by_flag = fields
    else
      flunk 'Please provide correct fields. Provided fields <<' + arg1 + '>> does not exist'
  end
 #test
end

And(/^the "([^"]*)" response body should be a "([^"]*)" array with elements$/) do |arg1, arg2, table|
  # table is a Cucumber::Core::Ast::DataTable
    @family_name = table.rows_hash['name']
    @start_date = table.rows_hash['startDate']
    @serial_number = table.rows_hash['p30SerialNumber']
    @member = table.rows_hash['']
    @family_id = table.rows_hash['familyId']
    @organization_id = table.rows_hash['organizationId']
    @type = table.rows_hash['type']
    @start_date1 = table.rows_hash['startDate1']
    @end_date = table.rows_hash['endDate']
    @id = table.rows_hash['id']
    @status = table.rows_hash['status']
  # Write code here that turns the phrase above into concrete actions
    case arg1.upcase
      when 'JSON'
        case arg2.upcase
          when 'FAMILY'
            Family_helper.verify_family(@family_name, @start_date, @serial_number, @family_id, @organization_id, @type, @start_date1, @end_date, @id, @status, @response_body, @search_by_flag)
          else
            flunk 'Provided <<' + arg2 + '>> does not exist'
        end
      when 'XML'
        #Need to add function
      else
        flunk 'Please provide JSON or XML to verify. Provided [' + arg1 + '>] does not exist'
    end
end