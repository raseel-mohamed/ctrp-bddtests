Feature: Outcome Measures

  @PA_HIGH @PA @FDAAA @CTRPMICRO-25
  Scenario: Import a Trial from clinical trials.gov and verify fields in Outcome Measures section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00327"
    When I go to Outcome Measures section in PA app
    Then for the Outcome measures table these columns should be removed
      | Column Name  |
      | Safety Issue |
    And I click Edit for one of the Outcome Measures
    Then these existing fields should be removed
      | Field Name   |
      | Safety Issue |

  #Registration
  @PA_HIGH  @FDAAA  @PA @CTRPMICRO-27
  Scenario: Register a trial and verify fields in Outcome Measures section(REG)
    Given I registered a new Trial
    When I go to Outcome Measures section in Registration app
    Then for the Outcome measures table these columns should be removed
      | Column Name  |
      | Safety Issue |
    And I click Edit for one of the Outcome Measures
    Then these existing fields should be removed
      | Field Name   |
      | Safety Issue |