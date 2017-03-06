Feature: Tests for clinical trials api service in ctrp_dataclinicaltrials_api system

  #@ctrp_dataclinicaltrials_api
  @CTRPMICRO-79 @REST @Tests @PA_HIGH
  Scenario: DCT_API01. new field values can be recorded with Study Protocol ID successfully
    Given I want to add following new filed values to the ctrp_dataclinicaltrials_api MS
      |study_protocol_id        |11111111                     |
      |nci_id                   |NCI77777777                  |
      |exported_from_us         |true                         |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |11111 fda_regulated_device   |
      |model_description        |11111 model_description      |
      |gender_based             |false                        |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "200"
    And response body should return "Data has been updated successfully"

  @CTRPMICRO-80 @REST @Tests @PA_HIGH
  Scenario: DCT_API02. new field values can be retrieve successfully with Study Protocol ID
    Given following FDAAA filed values available to the ctrp_dataclinicaltrials_api MS
      |study_protocol_id        |22222222                     |
      |nci_id                   |NCI88888888                  |
      |exported_from_us         |true                         |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |false                        |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |11111 model_description      |
      |gender_based             |true                         |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "200"
    When I used the "GET" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "GET" should be "200"
    And response body should retrieved FDAAA field values

  @CTRPMICRO-81 @REST @Tests @PA_MEDIUM
  Scenario: DCT_API03. field values cannot be posted with invalid Study Protocol ID
    Given I want to add following FDAAA filed values to the ctrp_dataclinicaltrials_api MS with an invalid Study Protocol ID
      |study_protocol_id        |Test                         |
      |nci_id                   |NCI44444444                  |
      |exported_from_us         |true                         |
      |gender_description       |44444 gender_description     |
      |sequential_assignment    |44444 sequential_assignment  |
      |fda_regulated_drug       |false                        |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |44444 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |44444 model_description      |
      |gender_based             |true                         |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "400" Bad Request

  @CTRPMICRO-82 @REST @Tests @PA_MEDIUM
  Scenario: DCT_API04. retrieve FDAAA field values with a Study Protocol ID that does not exist will return an error message
    Given I want to search FDAAA fields with a Study Protocol ID that does not exists: "12122017NOTEXIST"
    When I used the "GET" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "GET" should be "404"
    And response body should return "No Data with the following Study Protocol ID"

  Scenario: DCT_API05. update existing FDAAA field values should be successful with Study protocol ID
    Given following FDAAA field values exists in the ctrp_dataclinicaltrials_api MS
      |study_protocol_id        |55555555                     |
      |nci_id                   |NCI55555555                  |
      |exported_from_us         |true                         |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |true   |
      |model_description        |11111 model_description      |
      |gender_based             |false                        |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "200"
    And I want to update the "55555555" trials FDAAA field values with following values
      |study_protocol_id        |55555555                     |
      |nci_id                   |NCI55555555                  |
      |exported_from_us         |true                         |
      |gender_description       |55555 gender_description     |
      |sequential_assignment    |55555 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |false                        |
      |ped_postmarket_surv      |true                         |
      |masking_description      |55555 masking_description    |
      |fda_regulated_device     |false   |
      |model_description        |55555 model_description      |
      |gender_based             |true                         |
    When I used the "PUT" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "PUT" should be "200"
    And response body should include "Message has been processed successfully"
    When I used the "GET" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "GET" should be "200"
    And response body should retrieved FDAAA field values

  @on_hold
  Scenario: DCT_API06. existing field values should not be updated successfully with an invalid Study Protocol ID
    Given following FDAAA field values exists in the ctrp_dataclinicaltrials_api MS
      |study_protocol_id        |33333333                     |
      |nci_id                   |NCI33333333                  |
      |exported_from_us         |true                         |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |11111 fda_regulated_device   |
      |model_description        |11111 model_description      |
      |gender_based             |false                        |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "200"
    And I want to update the "33333333" trials FDAAA field values with following values
      |study_protocol_id        |INVALID                      |
      |nci_id                   |NCI33333333                  |
      |exported_from_us         |false                        |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |false                        |
      |post_prior_to_approval   |false                        |
      |ped_postmarket_surv      |false                        |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |11111 fda_regulated_device   |
      |model_description        |11111 model_description      |
      |gender_based             |false                        |
    When I used the "PUT" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "PUT" should be "403"
    And response body should return an error message

  @on_hold
  Scenario: DCT_API07. deleting a record with an invalid Study Protocol ID should fail
    Given I know the FDAAA fields with valid Study Protocol ID exists
    And I have an invalid Study Protocol ID
    When I used invalid Study Protocol ID to "DELETE" existing FDAAA field values
    Then ctrp_dataclinicaltrials_api MS response to "DELETE" should be "403"

  @on_hold
  Scenario: DCT_API08. field values should not be recorded with non supported Study Protocol ID format (I.E. NCI123#432234XYZ)
    Given I want to add following FDAAA filed values to the ctrp_dataclinicaltrials_api MS with non supported Study Protocol ID NCI123TEST432234XYZ
      |study_protocol_id        |NCI123TEST432234XYZ          |
      |nci_id                   |NCI10101010                  |
      |exported_from_us         |true                         |
      |gender_description       |10101 gender_description     |
      |sequential_assignment    |10101 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |10101 masking_description    |
      |fda_regulated_device     |10101 fda_regulated_device   |
      |model_description        |10101 model_description      |
      |gender_based             |false                        |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "403"

  @on_hold
  Scenario: DCT_API09. delete a record by the Study Protocol ID should be successful
    Given I know the FDAAA fields with valid Study Protocol ID exists
    When I used invalid Study Protocol ID to "DELETE" FDAAA field values
    Then ctrp_dataclinicaltrials_api MS response to "DELETE" should be "200"

  Scenario: DCT_API10. field values can be posted as null and should be successful
    Given I want to add following FDAAA filed values along with null value to the ctrp_dataclinicaltrials_api MS
      |study_protocol_id        |20202020                     |
      |nci_id                   |NCI10101010                  |
      |exported_from_us         |true                         |
      |gender_description       |                             |
      |sequential_assignment    |                             |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |                             |
      |fda_regulated_device     |                             |
      |model_description        |                             |
      |gender_based             |false                        |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "200"
    And response body should return "Data has been updated successfully"


  Scenario: DCT_API11. none of the fields are required as per MS
    Given I want to add following FDAAA filed values along with all the null field values to the ctrp_dataclinicaltrials_api MS
      |study_protocol_id        |90909090                     |
      |nci_id                   |                             |
      |exported_from_us         |                             |
      |gender_description       |                             |
      |sequential_assignment    |                             |
      |fda_regulated_drug       |                             |
      |post_prior_to_approval   |                             |
      |ped_postmarket_surv      |                             |
      |masking_description      |                             |
      |fda_regulated_device     |                             |
      |model_description        |                             |
      |gender_based             |                             |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "200"
    And response body should return "Data has been updated successfully"

  Scenario: DCT_API12. extra key-value pair in the message body should NOT fail
    Given I want to add following FDAAA filed values to the ctrp_dataclinicaltrials_api MS with extra fields
      |study_protocol_id        |40404040                     |
      |nci_id                   |NCI40404040                  |
      |exported_from_us         |true                         |
      |gender_description       |40404 gender_description     |
      |sequential_assignment    |40404 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |40404 masking_description    |
      |fda_regulated_device     |40404 fda_regulated_device   |
      |model_description        |40404 model_description      |
      |extra_field              |This is extra field          |
    When I used the "POST" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "POST" should be "200"
    And response body should return "Data has been updated successfully"
    When I used the "GET" to ctrp_dataclinicaltrials_api MS with Content-Type "" Accept "" for "FDAAA_FIELDS"
    Then ctrp_dataclinicaltrials_api MS response to "GET" should be "200"
    And response body should include above recorded FDAAA field values except extra fields values and keys






