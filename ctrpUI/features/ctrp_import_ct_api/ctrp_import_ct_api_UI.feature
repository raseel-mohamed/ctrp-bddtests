Feature: Import Trial from PA

  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_01 Import Trial from PA
    Given I am logged in to PA
    And I want to Import the trial with NCT ID "NCT03093480" in PA
    Then the import should be "Message. Trial NCT03093480 has been imported and registered in CTRP system successfully." in PA


  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_02 Import Trial from Registry
    Given I am logged in to Registry
    And I want to Import the trial with NCT ID "NCT03093480" in Registry
    Then the import should be "Message: Trial NCT03093480 has been imported and registered in CTRP system successfully." in Registry

  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_03 Import Trial from PA - Update
    Given I am logged in to PA
    And I want to make an update to the Imported trial with NCT ID "NCT03093480"
    Then I verify the update of an import message


  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_04 View log for Imported trials
    Given I am logged in to PA
    And I want to Import the trial with NCT ID "NCT03093480" in PA
    Then I should be able to View the log of Imported Trial

  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_05 Import Trial from PA and validate screen: Trial Headers
    Given I am logged in to PA
    And I want to Import the trial with NCT ID "NCT03093480" in PA
    Then the import should be "Message. Trial NCT03093480 has been imported and registered in CTRP system successfully." in PA
    And I should be able to search with the NCT ID "NCT03093480"
    And I should be able to select the Trial
    And below field headers should match
      | CTRP field                  | value                               |
      | Lead Organization Trial ID  | ct.gov.id_info.org_study_id         |
      | Lead Organization           | ct.gov.sponsors.lead_sponsor.agency |
      | Trial Category              | Abbreviated Trial                   |
      | Submission Source           | ClinicalTrials.gov                  |
      | Last Submitter              | ClinicalTrials.gov Import           |
      | Last Submitter Organization | ClinicalTrials.gov                  |
      | Current Trial Status        | In Review                           |
      | Current Trial Status Date   | 04/01/2017                          |
      | Processing Status           | Submitted                           |

  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_06 Import Trial from PA and validate screen: Trial Identification
    Given I am logged in to PA
    And I want to Import the trial with NCT ID "NCT03093480" in PA
    Then the import should be "Message. Trial NCT03093480 has been imported and registered in CTRP system successfully." in PA
    And I should be able to search with the NCT ID "NCT03093480"
    And I should be able to select the Trial
    And In the Trial Identification below fields should match
      | CTRP field                    | value                       |
      | Trial Type                    | ct.gov.study_type           |
      | Lead Organization Trial ID    | ct.gov.id_info.org_study_id |
      | ClinicalTrials.gov Identifier | ct.gov.id_info.nct_id       |
      | Other Identifier              | ct.gov.secondary_id         |
      | Abbreviated Trial?            | Yes                         |
      | Last Verification Date        | ct.gov.verification_date    |
      | Official Title                | ct.gov.official_title       |
      | Submission Source             | ClinicalTrials.gov          |

  @IMPORT_CT_UI_HIGH
  Scenario: IMPORT_CT_UI_07 Import Trial from PA and validate screen: Trial Validation
    Given I am logged in to PA
    And I want to Import the trial with NCT ID "NCT03093480" in PA
    Then the import should be "Message. Trial NCT03093480 has been imported and registered in CTRP system successfully." in PA
    And I should be able to search with the NCT ID "NCT03093480"
    And I should be able to select the Trial
    And In the Trial Identification below fields should match
      | CTRP field                                     | value                               |
      | Identifier Type: Lead Organization Trial ID    | ct.gov.id_info.org_study_id         |
      | Identifier Type: ClinicalTrials.gov Identifier | ct.gov.id_info.nct_id               |
      | Identifier Type: Other Identifier              | ct.gov.secondary_id                 |
      | Abbreviated Trial?                             | Yes                                 |
      | Official Title                                 | ct.gov.official_title               |
      | Trial Phase                                    | ct.gov.phase                        |
      | Is this a Pilot?                               |                                     |
      | Primary Purpose                                | ct.gov.study_design.Primary Purpose |
      | Lead Organization                              | ct.gov.sponsors.lead_sponsor.agency |
      | Prinicipal Investigator                        |                                     |
      | Sponsor                                        | ct.gov.sponsors.lead_sponsor.agency |
      | Responsible Party                              |                                     |
      | Data Table 4 Funding Category                  |                                     |
      | Data Table 4 Funding Source                    |                                     |




