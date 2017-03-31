require_relative '../support/ct_api_helper'
#$dunit ||= false

# Given(/^I want to Import a trial with NCT ID NCT(\d+)$/) do |arg1|
#   # headers = {:content_type => 'application/xml', :accept => 'application/xml'}
#   # base_ct = ENV['ctgov'].to_s
#   # url_ctgov = ''+ENV['ctgov'].to_s+'/NCT'+arg1+'/xml'
#   # @nct_id = 'NCT'+arg1
#   # @response_ctgov = Helper.request('get', url_ctgov, '', '', nil, {})
#   # @response_json_ctgov = Hash.from_xml(@response_ctgov).to_json
#   # @data_hash_ctgov = JSON.parse(@response_json_ctgov)
#   # # if $dunit == false
#   # @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
#   # @conn.exec("update study_protocol set status_code = 'INACTIVE' where nct_id in ('" + @nct_id + "')")
#   # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, @nct_id)
#   # #   $dunit = true # don't do it again.
#   # #  end
# end
#
# Then(/^I want to verify the Lead Org Trial ID$/) do |table|
#   # @res = @conn.exec("SELECT lead_org_id FROM study_protocol WHERE nct_id = '" + @nct_id + "' AND status_code = 'ACTIVE'")
#   # assert_equal(@res.getvalue(0, 0), @data_hash_ctgov['clinical_study']['id_info']['org_study_id'], 'Validating lead ORG ID')
# end

Given(/^I want to Import a trial with NCT ID NCT(\d+)$/) do |arg1|
  @nct_id, @data_hash_ctgov, @response, @response_code = Ct_api_helper.import_trial_frm_ct(arg1)
end

Then(/^I want to verify the Lead Org Trial ID$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('Lead Org Trial ID'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Secondary  ID$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('Other ID'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the NCT ID$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('NCT ID'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Brief Title$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('brief title'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Official Title$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('official title'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Official title is empty$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('official title is empty'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the acronym$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('acronym'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Lead Organization$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('Lead Organization'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the sponsor$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('sponsor'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

And(/^I want to verify RO role is populated with this sponsor$/) do
  Ct_api_helper.verify_json_element_with_db('RO Role', @nct_id, @data_hash_ctgov)
end

Then(/^I want to verify the collaborator$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('collaborator'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

And(/^I want to verify the collaborator Functional Code should be “Laboratory” by default$/) do
  Ct_api_helper.verify_json_element_with_db('Functional Code', @nct_id, @data_hash_ctgov)
end

Then(/^I want to verify the Data Monitoring Committee Appointed Indicator$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('Data Monitoring Committee Appointed Indicator'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the FDA\-regulated Drug Product$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('FDA-regulated Drug Product'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the FDA\-regulated Device Product$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('FDA-regulated Device Product'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the FDA Approval or Clearance$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('FDA Approval or Clearance'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Product Exported from the U\.S$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('Product Exported from the U.S'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the brief summary$/) do |table|
  table.hashes.each do |row|
    if(row["CTRP fields"].eql?('brief_summary'))
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Detailed description$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('Detailed Description')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Trial status$/) do |table|
  table.hashes.each do |row|
    if row["CTRP Trial status"].eql?('In Review')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Approved')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Withdrawn')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["clinical Trial status"].eql?('Available') && row["CTRP Trial status"].eql?('Active')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["clinical Trial status"].eql?('Recruiting') && row["CTRP Trial status"].eql?('Active')
      Ct_api_helper.verify_json_element_with_db(row["clinical Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Enrolling by invitation')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Closed to Accrual')
        Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Closed to Accrual and Intervention')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Temporarily Closed to Accrual and Intervention')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Completed')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Administratively Complete')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Temporarily Closed to Accrual and Intervention') && row["clinical Trial status"].eql?('Temporarily not available')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)

    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP Trial status"].to_s + '>> does not exist'
    end
    #Temporarily Closed to Accrual and Intervention
  end
end