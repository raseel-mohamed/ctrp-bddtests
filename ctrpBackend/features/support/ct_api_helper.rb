require 'nokogiri'
require 'time'
require 'active_support'

class Ct_api_helper

  def self.import_trial_frm_ct(arg1)
    headers = {:content_type => 'application/xml', :accept => 'application/xml'}
    ct_env = ENV['ctgov'].to_s
    nct_id = arg1.to_s
    url_ctgov = ''+ ct_env +'/NCT'+ nct_id +'/xml'
    @nct_id = 'NCT'+ nct_id
    @response_ctgov = Helper.request('get', url_ctgov, '', '', nil, {})
    @data_xml_ctgov = Nokogiri::XML(@response_ctgov)
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
      when 'Enrolling by invitation'
        enrl = data_hash_ctgov['clinical_study']['overall_status']
        @enrlbyinv = enrl.to_s
        puts 'Verifying: <<' + @enrlbyinv + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'ENROLLING_BY_INVITATION' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('ENROLLING_BY_INVITATION')
          @return_db_value = 'Enrolling by invitation'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @enrlbyinv, 'Validating Enrolling by invitation trial status')
      when 'Closed to Accrual'
        clstoe = data_hash_ctgov['clinical_study']['overall_status']
        @clos_to_acc = clstoe.to_s
        puts 'Verifying: <<' + @clos_to_acc + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'CLOSED_TO_ACCRUAL' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('CLOSED_TO_ACCRUAL')
          @return_db_value = 'Active, not recruiting'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @clos_to_acc, 'Validating Closed to Accrual trial status')
      when 'Closed to Accrual and Intervention'
        clstoanintervn = data_hash_ctgov['clinical_study']['overall_status']
        @clos_to_acc_intrvntn = clstoanintervn.to_s
        puts 'Verifying: <<' + @clos_to_acc_intrvntn + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'CLOSED_TO_ACCRUAL_AND_INTERVENTION' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('CLOSED_TO_ACCRUAL_AND_INTERVENTION')
          @return_db_value = 'No longer available'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @clos_to_acc_intrvntn, 'Validating Closed to Accrual and Intervention trial status')
      when 'Temporarily Closed to Accrual and Intervention'
        tmpclstoanintervn = data_hash_ctgov['clinical_study']['overall_status']
        @tmp_clos_to_acc_intrvntn = tmpclstoanintervn.to_s
        puts 'Verifying: <<' + @tmp_clos_to_acc_intrvntn + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'TEMPORARILY_CLOSED_TO_ACCRUAL_AND_INTERVENTION' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('TEMPORARILY_CLOSED_TO_ACCRUAL_AND_INTERVENTION')
          @return_db_value = 'Suspended'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @tmp_clos_to_acc_intrvntn, 'Validating Temporarily Closed to Accrual and Intervention trial status')
      when 'Completed'
        complt = data_hash_ctgov['clinical_study']['overall_status']
        @complet = complt.to_s
        puts 'Verifying: <<' + @complet + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'COMPLETED' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('COMPLETED')
          @return_db_value = 'Completed'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @complet, 'Validating Completed trial status')
      when 'Administratively Complete'
        admincomplt = data_hash_ctgov['clinical_study']['overall_status']
        @admintrvly_complet = admincomplt.to_s
        puts 'Verifying: <<' + @admintrvly_complet + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'ADMINISTRATIVELY_COMPLETE' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('ADMINISTRATIVELY_COMPLETE')
          @return_db_value = 'Terminated'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @admintrvly_complet, 'Validating Administratively Complete trial status')
      when 'Temporarily not available'
        tmpnotavail = data_hash_ctgov['clinical_study']['overall_status']
        @tmp_not_avail = tmpnotavail.to_s
        puts 'Verifying: <<' + @tmp_not_avail + '>>.'
        @res = @conn.exec("SELECT status_code FROM study_recruitment_status WHERE status_code = 'TEMPORARILY_CLOSED_TO_ACCRUAL_AND_INTERVENTION' AND study_protocol_identifier in (SELECT identifier FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE')")
        @return_db_value = @res.getvalue(0, 0).to_s
        if @return_db_value.eql?('TEMPORARILY_CLOSED_TO_ACCRUAL_AND_INTERVENTION')
          @return_db_value = 'Temporarily not available'
        else
          @return_db_value
        end
        assert_equal(@return_db_value, @tmp_not_avail, 'Validating Temporarily Closed to Accrual and Intervention/Temporarily not available trial status')
      else
        flunk 'Please provide correct db_field. Provided db_filed <<' + db_field + '>> does not exist'
    end
    @conn.close if @conn
  end

  def self.verify_xml_json_element_with_db(db_field, nct_id, data_hash_ctgov)
    begin
      @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
    rescue PGconn::Error => e
      @conn = e.message
    end
    case db_field
      when 'Trial Start Date', 'Trial Start Date (DD should be 01)'
        trailstartdate = data_hash_ctgov['clinical_study']['start_date']
        @trial_start_date = trailstartdate.to_s
        puts 'Verifying: <<' + @trial_start_date + '>>.'
        @res = @conn.exec("SELECT start_date FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        @return_db_rslt = @res.getvalue(0, 0)
        if db_field.eql?('Trial Start Date (DD should be 01)')
          assert_equal(@trial_start_date.include?(','), false, 'Validating Date format as trial status')
        end
        if @trial_start_date.include?(',')
          t = Time.parse(@return_db_rslt)
          @tm = t.strftime("%B %e, %Y")
          @rm_ext_spce = @tm.split.join(" ")
          @return_db_value = @rm_ext_spce.to_s
        else
          t = Time.parse(@return_db_rslt)
          @tm = t.strftime("%B %Y")
          @return_db_value = @tm.to_s
        end
        assert_equal(@return_db_value, @trial_start_date, 'Validating Start Date trial status')
      when 'Trial Start Date option'
        @data_sml = @data_xml_ctgov
        @data_sml.search('clinical_study').each do |start_date_tag|
          #start_date_tag_xml = start_date_tag.at('start_date').text
          start_date_type_xml = start_date_tag.at('start_date').get_attribute "type"
          if start_date_type_xml.nil?
            @start_date_type_val = 'ACTUAL'
          else
            @start_date_type_val = start_date_type_xml.upcase
          end
        end
        trailstartdateoption = @start_date_type_val
        @trial_start_date_option = trailstartdateoption.to_s
        puts 'Verifying: <<' + @trial_start_date_option + '>>.'
        @res = @conn.exec("SELECT start_date_type_code FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        @return_db_value = @res.getvalue(0, 0).to_s
        assert_equal(@return_db_value, @trial_start_date_option, 'Validating Start Date Option trial status')
      when 'Completion Date', 'Completion Date (DD should be 01)'
        trailcompletiondate = data_hash_ctgov['clinical_study']['completion_date']
        @trial_comp_date = trailcompletiondate.to_s
        puts 'Verifying: <<' + @trial_comp_date + '>>.'
        @res = @conn.exec("SELECT completion_date FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        @return_db_rslt = @res.getvalue(0, 0)
        if @trial_comp_date.include?(',')
          t = Time.parse(@return_db_rslt)
          @tm = t.strftime("%B %e, %Y")
          @rm_ext_spce = @tm.split.join(" ")
          @return_db_value = @rm_ext_spce.to_s
        else
          t = Time.parse(@return_db_rslt)
          @tm = t.strftime("%B %Y")
          @return_db_value = @tm.to_s
        end
        assert_equal(@return_db_value, @trial_comp_date, 'Validating Completion Date trial status')
      when 'Completion Date option'
        @data_sml = @data_xml_ctgov
        @data_sml.search('clinical_study').each do |comp_date_tag|
          comp_date_type_xml = comp_date_tag.at('completion_date').get_attribute "type"
          if comp_date_type_xml.nil?
            @comp_date_type_val = 'ACTUAL'
          else
            @comp_date_type_val = comp_date_type_xml.upcase
          end
        end
        compstartdateoption = @comp_date_type_val
        @trial_comp_date_option = compstartdateoption.to_s
        puts 'Verifying: <<' + @trial_comp_date_option + '>>.'
        @res = @conn.exec("SELECT completion_date_type_code FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        @return_db_value = @res.getvalue(0, 0).to_s
        assert_equal(@return_db_value, @trial_comp_date_option, 'Validating Completion Date Option trial status')
      when 'Primary Completion Date', 'Primary Completion Date (DD should be 01)'
        trailprimarycompletiondate = data_hash_ctgov['clinical_study']['primary_completion_date']
        @trial_primary_comp_date = trailprimarycompletiondate.to_s
        puts 'Verifying: <<' + @trial_primary_comp_date + '>>.'
        @res = @conn.exec("SELECT pri_compl_date FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        @return_db_rslt = @res.getvalue(0, 0)
        if @trial_primary_comp_date.include?(',')
          t = Time.parse(@return_db_rslt)
          @tm = t.strftime("%B %e, %Y")
          @rm_ext_spce = @tm.split.join(" ")
          @return_db_value = @rm_ext_spce.to_s
        else
          t = Time.parse(@return_db_rslt)
          @tm = t.strftime("%B %Y")
          @return_db_value = @tm.to_s
        end
        assert_equal(@return_db_value, @trial_primary_comp_date, 'Validating Primary Completion Date trial status')
      when 'Primary Completion Date option'
        @data_sml = @data_xml_ctgov
        @data_sml.search('clinical_study').each do |prmy_comp_date_tag|
          prmy_comp_date_type_xml = prmy_comp_date_tag.at('primary_completion_date').get_attribute "type"
          if prmy_comp_date_type_xml.nil?
            @prmry_comp_date_type_val = 'ACTUAL'
          else
            @prmry_comp_date_type_val = prmy_comp_date_type_xml.upcase
          end
        end
        prmrycompdateoption = @prmry_comp_date_type_val
        @trial_primary_comp_date_option = prmrycompdateoption.to_s
        puts 'Verifying: <<' + @trial_primary_comp_date_option + '>>.'
        @res = @conn.exec("SELECT pri_compl_date_type_code FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        @return_db_value = @res.getvalue(0, 0).to_s
        assert_equal(@return_db_value, @trial_primary_comp_date_option, 'Validating Primary Completion Date Option trial status')
      else
        flunk 'Please provide correct db_field. Provided db_filed <<' + db_field + '>> does not exist'
    end
    @conn.close if @conn
  end

  def self.verify_phase(db_field, nct_id, data_hash_ctgov)
    begin
      @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
    rescue PGconn::Error => e
      @conn = e.message
    end
    case db_field
      when 'Early Phase 1', 'I', 'I/II', 'II', 'II/III', 'III', 'IV', 'NA'
        @data_sml = @data_xml_ctgov
        @data_sml.search('clinical_study').each do |phase_tag|
          @phase_val_xml = phase_tag.at('phase').text
        end
        @phase_option = @phase_val_xml.to_s
        assert_equal(@phase_option.nil?, false, 'Validating phase is not empty')
        if @phase_val_xml.eql?('Phase 1')
          @phase_option = 'I'
        elsif @phase_val_xml.eql?('Phase 1/Phase 2')
          @phase_option = 'I_II'
        elsif @phase_val_xml.eql?('Phase 2')
          @phase_option = 'II'
        elsif @phase_val_xml.eql?('Phase 2/Phase 3')
          @phase_option = 'II_III'
        elsif @phase_val_xml.eql?('Phase 3')
          @phase_option = 'III'
        elsif @phase_val_xml.eql?('Phase 4')
          @phase_option = 'IV'
        elsif @phase_val_xml.eql?('N/A')
          @phase_option = 'NA'
        else
          @phase_option = @phase_val_xml
        end
        @trial_phase_option = @phase_option.to_s
        puts 'Verifying: <<' + @trial_phase_option + '>>.'
        @res = @conn.exec("SELECT phase_code FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        @return_db_value = @res.getvalue(0, 0).to_s
        assert_equal(@return_db_value, @trial_phase_option, 'Validating Trial Phase option')
      else
        flunk 'Please provide correct db_field. Provided db_filed <<' + db_field + '>> does not exist'
    end
    @conn.close if @conn
  end

  def self.verify_trial_type(db_field, nct_id, data_hash_ctgov)
    begin
      @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
    rescue PGconn::Error => e
      @conn = e.message
    end
    @pass_nct_id = nct_id
    case db_field
      when 'Interventional Study', 'Non-Interventional Study'
        @expanded_access = @data_xml_ctgov
        @expanded_access.search('clinical_study').each do |expanded_access_tag|
          @expnded_access_val_xml = expanded_access_tag.at('study_type').text
        end
        @expndd_accss_option = @expnded_access_val_xml.to_s
        assert_equal(@expndd_accss_option.nil?, false, 'Validating CTRP Study Type is not empty')
        if @expnded_access_val_xml.eql?('Expanded Access')
          @expndd_accss_option = 'InterventionalStudyProtocol'
        elsif @expnded_access_val_xml.eql?('Interventional')
          @expndd_accss_option = 'InterventionalStudyProtocol'
        elsif @expnded_access_val_xml.eql?('Observational')
          @expndd_accss_option = 'NonInterventionalStudyProtocol'
        elsif @expnded_access_val_xml.eql?('Observational [Patient Registry]')
          @expndd_accss_option = 'NonInterventionalStudyProtocol'
        else
          @expndd_accss_option = @expnded_access_val_xml
        end
        @trial_type_option = @expndd_accss_option.to_s
        puts 'Verifying: <<' + @trial_type_option + '>>.'
        @res = @conn.exec("SELECT study_protocol_type FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        @return_db_value = @res.getvalue(0, 0).to_s
        assert_equal(@return_db_value, @trial_type_option, 'Validating Trial Type option')
      else
        flunk 'Please provide correct db_field. Provided db_filed <<' + db_field + '>> does not exist'
    end
    @conn.close if @conn
  end

  def self.verify_expanded_access(arg1)
    begin
      @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
    rescue PGconn::Error => e
      @conn = e.message
    end
    puts 'Verifying Expanded Access Value: <<' + arg1 + '>>.'
    @res = @conn.exec("SELECT expd_access_indidicator FROM study_protocol WHERE nct_id = '" + @pass_nct_id + "' AND status_code = 'ACTIVE'")
    @return_db_value = @res.getvalue(0, 0).to_s
    @conn.close if @conn
    if @return_db_value.eql?('t')
      @return_db_value = 'True'
    elsif @return_db_value.eql?('f')
      @return_db_value = 'False'
    end
    if arg1.nil?
      flunk 'Please provide expanded access value as Yes or No'
    else
      if arg1.eql?('Yes')
        @expndd_accss_indi = 'True'
      elsif arg1.eql?('No')
        @expndd_accss_indi = 'False'
      else
        flunk 'Please provide correct expanded access indicator value. Provided expanded access indicator value <<' + arg1 + '>> does not exist'
      end
    end
    @expn_accss_indicator = @expndd_accss_indi.to_s
    assert_equal(@return_db_value, @expn_accss_indicator, 'Validating Expanded Access Indicator option')
    @conn.close if @conn
  end

  def self.verify_allocation(db_field, nct_id, data_hash_ctgov)
    begin
      @conn = PGconn.connect(:host => ENV['db_hostname'], :port => ENV['db_port'], :dbname => ENV['db_name'], :user => ENV['db_user'], :password => ENV['db_pass'])
    rescue PGconn::Error => e
      @conn = e.message
    end
    case db_field
      when 'Randomized Controlled Trial', 'Non-Randomized Trial'
        trail_allocation = data_hash_ctgov['clinical_study']['study_design_info']['allocation']
        @trial_study_allocation = trail_allocation.to_s
        @randomized_trial = @data_xml_ctgov
        @randomized_trial.search('//study_design_info').each do |allocation_tag|
          @randomized_trial_val_xml = allocation_tag.at('allocation').text
        end
        @allocation_option = @randomized_trial_val_xml.to_s
        assert_equal(@allocation_option.nil?, false, 'Validating CTRP Study Allocation is not empty')
        if @randomized_trial_val_xml.eql?('Randomized')
          @allocation_option = 'RANDOMIZED_CONTROLLED_TRIAL'
        elsif @randomized_trial_val_xml.eql?('Non-Randomized')
          @allocation_option = 'NON_RANDOMIZED_TRIAL'
        else
          @allocation_option = @randomized_trial_val_xml
        end
        @trial_allocation_option = @allocation_option.to_s
        puts 'Verifying: <<' + @trial_allocation_option + '>>.'
        @res = @conn.exec("SELECT allocation_code FROM study_protocol WHERE nct_id = '" + nct_id + "' AND status_code = 'ACTIVE'")
        @return_db_value = @res.getvalue(0, 0).to_s
        assert_equal(@return_db_value, @trial_allocation_option, 'Validating Trial Study Allocation option')
      else
        flunk 'Please provide correct db_field. Provided db_filed <<' + db_field + '>> does not exist'
    end
    @conn.close if @conn
  end

end


