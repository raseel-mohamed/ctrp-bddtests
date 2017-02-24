Feature: IND/IDE

  @pa_high @FDAAA @pa @CTRPMICRO-29
    #NOTE: This Scenario needs more detail as this is related to Importing of a new Trial and requirement to change in PA is not there in PPt OR Excel
  Scenario: Import a Trial from clinical trials.gov and verify fields in Trial IND/IDE section(PA)
    Given I Import a trial with NCT ID "NCT03049202"
    When I go to Trial IND/IDE section in PA app
    Then these existing fields should be updated
      | Field Name                | New Field Name                  |
      | Expanded Access Indicator | Availability of Expanded Access |
      | Expanded Access Status    | Expanded Access Record          |
    And new option as "Unknown" shall be added to field "Availability of Expanded Access"
    And these fields should be removed
      | Field Name       |
      | Exempt Indicator |

  @pa_high @FDAAA @pa @CTRPMICRO-30
    #NOTE: This Scenario needs more detail as requirement to change in PA is not there in PPt OR Excel
  Scenario: Verify fields in Trial IND/IDE section(PA) for new trial
    Given I registered a new Trial
    When I go to Trial IND/IDE section in PA app
    Then these existing fields should be updated
      | Field Name                | New Field Name                  |
      | Expanded Access Indicator | Availability of Expanded Access |
      | Expanded Access Status    | Expanded Access Record          |
    And new option as "Unknown" shall be added to field "Availability of Expanded Access"
    And these fields should be removed
      | Field Name       |
      | Exempt Indicator |
    And the conditional fields should be
      | Field Name             | Condition                                                      |
      | Expanded Access Record | only available when "Availability of Expanded Access" is "Yes" |

  Scenario: Verify the "Unknown" radio button is displayed in the IND/IDE screen
    Given I search for a trial
    And I navigate to IND/IDE screen
    When I click on Add button
    Then Availability of Expanded Access should display "Yes" "No" and "Unknown" radio buttons



