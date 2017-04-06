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
      | Trial Phase 0  | Early Phase I |

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

  @PA_HIGH @FDAAA @CTRPMICRO-224
  Scenario Outline:To verify front end validations in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    Then I verify validations for primary purpose "<primary_purpose>", trial phase "<trial_phase>", Interventional Study Model "<Interventional_Study_Model>", Number of Arms "<Number_of_Arms>", masking "<Masking>", allocation "<Allocation>", target enrollment "<Target_Enrollment>", error message "<error_message>"
  Examples:
    | primary_purpose | trial_phase   | Interventional_Study_Model | Number_of_Arms | Masking     | Allocation | Target_Enrollment | error_message                      |
    |                 | Early Phase I | Single Group               | 1              | noMasking | NA         | 1                 | Primary Purpose must be Entered    |
    | Treatment       |               | Single Group               | 1              | noMasking | NA         | 1                 | Trial Phase must be Entered        |
    | Treatment       | Early Phase I |                            | 1              | noMasking | NA         | 1                 | Intervention Model must be Entered |
    | Treatment       | Early Phase I | Single Group               |                | noMasking | NA         | 1                 | Number of Arms must be Entered     |
    | Treatment       | Early Phase I | Single Group               | 1              |           | NA         | 1                 | Masking must be Entered            |
    | Treatment       | Early Phase I | Single Group               | 1              | noMasking |            | 1                 | Allocation must be Entered         |
    | Treatment       | Early Phase I | Single Group               | 1              | noMasking | NA         |                   | Target Enrollment must be Entered  |

  @PA_HIGH @FDAAA @CTRPMICRO-225
    Scenario: Verify the details filled  are saved in Design Details section(PA)
      Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
      When I go to "Design Details" section in PA app
      And I fill all details and click save in Design Details page
      Then I verify confirm message "Message. Record Updated." is displayed

  @PA_HIGH @FDAAA @CTRPMICRO-226
  Scenario:To verify All required field validations in Design Details section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to "Design Details" section in PA app
    And I enter all details except mandatory fields in Design Details page
    Then I verify below error messages are displayed in Design Details page for mandatory fields
    | field_name                 | error_message                      |
    | primary_purpose            | Primary Purpose must be Entered    |
    | trial_phase                | Trial Phase must be Entered        |
    | Interventional_Study_Model | Intervention Model must be Entered |
    | Number_of_Arms             | Number of Arms must be Entered     |
    | Masking                    | Masking must be Entered            |
    | Allocation                 | Allocation must be Entered         |
    | Target_Enrollment          | Target Enrollment must be Entered  |

  @PA_HIGH @FDAAA @CTRPMICRO-245
  Scenario: Verify the details filled  are saved in Design Details section(PA) for an imported trial
    Given I login into CTRP and search for an Imported trial with NCI ID "NCI-2017-00293"
    When I go to "Design Details" section in PA app
    And I fill all details and click save in Design Details page
    Then I verify confirm message "Message. Record Updated." is displayed