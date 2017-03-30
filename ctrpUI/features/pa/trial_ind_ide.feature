Feature: IND/IDE

  @pa_high @FDAAA @pa @CTRPMICRO-29
  Scenario: Verify the "Unknown" radio button is displayed in the IND/IDE(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to IND/IDE screen
    When I click on Add button
    Then Availability of Expanded Access should display a dropdown "Yes" "No" and "Unknown"


  @pa_high @FDAAA @pa @CTRPMICRO-68
  Scenario: Verify the "Expanded Access Indicator:" has changed to "Availability of Expanded Access" in Trial IND/IDE(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to IND/IDE screen
    When I click on Add button
    Then "Availability of Expanded Access" label is displayed
