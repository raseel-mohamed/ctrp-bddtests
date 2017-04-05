Feature: Outcome Measures

  @PA_HIGH @PA @FDAAA @CTRPMICRO-25
  Scenario: Import a Trial from clinical trials.gov and verify fields in Outcome Measures section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to Outcome Measures section in PA app
    Then for the Outcome measures table these columns should be removed
      | Column Name  |
      | Safety Issue |
    And I click Edit for one of the Outcome Measures
    Then these existing fields should be removed
      | Field Name   |
      | Safety Issue |

  #Registration
  @PA_HIGH  @FDAAA  @PA @CTRPMICRO-27
  Scenario: Register a trial and verify fields in Outcome Measures section(PA)
    #Note: You will get a Registry id after the registry completion. As i have already created a registry i am passing it(NCI-2017-00332) as argument in the below step.
    When I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    And I go to Outcome Measures section in PA app
    Then for the Outcome measures table these columns should be removed
      | Column Name  |
      | Safety Issue |
    And I click Edit for one of the Outcome Measures
    Then these existing fields should be removed
      | Field Name   |
      | Safety Issue |

  @PA_HIGH  @FDAAA  @PA @CTRPMICRO-230
  Scenario: Verify the details filled are saved in Outcome Measures section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to Outcome Measures section in PA app
    And I fill all details and click save in Outcome Measures section(PA)
    Then I verify confirm message "Message. Record Updated." is displayed

  @PA_HIGH  @FDAAA  @PA @CTRPMICRO-232
  Scenario Outline:To verify front end validations in Outcome Measures section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to Outcome Measures section in PA app
    And I click on the Add button
    Then I verify validations for outcome measure type "<outcome_measure_type>",title "<title>",time frame "<time_frame>,error message "<error_message>"
    Examples:
      | outcome_measure_type | title | time_frame | error_message                        |
      | --Select--           | abc   | xyz        | Outcome Measure Type must be Entered |
      | Primary              |       | xyz        | Title must be Entered                |
      | Primary              | abc   |            | Time Frame must be Entered           |

  @PA_HIGH  @FDAAA  @PA @CTRPMICRO-233
  Scenario: To verify All required field validations in Outcome Measures section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I go to Outcome Measures section in PA app
    And I enter all details except mandatory fields in Outcome Measures section(PA)
    Then I verify below error messages are displayed in Outcome Measures page for mandatory fields
      | field_name           | error_message                        |
      | Outcome_Measure_Type | Outcome Measure Type must be Entered |
      | Title                | Title must be Entered                |
      | Time_Frame           | Time Frame must be Entered           |

  @PA_HIGH  @FDAAA  @PA @CTRPMICRO-247
  Scenario: Verify the details filled are saved in Outcome Measures section(PA) for an Imported trial
    Given I login into CTRP and search for an Imported trial with NCI ID "NCI-2017-00293"
    When I go to Outcome Measures section in PA app
    And I fill all details and click save in Outcome Measures section(PA)
    Then I verify confirm message "Message. Record Updated." is displayed