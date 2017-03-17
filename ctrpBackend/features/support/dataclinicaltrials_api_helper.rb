require 'rspec'
require 'json'
require 'rest-client'
class Dataclinicaltrials_api_helper

  @error_string = ' does not match'

  def self.load_dataclinicaltrials_templates(type)
    location = "#{File.dirname(__FILE__)}/../../../data/dataclinicaltrials_ms_template.json"
    whole_json = JSON(IO.read(location))
    whole_json[type]
  end

  def self.prepare_add_values_dct_ms(study_protocol_id, nci_id, exported_from_us, gender_description, seq_assignment, fda_regulated_drug, post_prior_apprval, ped_postmarket_surv, masking_description, fda_regulated_device, model_description, gender_based)
    @request_hash = load_dataclinicaltrials_templates('add_values')
    #@request_hash['trial_id'] = trial_id
    @request_hash['study_protocol_id'] = study_protocol_id
    @request_hash['nci_id'] = nci_id
    @request_hash['exported_from_us'] = exported_from_us
    @request_hash['gender_description'] = gender_description
    @request_hash['sequential_assignment'] = seq_assignment
    @request_hash['fda_regulated_drug'] = fda_regulated_drug
    @request_hash['post_prior_to_approval'] = post_prior_apprval
    @request_hash['ped_postmarket_surv'] = ped_postmarket_surv
    @request_hash['masking_description'] = masking_description
    @request_hash['fda_regulated_device'] = fda_regulated_device
    @request_hash['model_description'] = model_description
    @request_hash['gender_based'] = gender_based
    @request_hash
  end

  def self.prepare_syudy_nci_dct_ms(study_protocol_id, nci_id, exported_from_us, gender_description, seq_assignment, fda_regulated_drug, post_prior_apprval, ped_postmarket_surv, masking_description, fda_regulated_device, model_description, gender_based)
    #Prepare with Study Protocol ID and NCI ID
    @request_hash = load_dataclinicaltrials_templates('add_values_study_nci')
    @request_hash['study_protocol_id'] = study_protocol_id
    @request_hash['nci_id'] = nci_id
    @request_hash['exported_from_us'] = exported_from_us
    @request_hash['gender_description'] = gender_description
    @request_hash['sequential_assignment'] = seq_assignment
    @request_hash['fda_regulated_drug'] = fda_regulated_drug
    @request_hash['post_prior_to_approval'] = post_prior_apprval
    @request_hash['ped_postmarket_surv'] = ped_postmarket_surv
    @request_hash['masking_description'] = masking_description
    @request_hash['fda_regulated_device'] = fda_regulated_device
    @request_hash['model_description'] = model_description
    @request_hash['gender_based'] = gender_based
    @request_hash
  end

  def self.prepare_syudy_trial_dct_ms(study_protocol_id, trial_ide_ind_id, exported_from_us, gender_description, seq_assignment, fda_regulated_drug, post_prior_apprval, ped_postmarket_surv, masking_description, fda_regulated_device, model_description, gender_based)
    #Prepare with Study Protocol ID and Trial ID
    @request_hash = load_dataclinicaltrials_templates('add_values_study_trial')
    @request_hash['study_protocol_id'] = study_protocol_id
    @request_hash['trial_ide_ind_id'] = trial_ide_ind_id
    @request_hash['exported_from_us'] = exported_from_us
    @request_hash['gender_description'] = gender_description
    @request_hash['sequential_assignment'] = seq_assignment
    @request_hash['fda_regulated_drug'] = fda_regulated_drug
    @request_hash['post_prior_to_approval'] = post_prior_apprval
    @request_hash['ped_postmarket_surv'] = ped_postmarket_surv
    @request_hash['masking_description'] = masking_description
    @request_hash['fda_regulated_device'] = fda_regulated_device
    @request_hash['model_description'] = model_description
    @request_hash['gender_based'] = gender_based
    @request_hash
  end

  def self.prepare_syudy_nci_trial_dct_ms(study_protocol_id, nci_id, trial_ide_ind_id, exported_from_us, gender_description, seq_assignment, fda_regulated_drug, post_prior_apprval, ped_postmarket_surv, masking_description, fda_regulated_device, model_description, gender_based)
    #Prepare with Study Protocol ID and Trial ID
    @request_hash = load_dataclinicaltrials_templates('add_values_study_nci_trial')
    @request_hash['study_protocol_id'] = study_protocol_id
    @request_hash['nci_id'] = nci_id
    @request_hash['trial_ide_ind_id'] = trial_ide_ind_id
    @request_hash['exported_from_us'] = exported_from_us
    @request_hash['gender_description'] = gender_description
    @request_hash['sequential_assignment'] = seq_assignment
    @request_hash['fda_regulated_drug'] = fda_regulated_drug
    @request_hash['post_prior_to_approval'] = post_prior_apprval
    @request_hash['ped_postmarket_surv'] = ped_postmarket_surv
    @request_hash['masking_description'] = masking_description
    @request_hash['fda_regulated_device'] = fda_regulated_device
    @request_hash['model_description'] = model_description
    @request_hash['gender_based'] = gender_based
    @request_hash
  end

  def self.prepare_update_values_dct_ms(study_protocol_id, nci_id, exported_from_us, gender_description, seq_assignment, fda_regulated_drug, post_prior_apprval, ped_postmarket_surv, masking_description, fda_regulated_device, model_description, gender_based)
    @request_hash = load_dataclinicaltrials_templates('update_values')
    @request_hash['study_protocol_id'] = study_protocol_id
    @request_hash['nci_id'] = nci_id
    @request_hash['exported_from_us'] = exported_from_us
    @request_hash['gender_description'] = gender_description
    @request_hash['sequential_assignment'] = seq_assignment
    @request_hash['fda_regulated_drug'] = fda_regulated_drug
    @request_hash['post_prior_to_approval'] = post_prior_apprval
    @request_hash['ped_postmarket_surv'] = ped_postmarket_surv
    @request_hash['masking_description'] = masking_description
    @request_hash['fda_regulated_device'] = fda_regulated_device
    @request_hash['model_description'] = model_description
    @request_hash['gender_based'] = gender_based
    @request_hash
  end

  def self.trigger_study_nci_post(service, service_url_method, endpoint_cond, username, password, headers, study_prtcl_id_dct, nci_id_dct, exported_from_us_dct, gender_desc_dct, seq_assignment_dct, fda_reglted_drug_dct, post_pror_aprval_dct, ped_pstmrkt_srv_dct, masking_desc_dct, fda_rglatd_divce_dct, model_desc_dct, gender_based_dct)
    service_url = ENV[service_url_method]+endpoint_cond
    @request_hash = prepare_syudy_nci_dct_ms(study_prtcl_id_dct, nci_id_dct, exported_from_us_dct, gender_desc_dct, seq_assignment_dct, fda_reglted_drug_dct, post_pror_aprval_dct, ped_pstmrkt_srv_dct, masking_desc_dct, fda_rglatd_divce_dct, model_desc_dct, gender_based_dct)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username,password, payload_string, headers)
    @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    @response_message = @response_body['success']
    puts  'POST Message: ' + @response_message.to_s
    # @study_protocol_id = @response_body['study_protocol_id']
    # puts  'Study protocol ID is: ' + @study_protocol_id.to_s
    return @response, @response_code, @response_body, @response_message
  end

  def self.trigger_study_trial_post(service, service_url_method, endpoint_cond, username, password, headers, study_prtcl_id_dct, trial_ide_ind_id_dct, exported_from_us_dct, gender_desc_dct, seq_assignment_dct, fda_reglted_drug_dct, post_pror_aprval_dct, ped_pstmrkt_srv_dct, masking_desc_dct, fda_rglatd_divce_dct, model_desc_dct, gender_based_dct)
    service_url = ENV[service_url_method]+endpoint_cond
    @request_hash = prepare_syudy_nci_dct_ms(study_prtcl_id_dct, trial_ide_ind_id_dct, exported_from_us_dct, gender_desc_dct, seq_assignment_dct, fda_reglted_drug_dct, post_pror_aprval_dct, ped_pstmrkt_srv_dct, masking_desc_dct, fda_rglatd_divce_dct, model_desc_dct, gender_based_dct)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username,password, payload_string, headers)
    @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    @response_message = @response_body['success']
    puts  'POST Message: ' + @response_message.to_s
    # @study_protocol_id = @response_body['study_protocol_id']
    # puts  'Study protocol ID is: ' + @study_protocol_id.to_s
    return @response, @response_code, @response_body, @response_message
  end

  def self.trigger_study_nci_trial_post(service, service_url_method, endpoint_cond, username, password, headers, study_prtcl_id_dct, nci_id_dct, trial_ide_ind_id_dct, exported_from_us_dct, gender_desc_dct, seq_assignment_dct, fda_reglted_drug_dct, post_pror_aprval_dct, ped_pstmrkt_srv_dct, masking_desc_dct, fda_rglatd_divce_dct, model_desc_dct, gender_based_dct)
    service_url = ENV[service_url_method]+endpoint_cond
    @msg_s_p_id = study_prtcl_id_dct
    @msg_nci_id = nci_id_dct
    @request_hash = prepare_syudy_nci_trial_dct_ms(study_prtcl_id_dct, nci_id_dct, trial_ide_ind_id_dct, exported_from_us_dct, gender_desc_dct, seq_assignment_dct, fda_reglted_drug_dct, post_pror_aprval_dct, ped_pstmrkt_srv_dct, masking_desc_dct, fda_rglatd_divce_dct, model_desc_dct, gender_based_dct)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username,password, payload_string, headers)
    @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    @response_message = @response_body['error']
    puts  'POST Message: ' + @response_message.to_s
    # @study_protocol_id = @response_body['study_protocol_id']
    # puts  'Study protocol ID is: ' + @study_protocol_id.to_s
    return @response, @response_code, @response_body, @response_message
  end

  def self.trigger_get_field_values(service, service_url_method, username, password, headers, study_protocol_id)
    service_url = ENV[service_url_method] + study_protocol_id.to_s
    @response = Helper.request(service, service_url, username, password, nil, headers)
    # @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    @response_message = @response_body['message']
    puts  'GET Message: ' + @response_message.to_s
    @study_protocol_id = @response_body['study_protocol_id']
    puts  'Study protocol ID is: ' + @study_protocol_id.to_s
    @nci_id = @response_body['nci_id']
    puts  'NCI ID is: ' + @nci_id.to_s
    return @response, @response_code, @response_body, @nci_id, @study_protocol_id, @response_message
  end

  def self.trigger_update_field_values(service, service_url_method, username, password, headers, study_prtcl_id_dct, nci_id_dct, exported_from_us_dct, gender_desc_dct, seq_assignment_dct, fda_reglted_drug_dct, post_pror_aprval_dct, ped_pstmrkt_srv_dct, masking_desc_dct, fda_rglatd_divce_dct, model_desc_dct, gender_based_dct)
    service_url = ENV[service_url_method] + study_prtcl_id_dct.to_s
    @request_hash = Dataclinicaltrials_api_helper.prepare_update_values_dct_ms(study_prtcl_id_dct, nci_id_dct, exported_from_us_dct, gender_desc_dct, seq_assignment_dct, fda_reglted_drug_dct, post_pror_aprval_dct, ped_pstmrkt_srv_dct, masking_desc_dct, fda_rglatd_divce_dct, model_desc_dct, gender_based_dct)
    payload_string = @request_hash.to_json.to_s
    @response = Helper.request(service, service_url, username, password, payload_string, headers)
    @response
    @response_code = @response.code
    @response_body = JSON.parse(@response.body)
    @response_message = @response_body['message']
    puts  'PUT Message: ' + @response_message.to_s
    # @study_protocol_id = @response_body['study_protocol_id']
    # puts  'Study protocol ID is: ' + @study_protocol_id.to_s
    return @response, @response_code, @response_body, @response_message
  end

  def self.verify_fdaaa_field_values(study_prtcl_id_dct, nci_id_dct, exported_from_us_dct, gender_desc_dct, seq_assignment_dct, fda_reglted_drug_dct, post_pror_aprval_dct, ped_pstmrkt_srv_dct, masking_desc_dct, fda_rglatd_divce_dct, model_desc_dct, gender_based_dct, response)
    puts 'NCI ID expected: ' + nci_id_dct.to_s
    puts 'NCI ID actual: ' + response['nci_id']
    puts 'ex ID actual: ' + response['gender_based'].to_s
    puts 'ex ID expected: ' + gender_based_dct.to_s
    assert_equal(study_prtcl_id_dct, response['study_protocol_id'], 'Study Protocol ID' + @error_string)
    assert_equal(nci_id_dct, response['nci_id'], 'NCI ID' + @error_string)
    assert_equal(exported_from_us_dct, response['exported_from_us'].to_s, 'Exported from us' + @error_string)
    assert_equal(gender_desc_dct, response['gender_description'], 'Gender description' + @error_string)
    assert_equal(seq_assignment_dct, response['sequential_assignment'], 'Sequential assignment' + @error_string)
    assert_equal(fda_reglted_drug_dct, response['fda_regulated_drug'].to_s, 'FDA regulated drug' + @error_string)
    assert_equal(post_pror_aprval_dct, response['post_prior_to_approval'].to_s, 'Post prior to approval' + @error_string)
    assert_equal(ped_pstmrkt_srv_dct, response['ped_postmarket_surv'].to_s, 'Ped postmarket surv' + @error_string)
    assert_equal(masking_desc_dct, response['masking_description'], 'Masking description' + @error_string)
    assert_equal(fda_rglatd_divce_dct, response['fda_regulated_device'].to_s, 'FDA regulated device' + @error_string)
    assert_equal(model_desc_dct, response['model_description'], 'Model description' + @error_string)
    assert_equal(gender_based_dct, response['gender_based'].to_s, 'Gender based' + @error_string)
  end

end
