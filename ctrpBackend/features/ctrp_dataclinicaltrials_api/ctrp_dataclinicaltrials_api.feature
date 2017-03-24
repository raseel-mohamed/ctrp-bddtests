@DCT_API
Feature: Tests for clinical trials api service in ctrp_dataclinicaltrials_api system

  #@ctrp_dataclinicaltrials_api
  @CTRPMICRO-79 @REST @Tests @DCT_HIGH
  Scenario: DCT_API01. new field values can be recorded with Study Protocol ID and NCI ID successfully
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and NCI ID
      |study_protocol_id        |generate                     |
      |nci_id                   |NCI77777777                  |
      |exported_from_us         |true                         |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |11111 model_description      |
      |gender_based             |false                        |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    And response body should return "Data has been created."

  @CTRPMICRO-80 @REST @Tests @DCT_HIGH
  Scenario: DCT_API02. new field values can be recorded with Study Protocol ID and Trial ID successfully
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and Trial ID
      |study_protocol_id        |generate                     |
      |trial_ide_ind_id         |NCT88888888                  |
      |exported_from_us         |false                        |
      |gender_description       |88888 gender_description     |
      |sequential_assignment    |88888 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |false                        |
      |ped_postmarket_surv      |true                         |
      |masking_description      |88888 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |88888 model_description      |
      |gender_based             |true                         |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_TRIAL_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    And response body should return "Data has been created."

  @CTRPMICRO-81 @REST @Tests @DCT_MEDIUM
  Scenario: DCT_API03. new FDAAA field values can not be recorded with Study Protocol ID, NCI_ID and Trial ID
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID, NCI_ID and Trial ID
      |study_protocol_id        |generate                     |
      |nci_id                   |NCI99999999                  |
      |trial_ide_ind_id         |NCT99999999                  |
      |exported_from_us         |true                         |
      |gender_description       |99999 gender_description     |
      |sequential_assignment    |99999 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |99999 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |99999 model_description      |
      |gender_based             |false                        |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_NCI_TRIAL_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "400"
    And response body should return "Bad Request... Missing study_protocol_id with nci_id) OR (not AND) (study_protocol_id with trial_ide_ind_id."

  @CTRPMICRO-82 @REST @Tests @DCT_HIGH
  Scenario: DCT_API04. new FDAAA field values can be retrieve successfully with Study Protocol ID and NCI ID
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and NCI ID
      |study_protocol_id        |generate                     |
      |nci_id                   |NCI22222222                  |
      |exported_from_us         |true                         |
      |gender_description       |22222 gender_description     |
      |sequential_assignment    |22222 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |22222 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |22222 model_description      |
      |gender_based             |false                        |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    When "GET" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "GET" should be "200"
    And response body should includes FDAAA field values with Study Protocol ID and NCI ID

  @CTRPMICRO-83 @REST @Tests @DCT_HIGH
  Scenario: DCT_API05. new FDAAA field values can be retrieve successfully with Study Protocol ID and Trial ID
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and Trial ID
      |study_protocol_id        |generate                     |
      |trial_ide_ind_id         |NCT33333333                  |
      |exported_from_us         |false                        |
      |gender_description       |33333 gender_description     |
      |sequential_assignment    |33333 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |false                        |
      |ped_postmarket_surv      |true                         |
      |masking_description      |33333 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |33333 model_description      |
      |gender_based             |true                         |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_TRIAL_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    When "GET" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_TRIAL_ID"
    Then CTRP Data Clinical Trials API response to "GET" should be "200"
    And response body should includes FDAAA field values with Study Protocol ID and Trial ID

  @CTRPMICRO-84 @REST @Tests @DCT_MEDIUM
  Scenario: DCT_API06. retrieve FDAAA field values with a Study Protocol ID and NCI ID that does not exist will return an error message
    Given I want to search FDAAA fields with a Study Protocol ID that does not exists: "12122017NOTEXIST"
    When "GET" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "GET" should be "200"
    And response body should return an empty json structure "[]"

  @CTRPMICRO-85 @REST @Tests @DCT_HIGH
  Scenario: DCT_API07. existing FDAAA field values for "STUDY PROTOCOL ID" and "NCI ID" should be updated with system ID
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and NCI ID
      |study_protocol_id        |generate                     |
      |nci_id                   |NCI77777777                  |
      |exported_from_us         |true                         |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |11111 model_description      |
      |gender_based             |false                        |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    And response body should return "Data has been created."
    When "GET" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "GET" should be "200"
    And response body should includes FDAAA field values with Study Protocol ID and NCI ID
    Given I want to update following new FDAAA filed values to the CTRP Data Clinical Trials Service by the ID
      |study_protocol_id        |get                          |
      |nci_id                   |NCI77777777                  |
      |exported_from_us         |false                        |
      |gender_description       |22222 gender_description     |
      |sequential_assignment    |22222 sequential_assignment  |
      |fda_regulated_drug       |false                        |
      |post_prior_to_approval   |false                        |
      |ped_postmarket_surv      |fasle                        |
      |masking_description      |22222 masking_description    |
      |fda_regulated_device     |false                        |
      |model_description        |22222 model_description      |
      |gender_based             |true                         |
    When "PUT" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "200"
    And response body should includes updated FDAAA field values for "STUDY_PROTOCOL_ID_AND_NCI_ID"

  @CTRPMICRO-86 @REST @Tests @DCT_HIGH
  Scenario: DCT_API08. existing FDAAA field values for "STUDY PROTOCOL ID" and "TRIAL ID" should be updated with system ID
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and Trial ID
      |study_protocol_id        |generate                     |
      |trial_ide_ind_id         |NCT88888888                  |
      |exported_from_us         |false                        |
      |gender_description       |88888 gender_description     |
      |sequential_assignment    |88888 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |false                        |
      |ped_postmarket_surv      |true                         |
      |masking_description      |88888 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |88888 model_description      |
      |gender_based             |true                         |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_TRIAL_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    And response body should return "Data has been created."
    When "GET" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_TRIAL_ID"
    Then CTRP Data Clinical Trials API response to "GET" should be "200"
    And response body should includes FDAAA field values with Study Protocol ID and Trial ID
    Given I want to update following new FDAAA filed values for "STUDY PROTOCOL ID" and "TRIAL ID" to the CTRP Data Clinical Trials Service by the ID
      |study_protocol_id        |get                          |
      |trial_ide_ind_id         |NCT99999999                  |
      |exported_from_us         |true                         |
      |gender_description       |99999 gender_description     |
      |sequential_assignment    |99999 sequential_assignment  |
      |fda_regulated_drug       |false                        |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |false                        |
      |masking_description      |99999 masking_description    |
      |fda_regulated_device     |false                        |
      |model_description        |99999 model_description      |
      |gender_based             |false                        |
    When "PUT" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_TRIAL_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "200"
    And response body should includes updated FDAAA field values for "STUDY_PROTOCOL_ID_AND_TRIAL_ID"

  @CTRPMICRO-87 @REST @Tests @DCT_MEDIUM
  Scenario: DCT_API09. existing FDAAA field values for "STUDY PROTOCOL ID" and "TRIAL ID" should NOT be updated with an Invalid system ID
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and Trial ID
      |study_protocol_id        |generate                     |
      |trial_ide_ind_id         |NCT88888888                  |
      |exported_from_us         |false                        |
      |gender_description       |88888 gender_description     |
      |sequential_assignment    |88888 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |false                        |
      |ped_postmarket_surv      |true                         |
      |masking_description      |88888 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |88888 model_description      |
      |gender_based             |true                         |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_TRIAL_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    And response body should return "Data has been created."
    When "GET" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_TRIAL_ID"
    Then CTRP Data Clinical Trials API response to "GET" should be "200"
    And response body should includes FDAAA field values with Study Protocol ID and Trial ID
    Given update following FDAAA filed values for "STUDY PROTOCOL ID" and "TRIAL ID" to the CTRP Data Clinical Trials Service with the invalid system ID "INVALIDSYSTEMID"
      |study_protocol_id        |get                          |
      |trial_ide_ind_id         |NCT99999999                  |
      |exported_from_us         |true                         |
      |gender_description       |99999 gender_description     |
      |sequential_assignment    |99999 sequential_assignment  |
      |fda_regulated_drug       |false                        |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |false                        |
      |masking_description      |99999 masking_description    |
      |fda_regulated_device     |false                        |
      |model_description        |99999 model_description      |
      |gender_based             |false                        |
    When "PUT" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "INVALID_SYSTEM_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "404"
    And response body should return "Not Found... "

  @CTRPMICRO-88 @REST @Tests @DCT_LOW
  Scenario: DCT_API10. delete a record with a system ID should be successful
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and NCI ID
      |study_protocol_id        |generate                     |
      |nci_id                   |NCI77777777                  |
      |exported_from_us         |true                         |
      |gender_description       |11111 gender_description     |
      |sequential_assignment    |11111 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |11111 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |11111 model_description      |
      |gender_based             |false                        |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    When "DELETE" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "ID"
    Then CTRP Data Clinical Trials API response to "DELETE" should be "200"
    And response body should return "Data has been deleted."
    When "GET" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "ID"
    Then CTRP Data Clinical Trials API response to "GET" should be "404"
    And response body should return "Not Found... "

  @CTRPMICRO-89 @REST @Tests @DCT_LOW
  Scenario: DCT_API11. deleting a record with a system ID should fail
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with Study Protocol ID and NCI ID
      |study_protocol_id        |generate                     |
      |nci_id                   |NCI44444444                  |
      |exported_from_us         |true                         |
      |gender_description       |44444 gender_description     |
      |sequential_assignment    |44444 sequential_assignment  |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |44444 masking_description    |
      |fda_regulated_device     |true                         |
      |model_description        |44444 model_description      |
      |gender_based             |false                        |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    When "DELETE" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "INVALID_SYSTEM_ID"
    Then CTRP Data Clinical Trials API response to "DELETE" should be "404"
    And response body should return "Not Found... "

  @CTRPMICRO-90 @REST @Tests @DCT_MEDIUM
  Scenario: DCT_API12. field values can be posted as null and should be successful
    Given I want to add following new FDAAA filed values to the CTRP Data Clinical Trials Service with null values
      |study_protocol_id        |generate                     |
      |nci_id                   |NCI77777777                  |
      |exported_from_us         |true                         |
      |gender_description       |                             |
      |sequential_assignment    |                             |
      |fda_regulated_drug       |true                         |
      |post_prior_to_approval   |true                         |
      |ped_postmarket_surv      |true                         |
      |masking_description      |                             |
      |fda_regulated_device     |true                         |
      |model_description        |                             |
      |gender_based             |false                        |
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then CTRP Data Clinical Trials API response to "POST" should be "201"
    And response body should return "Data has been created."








