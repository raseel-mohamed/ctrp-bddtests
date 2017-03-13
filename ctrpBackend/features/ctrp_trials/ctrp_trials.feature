Feature: Tests Trials

  @CTRP_TRIALS
  Scenario: CTRP_TRAILS_API01. Test Study Protocol ID Search should be successful
    Given I know Trials ID to search
    Then Search is successful for Trials
