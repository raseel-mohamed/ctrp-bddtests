Feature: Eligibility Criteria

  @high @FDAAA @CTRPMICRO-17
  Scenario: Import a Trial from clinical trials.gov and verify fields in Eligibility Criteria section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Eligibility Criteria section in PA app
    Then new fields with options should be there
      | Field Name                     | List Of Value |
      | Gender                         | Yes\NO        |
      | Gender Eligibility Description |               |
    And the conditional fields should be
      | Field Name                     | Condition                                                    |
      | Gender                         | Required if "Sex" is "Male" or "Female"                      |
      | Gender Eligibility Description | Optional if Gender is "Yes", not available if Gender is "No" |
    And these existing fields should be updated
      | Field Name | New Field Name |
      | Gender     | Sex            |
    And these existing fields value should be updated
      | Field Name            | Existing Field Value | New Field Value |
      | Sex(old name: Gender) | Both                 | All             |