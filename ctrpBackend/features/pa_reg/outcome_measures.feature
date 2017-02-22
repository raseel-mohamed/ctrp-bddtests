Feature: Outcome Measures

  @pa_high @FDAAA @CTRPMICRO-35 @REST
  Scenario: Import a Trial from clinical trials.gov through Rest and verify fields in Outcome Measures section
    Given I Import a trial with NCT ID "NCT03046680" through rest service
    Then for the Outcome measures table these columns should be removed
      | Column Name  |
      | Safety Issue |

  @pa_high @FDAAA @CTRPMICRO-37 @REST
  Scenario: Verify fields in Outcome Measures section for new Trial through Rest service
    Given I created a new Trial through rest service
    Then for the Outcome measures table these columns should be removed
      | Column Name  |
      | Safety Issue |