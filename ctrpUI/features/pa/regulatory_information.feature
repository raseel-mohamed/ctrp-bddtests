Feature: Regulatory_Information

@pa_high @FDAAA @pa @CTRPMICRO-16
Scenario: Verify the "Trial Oversight Authority Country" is removed in the Regulatory Information(PA) screen
  Given I search for a trial
  And I navigate to Regulatory Information screen
  Then "Trial Oversight Authority Country" field is not displayed in Regulatory Information(PA) screen

@pa_high @FDAAA @pa @CTRPMICRO-65
Scenario: Verify the "Trial Oversight Authority Organization Name" is removed in the Regulatory Information(PA) screen
  Given I search for a trial
  And I navigate to Regulatory Information screen
  Then "Trial Oversight Authority Organization Name" field is not displayed in Regulatory Information(PA) screen


@pa_high @FDAAA @pa @CTRPMICRO-66
Scenario: Verify the following new fields are added to the Regulatory Information(PA) screen
  Given I search for a trial
  And I navigate to Regulatory Information screen
  Then new fields with options should be there
    | Field Name                                   | List Of Value |
    | Studies a U.S. FDA-regulated Drug Product    | Yes\NO        |
    | Studies a U.S. FDA-regulated Device Product  | Yes\NO        |
    | Post Prior to U.S. FDA Approval or Clearance | Yes\NO        |
    | Pediatric Post-market Surveillance           | Yes\NO        |
    | Product Exported from the U.S                | Yes\NO        |

@pa_high @FDAAA @pa @CTRPMICRO-67
Scenario: Verify the following fields are required in the Regulatory Information(PA) screen
  Given I search for a trial
  And I navigate to Regulatory Information screen
  Then the required fields should be
    | Field Name                                  |
    | Studies a U.S. FDA-regulated Drug Product   |
    | Studies a U.S. FDA-regulated Device Product |

  @pa_high @FDAAA @pa @CTRPMICRO-69
  Scenario: Verify the following field is updated in the Regulatory Information(PA) screen
    Given I search for a trial
    And I navigate to Regulatory Information screen
    Then these existing fields should be updated
      | Field Name                | New Field Name              |
      | Delayed Posting Indicator | Unapproved/Uncleared Device |
