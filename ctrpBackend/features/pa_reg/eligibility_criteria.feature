Feature: Eligibility Criteria

  @pa_high @FDAAA @CTRPMICRO-33
  Scenario: Import a Trial from clinical trials.gov through Rest service and verify fields in Eligibility Criteria section
    Given I Import a trial with NCT ID "NCT03049878" through rest service
    Then new fields with options should be there
      | Field Name                     | List Of Value |
      | Gender                         | Yes\NO        |
      | Gender Eligibility Description |               |
    And the conditional fields should be
      | Field Name                     | Condition                                                    |
      | Gender                         | Required if "Sex" is "Male" or "Female"                      |
      | Gender Eligibility Description | Optional if Gender is "Yes", not available if Gender is "No" |
    And these existing fields should be updated
      | Field Name | New Field Name |
      | Gender     | Sex            |
    And these existing fields value should be updated
      | Field Name            | Existing Field Value | New Field Value |
      | Sex(old name: Gender) | Both                 | All             |

  @pa_high @FDAAA @CTRPMICRO-34
  Scenario: Verify fields in Eligibility Criteria section for a new Trial through Rest service
    Given I created a new Trial through rest service
    Then new fields with options should be there
      | Field Name                     | List Of Value |
      | Gender                         | Yes\NO        |
      | Gender Eligibility Description |               |
    And the conditional fields should be
      | Field Name                     | Condition                                                    |
      | Gender                         | Required if "Sex" is "Male" or "Female"                      |
      | Gender Eligibility Description | Optional if Gender is "Yes", not available if Gender is "No" |
    And these existing fields should be updated
      | Field Name | New Field Name |
      | Gender     | Sex            |
    And these existing fields value should be updated
      | Field Name            | Existing Field Value | New Field Value |
      | Sex(old name: Gender) | Both                 | All             |