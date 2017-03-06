require_relative '../support/dataclinicaltrials_api_helper.rb'
require_relative '../support/organization_helper.rb'
require_relative '../support/helper.rb'
require 'json'
require 'rest-client'

# |study_protocol_id        |11111111                     |
# |nci_id                   |NCI77777777                  |
# |exported_from_us         |true                         |
# |gender_description       |11111 gender_description     |
# |sequential_assignment    |11111 sequential_assignment  |
# |fda_regulated_drug       |true                         |
# |post_prior_to_approval   |true                         |
# |ped_postmarket_surv      |true                         |
# |masking_description      |11111 masking_description    |
# |fda_regulated_device     |11111 fda_regulated_device   |
# |model_description        |11111 model_description      |
# |gender_based             |true                         |

Given(/^I want to add following new filed values to the ctrp_dataclinicaltrials_api MS$/) do |table|
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

When(/^I used the "([^"]*)" to ctrp_dataclinicaltrials_api MS with Content\-Type "([^"]*)" Accept "([^"]*)" for "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  headers = {:content_type => "", :accept => ""}
  service = arg1.upcase
  type = arg4.upcase
  case service
    when 'POST'
      case type
        when 'FDAAA_FIELDS'
          @response, @response_code, @response_body, @response_message = Dataclinicaltrials_api_helper.trigger_field_values_post(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @study_protocol_id, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    when 'GET'
      case type
        when 'FDAAA_FIELDS'
          puts  'Study protocol ID is: ' + @study_protocol_id
          @response, @response_code, @response_body, @nci_id, @study_protocol_id, @response_message = Dataclinicaltrials_api_helper.trigger_get_field_values(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @study_protocol_id)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    when 'PUT'
      case type
        when 'FDAAA_FIELDS'
          @response, @response_code, @response_body, @response_message = Dataclinicaltrials_api_helper.trigger_update_field_values(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @study_protocol_id, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    else
      flunk 'Please choose correct service. Provided service <<' + arg1 + '>> does not exist'
  end
end

Then(/^ctrp_dataclinicaltrials_api MS response to "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  expect(@response_code.to_s).to eq arg2
end

And(/^response body should return "([^"]*)"$/) do |arg1|
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

And(/^response body should retrieved FDAAA field values$/) do
  puts  'gen desc is: ' + @gender_description
  Dataclinicaltrials_api_helper.verify_fdaaa_field_values(@study_protocol_id, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body)
end

Given(/^I want to add following FDAAA filed values to the ctrp_dataclinicaltrials_api MS with an invalid Study Protocol ID$/) do |table|
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

Then(/^ctrp_dataclinicaltrials_api MS response to "([^"]*)" should be "([^"]*)" Bad Request$/) do |arg1, arg2|
  expect(@response_code.to_s).to eq arg2
end


Given(/^I want to search FDAAA fields with a Study Protocol ID that does not exists: "([^"]*)"$/) do |arg1|
  @study_protocol_id = arg1.to_s
end

Given(/^following FDAAA field values exists in the ctrp_dataclinicaltrials_api MS$/) do |table|
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

And(/^I want to update the "([^"]*)" trials FDAAA field values with following values$/) do |arg1, table|
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

Given(/^I want to add following FDAAA filed values along with null value to the ctrp_dataclinicaltrials_api MS$/) do |table|
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

Given(/^I want to add following FDAAA filed values along with all the null field values to the ctrp_dataclinicaltrials_api MS$/) do |table|
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


