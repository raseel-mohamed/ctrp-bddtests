Feature: Tests MISC

  @CTRP_MISC
  Scenario: CTRP_MISC_API01. Test Study Protocol ID Search should be successful
    Given I know the FDAAA Test Study Protocol ID to search
    Then Search is successful for Study protocol ID
