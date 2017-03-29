$dunit ||= false


Given(/^I want to Import a trial with NCT ID NCT(\d+)$/) do |arg1|
  headers = {:content_type => 'application/xml', :accept => 'application/xml'}
  url_ctgov = 'https://clinicaltrials.gov/ct2/show/NCT'+arg1+'/xml'
  @nct_id = 'NCT'+arg1
  @response_ctgov = Helper.request('get', url_ctgov, '', '', nil, {})
  @response_json_ctgov = Hash.from_xml(@response_ctgov).to_json
  @data_hash_ctgov = JSON.parse(@response_json_ctgov)
  if $dunit == false
    @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
    @conn.exec("update study_protocol set status_code = 'INACTIVE' where nct_id in ('NCT03093480','NCT03087201','NCT02512757','NCT00000369','NCT03093636','NCT03087760','NCT02512757','NCT03088930','NCT02969174','NCT03086395','NCT03079687','NCT03088904','NCT03087812','NCT03088449','NCT03085186','NCT03057418','NCT03088891','NCT03072901','NCT03063710','NCT03090061','NCT03088722','NCT02512757','NCT03083132','NCT03088722','NCT03045770','NCT00000142','NCT03090048','NCT03089918','NCT03090048','NCT03090165','NCT03090412','NCT03090516','NCT03090191','NCT03090503','NCT03089892','NCT03089658','NCT03090555','NCT03090464','NCT03090308','NCT03090217','NCT03090178','NCT03090347','NCT03090334','NCT03089723','NCT01178892','NCT03089203')")
    Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03093480')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03087201')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT02512757')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT00000369')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03093636')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03087760')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT02512757')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03088930')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT02969174')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03086395')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03079687')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03088904')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03087812')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03088449')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03085186')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03057418')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03088891')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03072901')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03063710')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090061')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03088722')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT02512757')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03083132')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03088722')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03045770')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT00000142')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090048')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03089918')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090048')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090165')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090412')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090516')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090191')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090503')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03089892')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03089658')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090555')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090464')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090308')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090217')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090178')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090347')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03090334')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03089723')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT01178892')
    # Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, 'NCT03089203')
    $dunit = true # don't do it again.
  end
end

Then(/^I want to verify the Lead Org Trial ID$/) do |table|
  @res = @conn.exec("SELECT lead_org_id FROM study_protocol WHERE nct_id = '" + @nct_id + "' AND status_code = 'ACTIVE'")
  assert_equal(@res.getvalue(0, 0), @data_hash_ctgov['clinical_study']['id_info']['org_study_id'], 'Validating lead ORG ID')
end
