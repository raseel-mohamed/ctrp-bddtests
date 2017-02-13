Feature: Outcome Measures

  @pa_high @FDAAA @CTRPMICRO-25 @pa
  Scenario: Import a Trial from clinical trials.gov and verify fields in Outcome Measures section(PA)
    Given I Import a trial with NCT ID "NCT03046680"
    When I go to Outcome Measures section in PA app
    Then for the Outcome measures table these columns should be removed
      | Column Name  |
      | Safety Issue |
    And I click Edit for one of the Outcome Measures
    Then these existing fields should be removed
      | Field Name   |
      | Safety Issue |

  @pa_high @FDAAA  @pa
  Scenario: Register a trial and verify fields in Outcome Measures section(PA)
    Given I registered a new Trial
    When I go to Outcome Measures section in PA app
    Then for the Outcome measures table these columns should be removed
      | Column Name  |
      | Safety Issue |
    And I click Edit for one of the Outcome Measures
    Then these existing fields should be removed
      | Field Name   |
      | Safety Issue |