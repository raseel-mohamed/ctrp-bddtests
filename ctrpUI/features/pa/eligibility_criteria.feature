# Parent Jira Ticket # CTRPMICRO-74
Feature: Eligibility Criteria

  @PA_HIGH @FDAAA @CTRPMICRO-17
  Scenario: Import a Trial from clinical trials.gov and verify fields in Eligibility Criteria section(PA)
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    Then I verify Gender Based and Gender Eligibility Description fields
      | Field Name                     | List Of Value |
      | Gender Based                   | Yes or No     |
      | Gender Eligibility Description |               |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-92
  Scenario: Verify Gender Based field is required in Eligibility Criteria section(PA)
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    Then Gender Based field is required
      | Field Name                        | Condition                                                    |
      | Gender Based                      | Required if "Sex" is "Male" or "Female"                      |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-93
  Scenario: Verify Gender Based eligibility description is available when Gender based study is Yes in Eligibility Criteria section(PA)
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    And I click on "Eligibility Criteria" link
    When Sex is "Male"
    And Gender based study is Yes
    Then Gender Based eligibility description is available
    When Sex is "Female"
    And Gender based study is Yes
    Then Gender Based eligibility description is available
    When Sex is "All"
    Then Gender Based eligibility description is not available

  @PA_HIGH @FDAAA @UI @CTRPMICRO-94
  Scenario: Verify Gender Based eligibility description is not available when Gender based study is No in Eligibility Criteria section(PA)
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    And I click on "Eligibility Criteria" link
    When Sex is "Male"
    And Gender based study is No
    Then Gender Based eligibility description is not available
    When Sex is "Female"
    And Gender based study is No
    Then Gender Based eligibility description is not available
    When Sex is "All"
    Then Gender Based eligibility description is not available

  @PA_HIGH @FDAAA @UI @CTRPMICRO-95
  Scenario: Verify Gender is changed to Sex in Eligibility Criteria section(PA)
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    And I click on "Eligibility Criteria" link
    Then Gender is changed to "Sex"

  @PA_HIGH @FDAAA @UI @CTRPMICRO-96
  Scenario: Verify field value is updated to Sex dropdown in Eligibility Criteria section(PA)
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    And I click on "Eligibility Criteria" link
    Then these existing fields value should be updated
      | Field Name            | Existing Field Value | New Field Value |
      | Sex(old name: Gender) | Both                 | All             |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-24
  Scenario: Verify fields in Eligibility Criteria section for a new Trial (PA) created in Registration
    #Note: You will get a Registry id after the registry completion. As i have already created a trial in registry i am passing it as argument in the below step.
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    Then I verify Gender Based and Gender Eligibility Description fields
      | Field Name                     | List Of Value |
      | Gender Based                   | Yes or No     |
      | Gender Eligibility Description |               |


  @PA_HIGH @FDAAA @UI @CTRPMICRO-97
  Scenario: Verify Gender Based field is required in Eligibility Criteria section(PA) for a new trial created in Registration
    #Note: You will get a Registry id after the registry completion. As i have already created a registry i am passing it as argument in the below step.
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    Then Gender Based field is required
      | Field Name                     | Condition                                                    |
      | Gender Based                   | Required if "Sex" is "Male" or "Female"                      |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-98
  Scenario: Verify Gender Based eligibility description is available when Gender based study is Yes in Eligibility Criteria section(PA) for a new trial created in Registration
    #Note: You will get a Registry id after the registry completion. As i have already created a registry i am passing it as argument in the below step.
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    When Sex is "Male"
    And Gender based study is Yes
    Then Gender Based eligibility description is available
    When Sex is "Female"
    And Gender based study is Yes
    Then Gender Based eligibility description is available
    When Sex is "All"
    Then Gender Based eligibility description is not available

  @PA_HIGH @FDAAA @UI @CTRPMICRO-99
  Scenario: Verify Gender Based eligibility description is not available when Gender based study is No in Eligibility Criteria section(PA) for a new trial created in Registration
    #Note: You will get a Registry id after the registry completion. As i have already created a registry i am passing it as argument in the below step.
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    When Sex is "Male"
    And Gender based study is No
    Then Gender Based eligibility description is not available
    When Sex is "Female"
    And Gender based study is No
    Then Gender Based eligibility description is not available
    When Sex is "All"
    Then Gender Based eligibility description is not available

  @PA_HIGH @FDAAA @UI @CTRPMICRO-100
  Scenario: Verify Gender field is changed to Sex in Eligibility Criteria section(PA) for a new trial created in Registration
    #Note: You will get a Registry id after the registry completion. As i have already created a registry i am passing it as argument in the below step.
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    Then Gender is changed to "Sex"

  @PA_HIGH @FDAAA @UI @CTRPMICRO-101
  Scenario: Verify field value is updated to Sex dropdown in Eligibility Criteria section(PA) for a new trial created in Registration
    #Note: You will get a Registry id after the registry completion. As i have already created a registry i am passing it as argument in the below step.
    Given I login into CTRP and search with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    Then these existing fields value should be updated
      | Field Name            | Existing Field Value | New Field Value |
      | Sex(old name: Gender) | Both                 | All             |

 @PA_HIGH @FDAAA @UI @CTRPMICRO-227
  Scenario: Verify the details filled are saved in Eligibility Criteria section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    And I fill all details and click save in Eligibility Criteria page
    Then I verify confirm message "Message. Record Updated." is displayed

  @PA_HIGH @FDAAA @UI @CTRPMICRO-228
  Scenario Outline:To verify front end validations in Eligibility Criteria section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    Then I verify validations for accepts healthy volunteers  "<accepts_healthy_volunteers>", sex  "<sex>", minimum age  "<minimum_age>",  maximum age "<maximum_age>", min unit "<min_unit>", max unit "<max_unit>", error message "<error_message>"
    Examples:
      | accepts_healthy_volunteers | sex | minimum_age | maximum_age | min_unit | max_unit | error_message                                             |
      |                            | All | 10          | 40          | Years    | Years    | AHVIndicator must be Entered                              |
      | No                         |     | 10          | 40          | Years    | Years    | GenderCode must be Entered                                |
      | No                         | All |             | 40          | Years    | Years    | Minimum Age must be Entered\nPlease Enter a numeric value |
      | No                         | All | 10          |             | Years    | Years    | Maximum Age must be Entered\nPlease Enter a numeric value |
      | No                         | All | 10          | 40          |          | Years    | Unit must be Entered                                      |
      | No                         | All | 10          | 40          | Years    |          | Unit must be Entered                                      |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-229
  Scenario:To verify All required field validations in Eligibility Criteria section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00331"
    When I click on "Eligibility Criteria" link
    And I enter all details except mandatory fields in Eligibility Criteria section(PA)
    Then I verify below error messages are displayed in Eligibility Criteria (PA) for mandatory fields
      | field_name                 | error_message                                            |
      | accepts_healthy_volunteers | AHVIndicator must be Entered                             |
      | sex                        | GenderCode must be Entered                               |
      | minimum_age                | Minimum Age must be Entered Please Enter a numeric value |
      | maximum_age                | Maximum Age must be Entered Please Enter a numeric value |
      | unit                       | Unit must be Entered                                     |
      | unit                       | Unit must be Entered                                     |


  @PA_HIGH @FDAAA @UI @CTRPMICRO-246
  Scenario: Verify the details filled are saved in Eligibility Criteria section(PA) for an Imported trial
    Given I login into CTRP and search for an Imported trial with NCI ID "NCI-2017-00293"
    When I click on "Eligibility Criteria" link
    And I fill all details and click save in Eligibility Criteria page
    Then I verify confirm message "Message. Record Updated." is displayed