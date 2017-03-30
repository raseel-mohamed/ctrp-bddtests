Feature: Regulatory_Information

  @PA_HIGH @FDAAA @PA @CTRPMICRO-16
Scenario: Verify the "Trial Oversight Authority Country" is removed in the Regulatory Information(PA) screen
  Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
  And I navigate to Regulatory Information screen
  Then "Trial Oversight Authority Country :" field is not displayed in Regulatory Information(PA) screen

  @PA_HIGH @FDAAA @PA @CTRPMICRO-65
Scenario: Verify the "Trial Oversight Authority Organization Name" is removed in the Regulatory Information screen
  Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
  And I navigate to Regulatory Information screen
  Then "Trial Oversight Authority Organization Name" field is not displayed in Regulatory Information(PA) screen


  @PA_HIGH @FDAAA @PA @CTRPMICRO-66
Scenario: Verify the new fields are added to the Regulatory Information(PA) screen
  Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
  And I navigate to Regulatory Information screen
  Then newly added fields with options should be there
    | Field Name                                   | List Of Value |
    | Studies a U.S. FDA-regulated Drug Product    | No or Yes        |
    | Studies a U.S. FDA-regulated Device Product  | No or Yes        |
    | Post Prior to U.S. FDA Approval or Clearance | No or Yes        |
    | Pediatric Post-market Surveillance           | No or Yes        |
    | Product Exported from the U.S                | No or Yes        |

  @PA_HIGH @FDAAA @PA @CTRPMICRO-67
Scenario: Verify the fields are required in the Regulatory Information(PA) screen
  Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
  And I navigate to Regulatory Information screen
  And I enter no values for the required fields and click on save button
  Then the required fields message is displayed
    | Field Name                                  |
    | Studies a U.S. FDA-regulated Drug Product   |
    | Studies a U.S. FDA-regulated Device Product |

  @PA_HIGH @FDAAA @PA @CTRPMICRO-69
  Scenario: Verify the field is updated in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    And I select "Yes" for "Studies a U.S. FDA-regulated Device Product :" field
    Then the existing field "Delayed Posting Indicator" should be updated to "Unapproved/Uncleared Device"


  @PA_HIGH @FDAAA @PA @CTRPMICRO-70
  Scenario: Verify the field (Post Prior to U.S. FDA Approval or Clearance) condition in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When "Unapproved/Uncleared Device" is "Yes"
    Then "Post Prior to U.S. FDA Approval or Clearance" field should be visible

  @PA_HIGH @FDAAA @PA @CTRPMICRO-71
  Scenario: Verify the field Pediatric Post-market Surveillance is visible in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When "Pediatric Post-market Surveillance" is "Yes"
    Then "Pediatric Post-market Surveillance :" field should be visible


  @PA_HIGH @FDAAA @PA @CTRPMICRO-112
  Scenario: Verify the field Pediatric Post-market Surveillance when "Studies a U.S. FDA-regulated Device Product" is "No" in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When the dropdown "Studies a U.S. FDA-regulated Device Product :" value is "No"
    Then "Pediatric Post-market Surveillance :" field should not be visible


  @PA_HIGH @FDAAA @PA @CTRPMICRO-72
  Scenario: Verify the field (Product Exported from the U.S)condition in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When "Product Exported from the U.S" is "Yes"
    Then the conditional fields should be
      | Field Name                                   | Condition                                                                                               |
      | Product Exported from the U.S                | Required only if the field "Product Exported from the U.S" is "Yes"                                     |

  @PA_HIGH @FDAAA @PA @CTRPMICRO-75
  Scenario: Verify the description for "Post Prior to U.S. FDA Approval or Clearance" is displayed in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When "Post Prior to U.S. FDA Approval or Clearance" is "Yes"
    Then the description should be "Authorize posting of study record on ClinicalTrials.gov prior to U.S. FDA approval/clearance of device product?"


  @PA_HIGH @FDAAA @PA @CTRPMICRO-76
  Scenario: Verify the description for "Studies a U.S. FDA-regulated Drug Product" is displayed in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When the field "Studies a U.S. FDA-regulated Drug Product" is "Yes"
    Then the description should be "Studying one or more U.S. FDA-regulated drug or biologic products?"

  @PA_HIGH @FDAAA @PA @CTRPMICRO-77
  Scenario: Verify the description for "Pediatric Post-market Surveillance" is displayed in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When the dropdown "Pediatric Post-market Surveillance" is "Yes"
    Then the description should be "Required only if this a pediatric postmarket surveillance of a device product ordered by the U.S. FDA"

  @PA_HIGH @FDAAA @PA @CTRPMICRO-159
  Scenario: Verify all the fields in the Regulatory Information with "Yes" values can be saved
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When "All the fields are populated with Yes values and saved"
    Then all the fields will have "Yes" values