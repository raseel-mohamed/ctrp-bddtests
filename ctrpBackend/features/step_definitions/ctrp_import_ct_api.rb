#$dunit ||= false


Given(/^I want to Import a trial with NCT ID NCT(\d+)$/) do |arg1|
  headers = {:content_type => 'application/xml', :accept => 'application/xml'}
  url_ctgov = 'https://clinicaltrials.gov/ct2/show/NCT'+arg1+'/xml'
  @nct_id = 'NCT'+arg1
  @response_ctgov = Helper.request('get', url_ctgov, '', '', nil, {})
  @response_json_ctgov = Hash.from_xml(@response_ctgov).to_json
  @data_hash_ctgov = JSON.parse(@response_json_ctgov)
  # if $dunit == false
  @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
  @conn.exec("update study_protocol set status_code = 'INACTIVE' where nct_id in ('" + @nct_id + "')")
  Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, @nct_id)
  #   $dunit = true # don't do it again.
  #  end
end

Then(/^I want to verify the Lead Org Trial ID$/) do |table|
  @res = @conn.exec("SELECT lead_org_id FROM study_protocol WHERE nct_id = '" + @nct_id + "' AND status_code = 'ACTIVE'")
  assert_equal(@res.getvalue(0, 0), @data_hash_ctgov['clinical_study']['id_info']['org_study_id'], 'Validating lead ORG ID')
end
