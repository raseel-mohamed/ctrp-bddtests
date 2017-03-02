# Parent Jira Ticket # CTRPMICRO-73
Feature: Design Details

  @pa_high @FDAAA @CTRPMICRO-26
  Scenario: Import a Trial from clinical trials.gov and verify fields in Design Details section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Design Details section in PA app
    Then new fields with options should be there
      | Field Name                                   | List of Value          |
      | Interventional Study Model                   | Sequential Assignment  |
      | Primary Purpose                              | Device Feasibility     |

  @pa_high @FDAAA @CTRPMICRO-105
  Scenario: Verify new description fields in Design Details section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Design Details section in PA app
    Then the new fields should be there
      | Field Name                                     |
      | Model Description                              |
      | Masking Description                            |

  @pa_high @FDAAA @CTRPMICRO-106
  Scenario: Verify Interventional Study Model field is updated in Design Details section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Design Details section in PA app
    Then these existing fields should be updated
      | Existing Field                       |
      | Interventional Study Model           |

  @pa_high @FDAAA @CTRPMICRO-107
  Scenario: Verify Masking and  Study Classification fields are removed in Design Details section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Design Details section in PA app
    Then these existing fields should be removed
      | Field Name            |
      | Masking               |
      | Study Classification  |

  @pa_high @FDAAA @CTRPMICRO-108
  Scenario: Verify existing field values are updated in Design Details section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Design Details section in PA app
    Then these existing fields value should be updated
      | Existing Field Value                 | New Field Value                  |
      | Subject                              | Participant                      |
      | Caregiver                            | Care Provider                    |
      | Trial Phase 0                        | Early Phase 1                    |

  @pa_high @FDAAA @CTRPMICRO-109
  Scenario: Verify condition on No Masking field in Design Details section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Design Details section in PA app
    Then the conditional fields should be
      | Field Name                     | Condition                                                               |
      | No Masking                     | When No Masking is selected other fields in masking should be Null      |

  @pa_high @FDAAA @CTRPMICRO-110
  Scenario: Verify the required field in Design Details section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Design Details section in PA app
    Then the required fields should be
      | Field Name                                  |
      | Interventional Study Model                  |
