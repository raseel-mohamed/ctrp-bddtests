Feature: Regulatory_Information

@pa_high @FDAAA @CTRPMICRO-16 @pa
Scenario: Import a Trial from clinical trials.gov and verify fields in Regulatory Information section(PA)
Given I Import a trial with NCT ID "NCT03045783"
When I go to Regulatory Information section in PA app
Then new fields with options should be there
|Field Name                                   |List Of Value|
|Studies a U.S. FDA-regulated Drug Product    |Yes\NO       |
|Studies a U.S. FDA-regulated Device Product  |Yes\NO       |
|Post Prior to U.S. FDA Approval or Clearance |Yes\NO       |
|Pediatric Post-market Surveillance           |Yes\NO       |
|Product Exported from the U.S                |Yes\NO       |
And the required fields should be
|Field Name                                   |
|Studies a U.S. FDA-regulated Drug Product    |
|Studies a U.S. FDA-regulated Device Product  |
And the conditional fields should be
|Field Name                                   |Condition|
|Post Prior to U.S. FDA Approval or Clearance |Optional and only available when "Unapproved/Uncleared Device" is "Yes"       |
|Pediatric Post-market Surveillance           |Required only if this a pediatric post market surveillance of a device product ordered by the U.S. FDA.       |
|Product Exported from the U.S                |Required only if a product is manufactured in and exported from the US      |
And these existing fields should be removed
|Field Name                                   |
|Trial Oversight Authority Country            |
|Trial Oversight Authority Organization Name  |
And these existing fields should be updated
|Field Name                                   |New Field Name |
|Delayed Posting Indicator                    |Unapproved/Uncleared Device|