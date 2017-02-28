#encoding: utf-8
@ctrp_dataclinicaltrials_api
Feature: Tests for clinical trials api service in ctrp_dataclinicaltrials_api system

  Scenario: DCT_API01. new field values can be recorded with NCI ID successfully

  Scenario: DCT_API02. new field values can be retrieve successfully with NCI ID

  Scenario: DCT_API03. field values cannot be posted with invalid NCI ID

  Scenario: DCT_API04. retrieve field values with an invalid NCI ID will returns an error message

  Scenario: DCT_API05. updating existing field values with a valid NCI ID should be successful

  Scenario: DCT_API06. existing field values should not be updated successfully with an invalid NCI ID

  Scenario: DCT_API07. deleting a record with an invalid NCI ID should fail

  Scenario: DCT_API08. field values should not be recorded with non supported NCI ID format (I.E. NCI123#432234XYZ)

  Scenario: DCT_API09. delete a record by the NCI ID should be successful

  Scenario: DCT_API10. field values can be posted as null and should be successful

  Scenario: DCT_API11. none of the fields are required as per MS

  Scenario: DCT_API12. extra key-value pair in the message body should NOT fail

  |fda_regulated_drug     |11111 fda_regulated_drug     |
  |fda_regulated_device   |11111 fda_regulated_device   |
  |post_prior_to_approval |11111 post_prior_to_approval |
  |ped_postmarket_surv    |11111 ped_postmarket_surv    |
  |exported_from_us       |11111 sequential             |
  |sequential_assignment  |11111 sequential_assignment  |
  |model_description      |11111 model_description      |
  |masking_description    |11111 masking_description    |
  |gender_based           |11111 gender_based           |
  |gender_description     |11111 gender_description     |
  |extra_fields           |This is extra fields         |





