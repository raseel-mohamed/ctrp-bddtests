require_relative '../support/ct_api_helper'


Given(/^I want to Import a trial with NCT ID NCT(\d+)$/) do |arg1|
  @nct_id, @data_hash_ctgov, @response, @response_code = Ct_api_helper.import_trial_frm_ct(arg1)
end

Then(/^I want to verify the Lead Org Trial ID$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('Lead Org Trial ID')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Secondary  ID$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('Other ID')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the NCT ID$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('NCT ID')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Brief Title$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('brief title')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Official Title$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('official title')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Official title is empty$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('official title is empty')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the acronym$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('acronym')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Lead Organization$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('Lead Organization')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the sponsor$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('sponsor')
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
    if row["CTRP fields"].eql?('collaborator')
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
    if row["CTRP fields"].eql?('Data Monitoring Committee Appointed Indicator')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the FDA\-regulated Drug Product$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('FDA-regulated Drug Product')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the FDA\-regulated Device Product$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('FDA-regulated Device Product')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the FDA Approval or Clearance$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('FDA Approval or Clearance')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Product Exported from the U\.S$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('Product Exported from the U.S')
      Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP fields"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the brief summary$/) do |table|
  table.hashes.each do |row|
    if row["CTRP fields"].eql?('brief_summary')
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
    elsif row["CTRP Trial status"].eql?('Temporarily Closed to Accrual and Intervention') && row["clinical Trial status"].eql?('Temporarily not available')
      Ct_api_helper.verify_json_element_with_db(row["clinical Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Temporarily Closed to Accrual and Intervention')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Completed')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Trial status"].eql?('Administratively Complete')
      Ct_api_helper.verify_json_element_with_db(row["CTRP Trial status"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + row["CTRP Trial status"].to_s + '>> does not exist'
    end
    #Temporarily Closed to Accrual and Intervention
  end
end

# Then(/^I want to verify the Trial Start Date$/) do |table|
#   table = table.hashes
#   table.hashes.each do |row|
#     @convt = row["CTRP field"]
#     @convtn = row["CTRP field"]
#     if row["clinical Trial field"].eql?('start_date')
#       @cole1_row0 = row["clinical Trial field"]
#     elsif row["clinical Trial field"].eql?('start_date type')
#       @cole1_row1 = row["clinical Trial field"]
#     end
#     if row["CTRP field"].eql?('Trial Start Date')
#       @cole2_row0 = row["CTRP field"]
#     elsif row["CTRP field"].eql?('Trial Start Date option')
#       @cole2_row1 = row["CTRP field"]
#     end
#   end
#   #start_date#start_date type#Trial Start Date#Trial Start Date option
#   @build_strng = '' + @cole1_row0 + '#' + @cole1_row1 + '#' + @cole2_row0 + '#' + @cole2_row1 + ''
#   if @build_strng.eql?('start_date#start_date type#Trial Start Date#Trial Start Date option')
#     Ct_api_helper.verify_json_element_with_db(row["CTRP fields"].to_s, @nct_id, @data_hash_ctgov)
#   else
#     flunk 'Please provide correct CTRP fields name. Provided CTRP field name <<' + @build_strng.to_s + '>> does not exist'
#   end
# end

Then(/^I want to verify the Trial Start Date$/) do |table|
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Trial Start Date option')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Trial Start Date')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
end

And(/^For the Trial Start Date in Past the Trial Start Date option should be populated as "([^"]*)"$/) do |arg1|
    #Verified the satrt date field
end

Then(/^I want to verify the Completion Date$/) do |table|
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Completion Date option')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Completion Date')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
end

Then(/^I want to verify the Primary Completion Date$/) do |table|
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Primary Completion Date')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Primary Completion Date option')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
end

Then(/^I want to verify the Date field$/) do |table|
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Trial Start Date')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Completion Date')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Primary Completion Date')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Primary Completion Date option')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end

  table.hashes.each do |row|
    if row["CTRP field"].eql?('Trial Start Date (DD should be 01)')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Completion Date (DD should be 01)')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
  table.hashes.each do |row|
    if row["CTRP field"].eql?('Primary Completion Date (DD should be 01)')
      Ct_api_helper.verify_xml_json_element_with_db(row["CTRP field"].to_s, @nct_id, @data_hash_ctgov)
    end
  end
end

Then(/^I want to verify the Phase$/) do |table|
  table.hashes.each do |row|
    if row["CTRP phase"].eql?('Early Phase 1')
      Ct_api_helper.verify_phase(row["CTRP phase"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP phase"].eql?('I')
      Ct_api_helper.verify_phase(row["CTRP phase"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP phase"].eql?('I/II')
      Ct_api_helper.verify_phase(row["CTRP phase"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP phase"].eql?('II')
      Ct_api_helper.verify_phase(row["CTRP phase"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP phase"].eql?('II/III')
      Ct_api_helper.verify_phase(row["CTRP phase"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP phase"].eql?('III')
      Ct_api_helper.verify_phase(row["CTRP phase"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP phase"].eql?('IV')
      Ct_api_helper.verify_phase(row["CTRP phase"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP phase"].eql?('NA')
      Ct_api_helper.verify_phase(row["CTRP phase"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP phase name. Provided CTRP phase name <<' + row["CTRP phase"].to_s + '>> does not exist'
    end
  end
end

Then(/^I want to verify the Trial Type$/) do |table|
  table.hashes.each do |row|
    if row["CTRP Study Type"].eql?('Interventional Study')
      Ct_api_helper.verify_trial_type(row["CTRP Study Type"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Study Type"].eql?('Non-Interventional Study')
        Ct_api_helper.verify_trial_type(row["CTRP Study Type"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP phase name. Provided CTRP phase name <<' + row["CTRP Study Type"].to_s + '>> does not exist'
    end
  end
end

And(/^Expanded Access should be "([^"]*)"$/) do |arg1|
  Ct_api_helper.verify_expanded_access(arg1)
end

Then(/^I want to verify the Allocation$/) do |table|
  table.hashes.each do |row|
    if row["CTRP Study Allocation"].eql?('Randomized Controlled Trial')
      Ct_api_helper.verify_allocation(row["CTRP Study Allocation"].to_s, @nct_id, @data_hash_ctgov)
    elsif row["CTRP Study Allocation"].eql?('Non-Randomized Trial')
      Ct_api_helper.verify_allocation(row["CTRP Study Allocation"].to_s, @nct_id, @data_hash_ctgov)
    else
      flunk 'Please provide correct CTRP phase name. Provided CTRP phase name <<' + row["CTRP Study Allocation"].to_s + '>> does not exist'
    end
  end
end




