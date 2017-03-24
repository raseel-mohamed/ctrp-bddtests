require_relative '../support/dataclinicaltrials_api_helper.rb'
require_relative '../support/organization_helper.rb'
require_relative '../support/helper.rb'
require 'json'
require 'rest-client'

Given(/^I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and NCI ID$/) do |table|
  time = Time.new
  @build_protocol_id = time.year.to_s+time.day.to_s+time.month.to_s+time.hour.to_s+time.min.to_s+time.sec.to_s+time.usec.to_s
  @check_study_protocol_id = table.rows_hash['study_protocol_id']
  if @check_study_protocol_id == 'generate'
    @study_protocol_id = @build_protocol_id
  else
    @study_protocol_id = table.rows_hash['study_protocol_id']
  end
  #@study_protocol_id = table.rows_hash['study_protocol_id']
  @nci_id = table.rows_hash['nci_id']
  @exported_from_us = table.rows_hash['exported_from_us']
  @gender_description = table.rows_hash['gender_description']
  @sequential_assignment = table.rows_hash['sequential_assignment']
  @fda_regulated_drug = table.rows_hash['fda_regulated_drug']
  @post_prior_to_approval = table.rows_hash['post_prior_to_approval']
  @ped_postmarket_surv = table.rows_hash['ped_postmarket_surv']
  @masking_description = table.rows_hash['masking_description']
  @fda_regulated_device = table.rows_hash['fda_regulated_device']
  @model_description = table.rows_hash['model_description']
  @gender_based = table.rows_hash['gender_based']
end

Given(/^I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and Trial ID$/) do |table|
  time = Time.new
  @build_protocol_id = time.year.to_s+time.day.to_s+time.month.to_s+time.hour.to_s+time.min.to_s+time.sec.to_s+time.usec.to_s
  @check_study_protocol_id = table.rows_hash['study_protocol_id']
  if @check_study_protocol_id == 'generate'
    @study_protocol_id = @build_protocol_id
  else
    @study_protocol_id = table.rows_hash['study_protocol_id']
  end
  @trial_ide_ind_id = table.rows_hash['trial_ide_ind_id']
  @exported_from_us = table.rows_hash['exported_from_us']
  @gender_description = table.rows_hash['gender_description']
  @sequential_assignment = table.rows_hash['sequential_assignment']
  @fda_regulated_drug = table.rows_hash['fda_regulated_drug']
  @post_prior_to_approval = table.rows_hash['post_prior_to_approval']
  @ped_postmarket_surv = table.rows_hash['ped_postmarket_surv']
  @masking_description = table.rows_hash['masking_description']
  @fda_regulated_device = table.rows_hash['fda_regulated_device']
  @model_description = table.rows_hash['model_description']
  @gender_based = table.rows_hash['gender_based']
end

Given(/^I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID, NCI_ID and Trial ID$/) do |table|
  time = Time.new
  @build_protocol_id = time.year.to_s+time.day.to_s+time.month.to_s+time.hour.to_s+time.min.to_s+time.sec.to_s+time.usec.to_s
  @check_study_protocol_id = table.rows_hash['study_protocol_id']
  if @check_study_protocol_id == 'generate'
    @study_protocol_id = @build_protocol_id
  else
    @study_protocol_id = table.rows_hash['study_protocol_id']
  end
  @nci_id = table.rows_hash['nci_id']
  @trial_ide_ind_id = table.rows_hash['trial_ide_ind_id']
  @exported_from_us = table.rows_hash['exported_from_us']
  @gender_description = table.rows_hash['gender_description']
  @sequential_assignment = table.rows_hash['sequential_assignment']
  @fda_regulated_drug = table.rows_hash['fda_regulated_drug']
  @post_prior_to_approval = table.rows_hash['post_prior_to_approval']
  @ped_postmarket_surv = table.rows_hash['ped_postmarket_surv']
  @masking_description = table.rows_hash['masking_description']
  @fda_regulated_device = table.rows_hash['fda_regulated_device']
  @model_description = table.rows_hash['model_description']
  @gender_based = table.rows_hash['gender_based']
end

When(/^"([^"]*)" to CTRP Data Clinical Trials API with Content-Type "([^"]*)" Accept "([^"]*)" by the "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  headers = {:content_type => arg2, :accept => arg3}
  service = arg1.upcase
  type = arg4.upcase
  case service
    when 'POST'
      case type
        when 'STUDY_PROTOCOL_ID_AND_NCI_ID'
          #@post_endpoint_condition='?study_protocol_id='+@study_protocol_id+'&nci_id='+@nci_id+''
          @post_endpoint_condition='/'
          @response, @response_code, @response_body, @id, @nci_id, @study_protocol_id, @response_message = Dataclinicaltrials_api_helper.trigger_study_nci_post(service, 'dataclinicaltrials_ms', @post_endpoint_condition, ENV['dct_usr'], ENV['dct_pass'], headers, @study_protocol_id, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
        when 'STUDY_PROTOCOL_ID_AND_TRIAL_ID'
          @post_endpoint_condition='/'
          @response, @response_code, @response_body, @id, @trial_id, @study_protocol_id, @response_message = Dataclinicaltrials_api_helper.trigger_study_trial_post(service, 'dataclinicaltrials_ms', @post_endpoint_condition, ENV['dct_usr'], ENV['dct_pass'], headers, @study_protocol_id, @trial_ide_ind_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
        when 'STUDY_PROTOCOL_NCI_TRIAL_ID'
          @post_endpoint_condition='/'
          @msg_s_p_id = @study_protocol_id
          @msg_nci_id = @nci_id
          @response, @response_code, @response_body, @response_message = Dataclinicaltrials_api_helper.trigger_study_nci_trial_post(service, 'dataclinicaltrials_ms', @post_endpoint_condition, ENV['dct_usr'], ENV['dct_pass'], headers, @study_protocol_id, @nci_id, @trial_ide_ind_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    when 'GET'
      case type
        when 'STUDY_PROTOCOL_ID_AND_NCI_ID'
          @response_body
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_nci_id = @nci_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='?study_protocol_id='+@conv_s_p_id+'&nci_id='+@conv_nci_id+''
          @response, @response_code, @response_body, @id, @nci_id, @trial_id, @study_protocol_id, @response_message = Dataclinicaltrials_api_helper.trigger_get_field_values(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type)
        when 'STUDY_PROTOCOL_ID_AND_TRIAL_ID'
          @response_body
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_trial_id = @trial_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='?study_protocol_id='+@conv_s_p_id+'&trial_ide_ind_id='+@conv_trial_id+''
          @response, @response_code, @response_body, @id, @nci_id, @trial_id, @study_protocol_id, @response_message = Dataclinicaltrials_api_helper.trigger_get_field_values(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type)
        when 'ID'
          @response_body
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_trial_id = @trial_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='/'+@conv_id
          @response, @response_code, @response_body, @id, @nci_id, @trial_id, @study_protocol_id, @response_message = Dataclinicaltrials_api_helper.trigger_get_field_values(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    when 'PUT'
      case type
        when 'STUDY_PROTOCOL_ID_AND_NCI_ID'
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_nci_id = @nci_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='/'+@conv_id+''
          @response, @response_code, @response_body, @id, @nci_id, @study_protocol_id, @response_message = Dataclinicaltrials_api_helper.trigger_update_study_nci(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type, @conv_id, @study_protocol_id, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
        when 'STUDY_PROTOCOL_ID_AND_TRIAL_ID'
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_trial_id = @trial_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='/'+@conv_id+''
          @response, @response_code, @response_body, @id, @trial_id, @study_protocol_id, @response_message = Dataclinicaltrials_api_helper.trigger_update_study_trial(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type, @conv_id, @study_protocol_id, @trial_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
        when 'INVALID_SYSTEM_ID'
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_trial_id = @trial_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='/'+@conv_id+''
          @response, @response_code, @response_body, @id, @trial_id, @study_protocol_id, @response_message = Dataclinicaltrials_api_helper.trigger_update_study_trial(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type, @conv_id, @study_protocol_id, @trial_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    when 'DELETE'
      case type
        when 'STUDY_PROTOCOL_ID_AND_NCI_ID'
          @response_body
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_nci_id = @nci_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='?study_protocol_id='+@conv_s_p_id+'&nci_id='+@conv_nci_id+''
          @response, @response_code, @response_body, @response_message = Dataclinicaltrials_api_helper.trigger_delete(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type)
        when 'STUDY_PROTOCOL_ID_AND_TRIAL_ID'
          @response_body
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_trial_id = @trial_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='?study_protocol_id='+@conv_s_p_id+'&trial_ide_ind_id='+@conv_trial_id+''
          @response, @response_code, @response_body, @response_message = Dataclinicaltrials_api_helper.trigger_delete(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type)
        when 'ID'
          @response_body
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_trial_id = @trial_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='/'+@conv_id
          @response, @response_code, @response_body, @response_message = Dataclinicaltrials_api_helper.trigger_delete(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type)
        when 'INVALID_SYSTEM_ID'
          @response_body
          @conv_s_p_id = @study_protocol_id.to_s
          @conv_trial_id = @trial_id.to_s
          @conv_id = @id.to_s
          @post_endpoint_condition='/INVALID'+@conv_id
          @response, @response_code, @response_body, @response_message = Dataclinicaltrials_api_helper.trigger_delete(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @post_endpoint_condition, type)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    else
      flunk 'Please choose correct service. Provided service <<' + arg1 + '>> does not exist'
  end
end

Then(/^CTRP Data Clinical Trials API response to "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  @msg = @response
  @test_nci_id = @nci_id
  expect(@response_code.to_s).to eq arg2
end

And(/^response body should return an empty json structure "([^"]*)"$/) do |arg1|
  @msg = @response.to_s
  expect(@response.to_s).to include arg1
end

And(/^response body should return "([^"]*)"$/) do |arg1|
  @msg = @response_message.to_s
  expect(@response_message.to_s).to include arg1
end

And(/^response body should include "([^"]*)"$/) do |arg1|
  expect(@response_message.to_s).to include arg1
end

And(/^response body should include above recorded FDAAA field values$/) do
  #Dataclinicaltrials_api_helper.verify_fdaaa_field_values(@nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body)
end


Given(/^following FDAAA filed values available to the ctrp_dataclinicaltrials_api MS$/) do |table|
  @study_protocol_id = table.rows_hash['study_protocol_id']
  @nci_id = table.rows_hash['nci_id']
  @exported_from_us = table.rows_hash['exported_from_us']
  @gender_description = table.rows_hash['gender_description']
  @sequential_assignment = table.rows_hash['sequential_assignment']
  @fda_regulated_drug = table.rows_hash['fda_regulated_drug']
  @post_prior_to_approval = table.rows_hash['post_prior_to_approval']
  @ped_postmarket_surv = table.rows_hash['ped_postmarket_surv']
  @masking_description = table.rows_hash['masking_description']
  @fda_regulated_device = table.rows_hash['fda_regulated_device']
  @model_description = table.rows_hash['model_description']
  @gender_based = table.rows_hash['gender_based']
end

And(/^response body should includes updated FDAAA field values for "([^"]*)"$/) do |arg1|
  Dataclinicaltrials_api_helper.verify_fdaaa_updates(@study_protocol_id, @nci_id, @trial_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body, arg1)
end

And(/^response body should includes updated FDAAA field values$/) do
  Dataclinicaltrials_api_helper.verify_fdaaa_updates(@study_protocol_id, @trial_id, '', @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body, 'STUDY_PROTOCOL_ID_AND_NCI_ID')
end

And(/^response body should includes FDAAA field values with Study Protocol ID and NCI ID$/) do
  Dataclinicaltrials_api_helper.verify_fdaaa_values(@study_protocol_id, @nci_id, '', @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body, 'STUDY_PROTOCOL_ID_AND_NCI_ID')
end

And(/^response body should includes FDAAA field values with Study Protocol ID and Trial ID$/) do
  Dataclinicaltrials_api_helper.verify_fdaaa_values(@study_protocol_id, '', @trial_ide_ind_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body, 'STUDY_PROTOCOL_ID_AND_TRIAL_ID')
end

And(/^response body should retrieved FDAAA field values$/) do
  puts  'gen desc is: ' + @gender_description
  Dataclinicaltrials_api_helper.verify_fdaaa_field_values(@study_protocol_id, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body)
end

Given(/^I want to search FDAAA fields with a Study Protocol ID that does not exists: "([^"]*)"$/) do |arg1|
  @study_protocol_id = arg1.to_s
  @nci_id = 'NCT55555555'
end

Given(/^I want to update following new FDAAA filed values to the CTRP Data Clinical Trials Service by the ID$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  time = Time.new
  @build_id = time.year.to_s+time.day.to_s+time.month.to_s+time.hour.to_s+time.min.to_s+time.sec.to_s+time.usec.to_s
  @check_study_protocol_id = table.rows_hash['study_protocol_id']
  if @check_study_protocol_id == 'generate'
    @study_protocol_id = @build_id
  end
  #@study_protocol_id = table.rows_hash['study_protocol_id']
  @nci_id = table.rows_hash['nci_id']
  @exported_from_us = table.rows_hash['exported_from_us']
  @gender_description = table.rows_hash['gender_description']
  @sequential_assignment = table.rows_hash['sequential_assignment']
  @fda_regulated_drug = table.rows_hash['fda_regulated_drug']
  @post_prior_to_approval = table.rows_hash['post_prior_to_approval']
  @ped_postmarket_surv = table.rows_hash['ped_postmarket_surv']
  @masking_description = table.rows_hash['masking_description']
  @fda_regulated_device = table.rows_hash['fda_regulated_device']
  @model_description = table.rows_hash['model_description']
  @gender_based = table.rows_hash['gender_based']
end

Given(/^update following FDAAA filed values for "([^"]*)" and "([^"]*)" to the CTRP Data Clinical Trials Service with the invalid system ID "([^"]*)"$/) do |arg1, arg2, arg3, table|
  # table is a Cucumber::Core::Ast::DataTable
  @id = arg3.to_s
  time = Time.new
  @build_id = time.year.to_s+time.day.to_s+time.month.to_s+time.hour.to_s+time.min.to_s+time.sec.to_s+time.usec.to_s
  @check_study_protocol_id = table.rows_hash['study_protocol_id']
  if @check_study_protocol_id == 'generate'
    @study_protocol_id = @build_id
  end
  #@study_protocol_id = table.rows_hash['study_protocol_id']
  @trial_ide_ind_id = table.rows_hash['trial_ide_ind_id']
  @exported_from_us = table.rows_hash['exported_from_us']
  @gender_description = table.rows_hash['gender_description']
  @sequential_assignment = table.rows_hash['sequential_assignment']
  @fda_regulated_drug = table.rows_hash['fda_regulated_drug']
  @post_prior_to_approval = table.rows_hash['post_prior_to_approval']
  @ped_postmarket_surv = table.rows_hash['ped_postmarket_surv']
  @masking_description = table.rows_hash['masking_description']
  @fda_regulated_device = table.rows_hash['fda_regulated_device']
  @model_description = table.rows_hash['model_description']
  @gender_based = table.rows_hash['gender_based']
end

Given(/^I want to update following new FDAAA filed values for "([^"]*)" and "([^"]*)" to the CTRP Data Clinical Trials Service by the ID$/) do |arg1, arg2, table|
  # table is a Cucumber::Core::Ast::DataTable
  time = Time.new
  @build_id = time.year.to_s+time.day.to_s+time.month.to_s+time.hour.to_s+time.min.to_s+time.sec.to_s+time.usec.to_s
  @check_study_protocol_id = table.rows_hash['study_protocol_id']
  if @check_study_protocol_id == 'generate'
    @study_protocol_id = @build_id
  end
  #@study_protocol_id = table.rows_hash['study_protocol_id']
  @trial_ide_ind_id = table.rows_hash['trial_ide_ind_id']
  @exported_from_us = table.rows_hash['exported_from_us']
  @gender_description = table.rows_hash['gender_description']
  @sequential_assignment = table.rows_hash['sequential_assignment']
  @fda_regulated_drug = table.rows_hash['fda_regulated_drug']
  @post_prior_to_approval = table.rows_hash['post_prior_to_approval']
  @ped_postmarket_surv = table.rows_hash['ped_postmarket_surv']
  @masking_description = table.rows_hash['masking_description']
  @fda_regulated_device = table.rows_hash['fda_regulated_device']
  @model_description = table.rows_hash['model_description']
  @gender_based = table.rows_hash['gender_based']
end

Given(/^I want to add following FDAAA filed values to the ctrp_dataclinicaltrials_api MS with extra fields$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  @study_protocol_id = table.rows_hash['study_protocol_id']
  @nci_id = table.rows_hash['nci_id']
  @exported_from_us = table.rows_hash['exported_from_us']
  @gender_description = table.rows_hash['gender_description']
  @sequential_assignment = table.rows_hash['sequential_assignment']
  @fda_regulated_drug = table.rows_hash['fda_regulated_drug']
  @post_prior_to_approval = table.rows_hash['post_prior_to_approval']
  @ped_postmarket_surv = table.rows_hash['ped_postmarket_surv']
  @masking_description = table.rows_hash['masking_description']
  @fda_regulated_device = table.rows_hash['fda_regulated_device']
  @model_description = table.rows_hash['model_description']
  @gender_based = table.rows_hash['gender_based']
end

And(/^response body should include above recorded FDAAA field values except extra fields values and keys$/) do
  puts  'gen desc is: ' + @gender_description
  Dataclinicaltrials_api_helper.verify_fdaaa_field_values(@study_protocol_id, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body)
end

Given(/^I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with null values$/) do |table|
  time = Time.new
  @build_protocol_id = time.year.to_s+time.day.to_s+time.month.to_s+time.hour.to_s+time.min.to_s+time.sec.to_s+time.usec.to_s
  @check_study_protocol_id = table.rows_hash['study_protocol_id']
  if @check_study_protocol_id == 'generate'
    @study_protocol_id = @build_protocol_id
  else
    @study_protocol_id = table.rows_hash['study_protocol_id']
  end
  #@study_protocol_id = table.rows_hash['study_protocol_id']
  @nci_id = table.rows_hash['nci_id']
  @exported_from_us = table.rows_hash['exported_from_us']
  @gender_description = table.rows_hash['gender_description']
  @sequential_assignment = table.rows_hash['sequential_assignment']
  @fda_regulated_drug = table.rows_hash['fda_regulated_drug']
  @post_prior_to_approval = table.rows_hash['post_prior_to_approval']
  @ped_postmarket_surv = table.rows_hash['ped_postmarket_surv']
  @masking_description = table.rows_hash['masking_description']
  @fda_regulated_device = table.rows_hash['fda_regulated_device']
  @model_description = table.rows_hash['model_description']
  @gender_based = table.rows_hash['gender_based']
end


