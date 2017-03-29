
class Ct_api_helper

  def self.import_trial_frm_ct(arg1)
    headers = {:content_type => 'application/xml', :accept => 'application/xml'}
    ct_env = ENV['ctgov'].to_s
    nct_id = arg1.to_s
    url_ctgov = ''+ ct_env +'/NCT'+ nct_id +'/xml'
    @nct_id = 'NCT'+ nct_id
    @response_ctgov = Helper.request('get', url_ctgov, '', '', nil, {})
    @response_json_ctgov = Hash.from_xml(@response_ctgov).to_json
    @data_hash_ctgov = JSON.parse(@response_json_ctgov)
    begin
      @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
    rescue PGconn::Error => e
      @conn = e.message
    end
    @conn.exec("update study_protocol set status_code = 'INACTIVE' where nct_id in ('" + @nct_id + "')")
    @conn.close if @conn
    @response, @response_code = Import_helper.trigger_import_post('POST', 'import', ENV['user2'], ENV['user2_password'], headers, @nct_id)
    return @nct_id, @data_hash_ctgov, @response, @response_code
  end

  def self.verify_json_element_with_db(db_field, nct_id, data_hash_ctgov)
    begin
      @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
    rescue PGconn::Error => e
      @conn = e.message
    end

    case db_field
      when 'Lead Org Trial ID'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['id_info']['org_study_id'] + '>>.'
        @res = @conn.exec("SELECT lead_org_id FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['id_info']['org_study_id'], 'Validating lead ORG ID')
      when 'Other ID'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['id_info']['org_study_id'] + '>>.'
        @res = @conn.exec("SELECT lead_org_id FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['id_info']['org_study_id'], 'Validating lead ORG ID')
      else
        flunk 'Please provide correct db_field. Provided db_filed <<' + db_field + '>> does not exist'
    end
    @conn.close if @conn
  end

end


