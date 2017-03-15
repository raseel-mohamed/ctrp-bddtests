# Parent Jira Ticket # CTRPMICRO-74
Feature: Eligibility Criteria

  @PA_HIGH @FDAAA @CTRPMICRO-17 @UI
  Scenario: Import a Trial from clinical trials.gov and verify fields in Eligibility Criteria section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00327"
    When I go to Eligibility Criteria section in PA app
    Then new fields with options should be there
      | Field Name                     | List Of Value |
      | Gender Based                        | Yes\NO        |
      | Gender Eligibility Description |               |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-92
  Scenario: Verify Gender field is required in Eligibility Criteria section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00327"
    And I go to Eligibility Criteria section in PA app
    When Gender is Male or Female
    Then Gender field is required
      | Field Name                     | Condition                                                    |
      | Gender                         | Required if "Sex" is "Male" or "Female"                      |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-93
  Scenario: Verify Gender Based eligibility description is available when Gender based study is Yes in Eligibility Criteria section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00327"
    And I go to Eligibility Criteria section in PA app
    When Gender based study is Yes
    Then Gender Based eligibility description is available

  @PA_HIGH @FDAAA @UI @CTRPMICRO-94
  Scenario: Verify Gender Based eligibility description is not available when Gender based study is No in Eligibility Criteria section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00327"
    And I go to Eligibility Criteria section in PA app
    When Gender based study is No
    Then Gender Based eligibility description is not available

  @PA_HIGH @FDAAA @UI @CTRPMICRO-95
  Scenario: Verify Gender is changed to Sex in Eligibility Criteria section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00327"
    When I go to Eligibility Criteria section in PA app
    Then Gender is changed to Sex
      | Field Name | New Field Name |
      | Gender     | Sex            |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-96
  Scenario: Verify field value is updated to Sex dropdown in Eligibility Criteria section(PA)
    Given I login into CTRP and search for a trial with NCI ID "NCI-2017-00327"
    When I go to Eligibility Criteria section in PA app
    Then these existing fields value should be updated
      | Field Name            | Existing Field Value | New Field Value |
      | Sex(old name: Gender) | Both                 | All             |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-24
  Scenario: Verify fields in Eligibility Criteria section for a new Trial (PA) created in Registration
    Given I registered a new Trial in Registry
    When I go to Eligibility Criteria section in PA app
    Then new fields with options should be there
      | Field Name                     | List Of Value |
      | Gender                         | Yes\NO        |
      | Gender Eligibility Description |               |


  @PA_HIGH @FDAAA @UI @CTRPMICRO-97
  Scenario: Verify Gender field is required in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    And I go to Eligibility Criteria section in PA app
    When Gender is Male or Female
    Then Gender field is required
      | Field Name                     | Condition                                                    |
      | Gender                         | Required if "Sex" is "Male" or "Female"                      |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-98
  Scenario: Verify Gender Based eligibility description is available when Gender based study is Yes in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    And I go to Eligibility Criteria section in PA app
    When Gender based study is Yes
    Then Gender Based eligibility description is available

  @PA_HIGH @FDAAA @UI @CTRPMICRO-99
  Scenario: Verify Gender Based eligibility description is not available when Gender based study is No in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    And I go to Eligibility Criteria section in PA app
    When Gender based study is No
    Then Gender Based eligibility description is not available

  @PA_HIGH @FDAAA @UI @CTRPMICRO-100
  Scenario: Verify Gender field is changed to Sex in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    When I go to Eligibility Criteria section in PA app
    Then Gender is changed to Sex
      | Field Name | New Field Name |
      | Gender     | Sex            |

  @PA_HIGH @FDAAA @UI @CTRPMICRO-101
  Scenario: Verify field value is updated to Sex dropdown in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    When I go to Eligibility Criteria section in PA app
    Then these existing fields value should be updated
      | Field Name            | Existing Field Value | New Field Value |
      | Sex(old name: Gender) | Both                 | All             |