Feature: Export

  @EXPORT_HIGH
  Scenario: EXPORT_01 Validate the new FDAAA field: fda_regulated_drug
    Given I click to view xml of "NCI-2017-00333"
    Then the field "oversight_info.fda_regulated_drug" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_02 Validate the new FDAAA field: fda_regulated_device
    Given I click to view xml of "NCI-2017-00333"
    Then the field "oversight_info.fda_regulated_device" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_03 Validate the new FDAAA field: post_prior_to_approval
    Given I click to view xml of "NCI-2017-00333"
    Then the field "oversight_info.post_prior_to_approval" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_04 Validate the new FDAAA field: ped_postmarket_surv
    Given I click to view xml of "NCI-2017-00333"
    Then the field "oversight_info.ped_postmarket_surv" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_05 Validate the new FDAAA field: exported_from_us
    Given I click to view xml of "NCI-2017-00333"
    Then the field "oversight_info.exported_from_us" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_06 Validate the new FDAAA field: model_description
    Given I click to view xml of "NCI-2017-00333"
    Then the field "study_design.interventional_design.model_description" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_07 Validate the new FDAAA field: masking_description
    Given I click to view xml of "NCI-2017-00333"
    Then the field "study_design.interventional_design.masking_description" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_08 Validate the new FDAAA field: gender_based
    Given I click to view xml of "NCI-2017-00333"
    Then the field "Eligibility.gender_based" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_09 Validate the new FDAAA field: gender_description
    Given I click to view xml of "NCI-2017-00333"
    Then the field "Eligibility.gender_description" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_10 Validate the new FDAAA field: expanded_access_nct_id
    Given I click to view xml of "NCI-2017-00333"
    Then the field "ind_info.expanded_access_nct_id" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_11 Validate the field: regulatory_authority has been removed
    Given I click to view xml of "NCI-2017-00333"
    Then the field "oversight_info.regulatory_authority" should not be there

  @EXPORT_HIGH
  Scenario: EXPORT_12 Validate the field: endpoint has been removed
    Given I click to view xml of "NCI-2017-00333"
    Then the field "study_design.endpoint" should not be there

  @EXPORT_HIGH
  Scenario: EXPORT_13 Validate the field: primary_outcome.outcome_safety_issue has been removed
    Given I click to view xml of "NCI-2017-00333"
    Then the field "primary_outcome.outcome_safety_issue" should not be there

  @EXPORT_HIGH
  Scenario: EXPORT_14 Validate the field: secondary_outcome.outcome_safety_issue has been removed
    Given I click to view xml of "NCI-2017-00333"
    Then the field "secondary_outcome.outcome_safety_issue" should not be there

  @EXPORT_HIGH
  Scenario: EXPORT_15 Validate the field: masking has been removed
    Given I click to view xml of "NCI-2017-00333"
    Then the field "study_design.interventional_design.masking" should not be there

  @EXPORT_HIGH
  Scenario: EXPORT_16 Validate the new value: Device Feasibility has been added in interventional_subtype
    Given I click to view xml of "NCI-2017-00333"
    Then the new value as  "Device Feasibility" should be there in "study_design.interventional_design.interventional_subtype"

  @EXPORT_HIGH
  Scenario: EXPORT_17 Validate the new value: Sequential Assignment has been added in assignment
    Given I click to view xml of "NCI-2017-00333"
    Then the new value as  "Sequential Assignment" should be there in "study_design.interventional_design.assignment"

  @EXPORT_HIGH
  Scenario: EXPORT_18 Validate the field: start_date_type
    Given I click to view xml of "NCI-2017-00333"
    Then the field "start_date_type" should be populated

  @EXPORT_HIGH
  Scenario: EXPORT_19 Validate the field: start_date
    Given I click to view xml of "NCI-2017-00333"
    Then the field "start_date" should be populated

  @EXPORT_HIGH
  Scenario: EXPORT_20 Validate the field: primary_compl_date
    Given I click to view xml of "NCI-2017-00333"
    Then the field "primary_compl_date" should be populated

  @EXPORT_HIGH
  Scenario: EXPORT_21 Validate the field: primary_compl_date_type
    Given I click to view xml of "NCI-2017-00333"
    Then the field "primary_compl_date_type" should be populated

  @EXPORT_HIGH
  Scenario: EXPORT_22 Validate the field: completion_date
    Given I click to view xml of "NCI-2017-00333"
    Then the field "completion_date" should be populated

  @EXPORT_HIGH
  Scenario: EXPORT_23 Validate the field: completion_date_type
    Given I click to view xml of "NCI-2017-00333"
    Then the field "completion_date_type" should be populated

  @EXPORT_HIGH
  Scenario: EXPORT_24 Validate the field: delayed_posting
    Given I click to view xml of "NCI-2017-00333"
    Then the field "delayed_posting" should be populated

  @EXPORT_HIGH
  Scenario: EXPORT_25 Validate the new value: Early Phase I has been added in Phase
    Given I click to view xml of "NCI-2017-00333"
    Then the new value as "Early Phase I" should be there in "phase"

  @EXPORT_HIGH
  Scenario: EXPORT_26 Validate the new FDAAA field: no_masking = Yes
    Given I click to view xml of "NCI-2017-00333"
    Then the field "study_design.interventional_design.no_masking" with "Yes" is there

  @EXPORT_HIGH
  Scenario: EXPORT_27 Validate the new FDAAA field: no_masking = No
    Given I click to view xml of "NCI-2017-00333"
    Then the field "study_design.interventional_design.no_masking" with "No" is there