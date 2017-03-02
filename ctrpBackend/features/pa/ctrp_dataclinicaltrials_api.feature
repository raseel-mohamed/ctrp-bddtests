Feature: Tests for clinical trials api service in ctrp_dataclinicaltrials_api system

  #@ctrp_dataclinicaltrials_api
  @CTRPMICRO-79 @REST @Tests
  Scenario: DCT_API01. new field values can be recorded with NCI ID successfully
    Given I want to add following new filed values to the ctrp_dataclinicaltrials_api MS
      |nci_id                   |NCI77777                     |
      |exported_from_us         |No                           |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |11111 fda_regulated_drug     |
      |post_prior_to_approval   |11111 post_prior_to_approval |
      |ped_postmarket_surv      |11111 ped_postmarket_surv    |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |11111 fda_regulated_device   |
      |model_description        |11111 model_description      |
      |gender_based             |11111 gender_based           |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "application/json" Accept "application/json" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "201"
    And response body should include above recorded FDAAA field values

  Scenario: DCT_API02. new field values can be retrieve successfully with NCI ID
    Given following FDAAA filed values available to the ctrp_dataclinicaltrials_api MS
      |nci_id                   |NCI88888888                  |
      |exported_from_us         |No                           |
      |gender_description       |22222 gender_description     |
      |sequential_assignment    |22222 sequential_assignment  |
      |fda_regulated_drug       |22222 fda_regulated_drug     |
      |post_prior_to_approval   |22222 post_prior_to_approval |
      |ped_postmarket_surv      |22222 ped_postmarket_surv    |
      |masking_description      |22222 masking_description    |
      |fda_regulated_device     |22222 fda_regulated_device   |
      |model_description        |22222 model_description      |
      |gender_based             |22222 gender_based           |
    When I used the "GET" to ctrp_dataclinicaltrials_api MS with Content-Type "application/json" Accept "application/json" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "GET" should be "200"
    And response body should retrieved FDAAA field values

  Scenario: DCT_API03. field values cannot be posted with invalid NCI ID
    Given I want to add following FDAAA filed values to the ctrp_dataclinicaltrials_api MS with an invalid NCI ID
      |nci_id                   |DCP53452                     |
      |exported_from_us         |No                           |
      |gender_description       |33333 gender_description     |
      |sequential_assignment    |33333 sequential_assignment  |
      |fda_regulated_drug       |33333 fda_regulated_drug     |
      |post_prior_to_approval   |33333 post_prior_to_approval |
      |ped_postmarket_surv      |33333 ped_postmarket_surv    |
      |masking_description      |33333 masking_description    |
      |fda_regulated_device     |33333 fda_regulated_device   |
      |model_description        |33333 model_description      |
      |gender_based             |33333 gender_based           |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "application/json" Accept "application/json" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "403"

  Scenario: DCT_API04. retrieve field values with an invalid NCI ID will returns an error message
    Given I want to search FDAAA fields with an invalid NCI ID: "CTEP45322352"
    When I used the "GET" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "application/json" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "GET" should be "403"
    And response body should returned an error message

  Scenario: DCT_API05. updating existing field values with a valid NCI ID should be successful
    Given following FDAAA field values exists in the ctrp_dataclinicaltrials_api MS
      |nci_id                   |NCI55555555                  |
      |exported_from_us         |No                           |
      |gender_description       |55555 gender_description     |
      |sequential_assignment    |55555 sequential_assignment  |
      |fda_regulated_drug       |55555 fda_regulated_drug     |
      |post_prior_to_approval   |55555 post_prior_to_approval |
      |ped_postmarket_surv      |55555 ped_postmarket_surv    |
      |masking_description      |55555 masking_description    |
      |fda_regulated_device     |55555 fda_regulated_device   |
      |model_description        |55555 model_description      |
      |gender_based             |55555 gender_based           |
    And I want to update the "NCI55555555" trials FDAAA field values with following values
      |nci_id                   |NCI55555555                  |
      |exported_from_us         |No                           |
      |gender_description       |44444 gender_description     |
      |sequential_assignment    |44444 sequential_assignment  |
      |fda_regulated_drug       |44444 fda_regulated_drug     |
      |post_prior_to_approval   |44444 post_prior_to_approval |
      |ped_postmarket_surv      |44444 ped_postmarket_surv    |
      |masking_description      |44444 masking_description    |
      |fda_regulated_device     |44444 fda_regulated_device   |
      |model_description        |44444 model_description      |
      |gender_based             |44444 gender_based           |
    When I used the "PUT" to ctrp_dataclinicaltrials_api MS with Content-Type "application/json" Accept "application/json" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "PUT" should be "200"
    And response body should include above recorded FDAAA field values
    When I used the "GET" to ctrp_dataclinicaltrials_api MS with Content-Type "application/json" Accept "application/json" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "GET" should be "200"
    And response body should include above created Organization values

  Scenario: DCT_API06. existing field values should not be updated successfully with an invalid NCI ID
    Given following FDAAA field values exists in the ctrp_dataclinicaltrials_api MS
      |nci_id                   |NCI66666666                  |
      |exported_from_us         |No                           |
      |gender_description       |66666 gender_description     |
      |sequential_assignment    |66666 sequential_assignment  |
      |fda_regulated_drug       |66666 fda_regulated_drug     |
      |post_prior_to_approval   |66666 post_prior_to_approval |
      |ped_postmarket_surv      |66666 ped_postmarket_surv    |
      |masking_description      |66666 masking_description    |
      |fda_regulated_device     |66666 fda_regulated_device   |
      |model_description        |66666 model_description      |
      |gender_based             |66666 gender_based           |
    And I want to update the "NCI66666666" trials FDAAA field values with an invalid NCI ID "NCI6INVALID"
      |nci_id                   |NCI6INVALID                  |
      |exported_from_us         |No                           |
      |gender_description       |44444 gender_description     |
      |sequential_assignment    |44444 sequential_assignment  |
      |fda_regulated_drug       |44444 fda_regulated_drug     |
      |post_prior_to_approval   |44444 post_prior_to_approval |
      |ped_postmarket_surv      |44444 ped_postmarket_surv    |
      |masking_description      |44444 masking_description    |
      |fda_regulated_device     |44444 fda_regulated_device   |
      |model_description        |44444 model_description      |
      |gender_based             |44444 gender_based           |
    When I used the "PUT" to ctrp_dataclinicaltrials_api MS with Content-Type "application/json" Accept "application/json" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "PUT" should be "403"
    And response body should return an error message

  Scenario: DCT_API07. deleting a record with an invalid NCI ID should fail
    Given I know the FDAAA fields with valid NCI ID exists
    And I have an invalid NCI ID
    When I used invalid Study Protocol ID to "DELETE" existing FDAAA field values
    Then ctrp_dataclinicaltrials_api MS response to "DELETE" should be "403"

  Scenario: DCT_API08. field values should not be recorded with non supported NCI ID format (I.E. NCI123#432234XYZ)
    Given I want to add following FDAAA filed values to the ctrp_dataclinicaltrials_api MS with non supported NCI ID NCI123TEST432234XYZ
      |nci_id                   |NCI123TEST432234XYZ          |
      |exported_from_us         |No                           |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |11111 fda_regulated_drug     |
      |post_prior_to_approval   |11111 post_prior_to_approval |
      |ped_postmarket_surv      |11111 ped_postmarket_surv    |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |11111 fda_regulated_device   |
      |model_description        |11111 model_description      |
      |gender_based             |11111 gender_based           |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "403"

  Scenario: DCT_API09. delete a record by the NCI ID should be successful
    Given I know the FDAAA fields with valid Study Protocol ID exists
    When I used invalid Study Protocol ID to "DELETE" FDAAA field values
    Then ctrp_dataclinicaltrials_api MS response to "DELETE" should be "200"

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





