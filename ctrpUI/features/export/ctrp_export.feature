Feature: Export

  @EXPORT_HIGH
  Scenario: EXPORT_01 Validate the new FDAAA field: fda_regulated_drug = YES
    Given I click to view xml of "NCI-2017-00384"
    Then the field "oversight_info.fda_regulated_drug = Yes" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_02 Validate the new FDAAA field: fda_regulated_device = Yes
    Given I click to view xml of "NCI-2017-00384"
    Then the field "oversight_info.fda_regulated_device = Yes" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_03 Validate the new FDAAA field: post_prior_to_approval = Yes
    Given I click to view xml of "NCI-2017-00384"
    Then the field "oversight_info.post_prior_to_approval = Yes" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_04 Validate the new FDAAA field: ped_postmarket_surv = Yes
    Given I click to view xml of "NCI-2017-00384"
    Then the field "oversight_info.ped_postmarket_surv = Yes" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_05 Validate the new FDAAA field: exported_from_us = Yes
    Given I click to view xml of "NCI-2017-00384"
    Then the field "oversight_info.exported_from_us = Yes" should be there

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
    Then the field "study_design.interventional_design.no_masking" with "Yes" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_27 Validate the new FDAAA field: no_masking = No
    Given I click to view xml of "NCI-2017-00333"
    Then the field "study_design.interventional_design.no_masking" with "No" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_28 Validate the field: Sex = Male
    Given I click to view xml of "NCI-2017-00333"
    Then the field "eligibility.gender" with "Male" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_29 Validate the field: Sex = Female
    Given I click to view xml of "NCI-2017-00333"
    Then the field "eligibility.gender" with "Female" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_30 Validate the field: Sex = All
    Given I click to view xml of "NCI-2017-00333"
    Then the field "eligibility.gender" with "All" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_31 Validate the field: has_expanded_access = Yes
    Given I click to view xml of "NCI-2017-00333"
    Then the field "indinfo.has_expanded_access" with "Yes" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_32 Validate the field: has_expanded_access = No
    Given I click to view xml of "NCI-2017-00333"
    Then the field "indinfo.has_expanded_access" with "No" should be there

  @EXPORT_HIGH
  Scenario: EXPORT_33 Validate the field: has_expanded_access = Unknown
    Given I click to view xml of "NCI-2017-00333"
    Then the field "indinfo.has_expanded_access" with "Unknown" should be there