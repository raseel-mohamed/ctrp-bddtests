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
    | Field Name                                   | List Of Value    |
    | Studies a U.S. FDA-regulated Drug Product    | No or Yes        |
    | Studies a U.S. FDA-regulated Device Product  | No or Yes        |
    | Post Prior to U.S. FDA Approval or Clearance | No or Yes        |
    | Pediatric Post-market Surveillance           | No or Yes        |
    | Product Exported from the U.S                | No or Yes        |

  @PA_HIGH @FDAAA @PA @CTRPMICRO-69
  Scenario: Verify the existing field(Delayed Posting Indicator) is updated and displayed in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    And I select Yes for Studies a U.S. FDA-regulated Device Product field
    Then the existing field Delayed Posting Indicator should be updated to "Unapproved/Uncleared Device :" and displayed

  @PA_HIGH @FDAAA @PA @CTRPMICRO-238
  Scenario: Verify the field(Pediatric Post-market Surveillance) is displayed in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    And I select Yes for Studies a U.S. FDA-regulated Device Product field
    Then the existing field Pediatric Post-market Surveillance should be displayed

  @PA_HIGH @FDAAA @PA @CTRPMICRO-239
  Scenario: Verify the fields are not displayed in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    And I select No for Studies a U.S. FDA-regulated Device Product field
    Then the fields should not be displayed
      | Field Name                         | List Of Value |
      | Unapproved/Uncleared Device        | No or Yes     |
      | Pediatric Post-market Surveillance | No or Yes     |

  @PA_HIGH @FDAAA @PA @CTRPMICRO-70
  Scenario: Verify the field (Post Prior to U.S. FDA Approval or Clearance) condition is visible in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    And I select Yes for Studies a U.S. FDA-regulated Device Product field
    And I select Yes for Unapproved/Uncleared Device field
    Then Post Prior to U.S. FDA Approval or Clearance field should be visible

  @PA_HIGH @FDAAA @PA @CTRPMICRO-240
  Scenario: Verify the field (Post Prior to U.S. FDA Approval or Clearance) condition is not visible in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    And I select Yes for Studies a U.S. FDA-regulated Device Product field
    And I select No for Unapproved/Uncleared Device field
    Then Post Prior to U.S. FDA Approval or Clearance field should not be visible

  @PA_HIGH @FDAAA @PA @CTRPMICRO-71
  Scenario: Verify the field (Section 801 Indicator) is visible in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When FDA Regulated Intervention Indicator is Yes
    Then Section 801 Indicator field should be visible

  @PA_HIGH @FDAAA @PA @CTRPMICRO-112
  Scenario: Verify the field (Section 801 Indicator) is not visible in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When FDA Regulated Intervention Indicator is No
    Then Section 801 Indicator field should not be visible

  @PA_HIGH @FDAAA @PA @CTRPMICRO-75
  Scenario: Verify the description for "Post Prior to U.S. FDA Approval or Clearance" is displayed in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When Post Prior to U.S. FDA Approval or Clearance is Yes
    Then the description should be "Authorize posting of study record on ClinicalTrials.gov prior to U.S. FDA approval/clearance of device product?" for Post Prior to U.S. FDA Approval or Clearance

  @PA_HIGH @FDAAA @PA @CTRPMICRO-76
  Scenario: Verify the description for "Studies a U.S. FDA-regulated Drug Product" is displayed in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When the field Studies a U.S. FDA-regulated Drug Product is Yes
    Then the description should be "Studying one or more U.S. FDA-regulated drug or biologic products?" for Studies a U.S. FDA regulated Drug Product

  @PA_HIGH @FDAAA @PA @CTRPMICRO-77
  Scenario: Verify the description for "Pediatric Post-market Surveillance" is displayed in the Regulatory Information(PA) screen
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I navigate to Regulatory Information screen
    When the dropdown Pediatric Post-market Surveillance is Yes
    Then the description should be "Required only if this is a pediatric postmarket surveillance of a device product ordered by the U.S. FDA." for Pediatric Post-market Surveillance

  @PA_HIGH @FDAAA @PA @CTRPMICRO-159
  Scenario: Verify all the fields in the Regulatory Information filled are saved
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I navigate to Regulatory Information screen
    And I fill all details and click save in Regulatory Information page
    Then I verify confirm message "Message. Record Updated." is displayed

  @PA_HIGH @FDAAA @PA @CTRPMICRO-243
  Scenario: Verify all the fields in the Regulatory Information filled are saved for an imported trail
    Given I login into CTRP and search for an Imported trial with NCI ID "NCI-2017-00293"
    When I navigate to Regulatory Information screen
    And I fill all details and click save in Regulatory Information page
    Then I verify confirm message "Message. Record Updated." is displayed