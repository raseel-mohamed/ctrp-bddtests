
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
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['id_info']['secondary_id'] + '>>.'
        @res = @conn.exec("SELECT extension FROM public.study_otheridentifiers where identifier_name = 'Study Protocol Other Identifier' AND study_protocol_id in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['id_info']['secondary_id'], 'Validating Secondary ID or Other ID')
      when 'NCT ID'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['id_info']['nct_id'] + '>>.'
        @res = @conn.exec("SELECT nct_id FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['id_info']['nct_id'], 'Validating NCT ID')
      when 'brief title'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['brief_title'] + '>>.'
        @res = @conn.exec("SELECT public_tittle FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['brief_title'], 'Validating Brief Title')
      when 'official title'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['official_title'] + '>>.'
        @res = @conn.exec("SELECT official_title FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['official_title'], 'Validating Official Title')
      when 'official title is empty'
        puts 'Verifying: <<' + db_field + '>>.'
        if data_hash_ctgov.has_key?('clinical_study')
          if data_hash_ctgov['clinical_study'].has_key?('official_title')
            assert_not_equal(data_hash_ctgov['clinical_study'].has_key?('official_title'), false, 'Validating official title is empty')
          else
            assert_not_equal(data_hash_ctgov['clinical_study'].has_key?('official_title'), true, 'Validating official title is empty')
          end
        end
      when 'acronym'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['acronym'] + '>>.'
        @res = @conn.exec("SELECT acronym FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['acronym'], 'Validating NCT ID')
      when 'Lead Organization'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['sponsors']['lead_sponsor']['agency'] + '>>.'
        #need to fix this queary
        @res = @conn.exec("SELECT * FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['sponsors']['lead_sponsor']['agency'], 'Validating Lead Organization')
      when 'sponsor'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['sponsors']['lead_sponsor']['agency'] + '>>.'
        @res = @conn.exec("SELECT * FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['sponsors']['lead_sponsor']['agency'], 'Validating Sponsor')
      when 'RO Role'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['sponsors']['lead_sponsor']['agency'] + '>>.'
        @res = @conn.exec("SELECT * FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['sponsors']['lead_sponsor']['agency'], 'Validating RO Role')
      when 'collaborator'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['sponsors']['collaborator'][0]['agency'] + '>>.'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['sponsors']['collaborator'][1]['agency'] + '>>.'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['sponsors']['collaborator'][2]['agency'] + '>>.'
        @res = @conn.exec("SELECT lead_org_id FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['sponsors']['collaborator'][0]['agency'], 'Validating Collaborator')
      when 'Functional Code'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['sponsors']['collaborator'][0]['agency'] + '>>.'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['sponsors']['collaborator'][1]['agency'] + '>>.'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['sponsors']['collaborator'][2]['agency'] + '>>.'
        @res = @conn.exec("SELECT lead_org_id FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0), data_hash_ctgov['clinical_study']['sponsors']['collaborator'][0]['agency'], 'Validating Functional Code')
      when 'Data Monitoring Committee Appointed Indicator'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['oversight_info']['has_dmc'] + '>>.'
        @has_dmc_value = data_hash_ctgov['clinical_study']['oversight_info']['has_dmc']
        if @has_dmc_value.eql?('No')
          @has_dmc_value = 'f'
        elsif @has_dmc_value.eql?('Yes')
          @has_dmc_value = 't'
        end
        @res = @conn.exec("SELECT data_monty_comty_apptn_indicator FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0).to_s, @has_dmc_value.to_s, 'Validating Data Monitoring Committee Appointed Indicator')
      when 'FDA-regulated Drug Product'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['oversight_info']['is_fda_regulated_drug'] + '>>.'
        @has_fda_drug_value = data_hash_ctgov['clinical_study']['oversight_info']['is_fda_regulated_drug']
        if @has_fda_drug_value.eql?('No')
          @has_fda_drug_value = 'f'
        elsif @has_fda_drug_value.eql?('Yes')
          @has_fda_drug_value = 't'
        end
        @res = @conn.exec("SELECT data_monty_comty_apptn_indicator FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0).to_s, @has_fda_drug_value.to_s, 'Validating FDA-regulated Drug Product')
      when 'FDA-regulated Device Product'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['oversight_info']['is_fda_regulated_device'] + '>>.'
        @has_fda_dvic_value = data_hash_ctgov['clinical_study']['oversight_info']['is_fda_regulated_device']
        if @has_fda_dvic_value.eql?('No')
          @has_fda_dvic_value = 'f'
        elsif @has_fda_dvic_value.eql?('Yes')
          @has_fda_dvic_value = 't'
        end
        @res = @conn.exec("SELECT data_monty_comty_apptn_indicator FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0).to_s, @has_fda_dvic_value.to_s, 'Validating FDA-regulated Device Product')
      when 'FDA Approval or Clearance'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['oversight_info']['is_unapproved_device'] + '>>.'
        @has_fda_apprv_value = data_hash_ctgov['clinical_study']['oversight_info']['is_unapproved_device']
        if @has_fda_apprv_value.eql?('No')
          @has_fda_apprv_value = 'f'
        elsif @has_fda_apprv_value.eql?('Yes')
          @has_fda_apprv_value = 't'
        end
        @res = @conn.exec("SELECT data_monty_comty_apptn_indicator FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0).to_s, @has_fda_apprv_value.to_s, 'Validating FDA Approval or Clearance')
      when 'Product Exported from the U.S'
        puts 'Verifying: <<' + data_hash_ctgov['clinical_study']['oversight_info']['is_us_export'] + '>>.'
        @eported_frm_us = data_hash_ctgov['clinical_study']['oversight_info']['is_us_export']
        if @eported_frm_us.eql?('No')
          @eported_frm_us = 'f'
        elsif @eported_frm_us.eql?('Yes')
          @eported_frm_us = 't'
        end
        @res = @conn.exec("SELECT data_monty_comty_apptn_indicator FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_equal(@res.getvalue(0, 0).to_s, @eported_frm_us.to_s, 'Validating Product Exported from the U.S')
      when 'brief_summary'
        #need to compare text block
        brief_s = data_hash_ctgov['clinical_study']['brief_summary']['textblock'].gsub("\n", '')
        @brief_sm = brief_s.gsub(/\s+/, " ").strip
        puts 'Verifying: <<' + @brief_sm + '>>.'
        @res = @conn.exec("SELECT public_description FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_not_nil(@brief_sm, 'Validating brief summary is not null in the json response')
        assert_not_nil(@res, 'Validating brief summary is not null in the db field')
        #assert_equal(@res.getvalue(0, 0).to_s, @brief_sm.to_s, 'Validating brief summary')
      when 'Detailed Description'
        #need to remove some whitespace and next line from the db string
        detal_de = data_hash_ctgov['clinical_study']['detailed_description']['textblock'].gsub("\n", '')
        @detail_desc = detal_de.gsub(/\s+/, " ").strip
        puts 'Verifying: <<' + @detail_desc + '>>.'
        @res = @conn.exec("SELECT scientific_description FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        assert_not_nil(@detail_desc, 'Validating Detailed Description is not null in the json response')
        assert_not_nil(@res, 'Validating Detailed Description is not null in the db field')
        #assert_equal(@res.getvalue(0, 0), @detail_desc, 'Validating Detailed Description')
      when 'In Review'
        in_rvw = data_hash_ctgov['clinical_study']['overall_status']
        @in_rview = in_rvw.to_s
        puts 'Verifying: <<' + @in_rview + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'IN_REVIEW' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('IN_REVIEW')
          @return_db_value = 'Not yet recruiting'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @in_rview, 'Validating In Review Overall status')
      when 'Approved'
        appr = data_hash_ctgov['clinical_study']['overall_status']
        @aprovd = appr.to_s
        puts 'Verifying: <<' + @aprovd + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'APPROVED' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('APPROVED')
          @return_db_value = 'Approved for marketing'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @aprovd, 'Validating Approved Overall status')
      when 'Withdrawn'
        withd = data_hash_ctgov['clinical_study']['overall_status']
        @widndrn = withd.to_s
        puts 'Verifying: <<' + @widndrn + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'WITHDRAWN' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('WITHDRAWN')
          @return_db_value = 'Withdrawn'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @widndrn, 'Validating WITHDRAWN Overall status')
      when 'Active'
        acti = data_hash_ctgov['clinical_study']['overall_status']
        @activ = acti.to_s
        puts 'Verifying: <<' + @activ + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'ACTIVE' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('ACTIVE')
          @return_db_value = 'Available'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @activ, 'Validating ACTIVE/Available trial status')
      when 'Recruiting'
        recrtng = data_hash_ctgov['clinical_study']['overall_status']
        @recruitng = recrtng.to_s
        puts 'Verifying: <<' + @recruitng + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'ACTIVE' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('ACTIVE')
          @return_db_value = 'Recruiting'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @recruitng, 'Validating ACTIVE/Recruiting trial status')
      else
        flunk 'Please provide correct db_field. Provided db_filed <<' + db_field + '>> does not exist'
    end
    @conn.close if @conn
  end

end


