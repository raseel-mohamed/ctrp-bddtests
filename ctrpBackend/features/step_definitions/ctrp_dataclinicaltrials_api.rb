require_relative '../support/dataclinicaltrials_api_helper.rb'
require_relative '../support/organization_helper.rb'
require_relative '../support/helper.rb'
require 'json'
require 'rest-client'

# |nci_id                   |NCI77777                     |
# |exported_from_us         |No                           |
# |gender_description       |22222 gender_description     |
# |sequential_assignment    |22222 sequential_assignment  |
# |fda_regulated_drug       |22222 fda_regulated_drug     |
# |post_prior_to_approval   |22222 post_prior_to_approval |
# |ped_postmarket_surv      |22222 ped_postmarket_surv    |
# |masking_description      |22222 masking_description    |
# |fda_regulated_device     |22222 fda_regulated_device   |
# |model_description        |22222 model_description      |
# |gender_based             |22222 gender_based           |

Given(/^I want to add following new filed values to the ctrp_dataclinicaltrials_api MS$/) do |table|
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
  headers = {:content_type => arg2, :accept => arg3}
  service = arg1.upcase
  type = arg4.upcase
  case service
    when 'POST'
      case type
        when 'FDAAA_FIELDS'
          @response, @response_code, @response_body, @nci_id = Dataclinicaltrials_api_helper.trigger_field_values_post(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    when 'GET'
      case type
        when 'FDAAA_FIELDS'
          @response, @response_code, @response_body, @nci_id = Dataclinicaltrials_api_helper.trigger_get_field_values(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @nci_id)
        else
          flunk 'Please provide correct type. Provided type <<' + arg4 + '>> does not exist'
      end
    when 'PUT'
      case type
        when 'FDAAA_FIELDS'
          @response, @response_code, @response_body, @nci_id = Dataclinicaltrials_api_helper.trigger_update_field_values(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
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

And(/^response body should include above recorded FDAAA field values$/) do
  Dataclinicaltrials_api_helper.verify_fdaaa_field_values(@nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body)
end


Given(/^following FDAAA filed values available to the ctrp_dataclinicaltrials_api MS$/) do |table|
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
  #POST
  headers = {:content_type => 'application/json', :accept => 'application/json'}
  @response, @response_code, @response_body, @nci_id = Dataclinicaltrials_api_helper.trigger_field_values_post(service, 'dataclinicaltrials_ms', ENV['dct_usr'], ENV['dct_pass'], headers, @nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based)
  puts 'Response code for added FDAAA fields: ' + @response.code.to_s
  @response_body = JSON.parse(@response.body)
  @nci_id = @response_body['nci_id']
  puts 'NCI ID is: ' + @nci_id.to_s
end

And(/^response body should retrieved FDAAA field values$/) do
  Dataclinicaltrials_api_helper.verify_fdaaa_field_values(@nci_id, @exported_from_us, @gender_description, @sequential_assignment, @fda_regulated_drug, @post_prior_to_approval, @ped_postmarket_surv, @masking_description, @fda_regulated_device, @model_description, @gender_based, @response_body)
end

Given(/^I want to add following FDAAA filed values to the ctrp_dataclinicaltrials_api MS with an invalid NCI ID$/) do |table|
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

