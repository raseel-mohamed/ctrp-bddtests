Feature: Design Details

  @pa_high @FDAAA @CTRPMICRO-26
  Scenario: Import a Trial from clinical trials.gov and verify fields in Design Details section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Design Details section in PA app
    Then new fields with options should be there
      | Field Name                                   | List of Value          |
      | Interventional Study Model                   | Sequential Assignment  |
      | Primary Purpose                              | Device Feasibility     |
    And the new fields should be there
      | Field Name                                     |
      | Model Description                              |
      | Masking Description                            |
    And these existing fields should be updated
      | Existing Field                       |
      | Interventional Study Model           |
    And these existing fields should be removed
      | Field Name            |
      | Masking               |
      | Study Classification  |
    And these existing fields value should be updated
      | Existing Field Value                 | New Field Value                  |
      | Subject                              | Participant                      |
      | Caregiver                            | Care Provider                    |
      | Trial Phase 0                        | Early Phase 1                    |
    And the conditional fields should be
      | Field Name                     | Condition                                                               |
      | No Masking                     | When No Masking is selected other fields in masking should be Null      |
    And the required fields should be
      | Field Name                                  |
      | Interventional Study Model                  |
