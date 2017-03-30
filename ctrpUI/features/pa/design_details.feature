# Parent Jira Ticket # CTRPMICRO-73
Feature: Design Details

  @PA_HIGH @FDAAA @CTRPMICRO-26
  Scenario: Import a Trial from clinical trials.gov and verify fields in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    Then new fields with Interventional study Model and Primary Purpose should be there
      | Field Name                                   | List of Value          |
      | Interventional Study Model                   | Sequential Assignment  |
      | Primary Purpose                              | Device Feasibility     |

  @PA_HIGH @FDAAA @CTRPMICRO-105
  Scenario: Verify new description fields in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    Then I verify new field "Model Description" should be there
    Then I verify new field "Masking Description" should be there

  @PA_HIGH @FDAAA @CTRPMICRO-106
  Scenario: Verify Interventional Study Model field is updated in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    Then these existing fields should be updated
      | Existing Field       | New Field                  |
      | Interventional Model | Interventional Study Model |

  @PA_HIGH @FDAAA @CTRPMICRO-158
  Scenario: Verify Masking Roles field is updated in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    Then these existing fields should be updated
      | Existing Field       | New Field                  |
      | Masking Roles        | Masking                    |

  @PA_HIGH @FDAAA @CTRPMICRO-107
  Scenario: Verify Masking and Study Classification fields are removed in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    Then these existing fields should be removed
      | Field Name            |
      | Masking               |
      | Study Classification  |

  @PA_HIGH @FDAAA @CTRPMICRO-108
  Scenario: Verify existing field values are updated in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    Then these existing fields should be updated
      | Existing Field | New Field     |
      | Subject        | Participant   |
      | Caregiver      | Care Provider |
      | Trial Phase 0  | Early Phase 1 |

  @PA_HIGH @FDAAA @CTRPMICRO-109
  Scenario: Verify condition on No Masking field in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    Then the conditional fields should be
      | Field Name                     | Condition                                                                   |
      | No Masking                     | When "No Masking" is selected other fields in "Masking" should be Null      |

  @PA_HIGH @FDAAA @CTRPMICRO-110
  Scenario: Verify the required field in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    Then Interventional Study Model is a required field

#  @REGRESSION
#  Scenario: Verify the Accruals in CTRP Accrual are getting updated in PA Design Details screen
#    Given I login into CTRP Accrual and search for a trial with ID "NCI-2017-00024"
#    And Click on NCI Trial Identifier ID link and "Participating Site Subject Accrual Count" page is displayed
#    And enter "9" into the text of "# of Subjects Enrolled:" and click on Save icon.
#    When I go to Design Details section in PA app
#    Then the "Accruals" in Design Details screen displays "9" as the count

