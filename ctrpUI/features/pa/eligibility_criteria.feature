Feature: Eligibility Criteria

  @pa_high @FDAAA @CTRPMICRO-17 @UI
  Scenario: Import a Trial from clinical trials.gov and verify fields in Eligibility Criteria section(PA)
    Given I Import a trial with NCT ID "NCT03045770"
    When I go to Eligibility Criteria section in PA app
    Then new fields with options should be there
      | Field Name                     | List Of Value |
      | Gender                         | Yes\NO        |
      | Gender Eligibility Description |               |

  @pa_high @FDAAA @CTRPMICRO-92 @UI
  Scenario: Verify Gender field is required in Eligibility Criteria section(PA)
    Given I search for a trial
    And I go to Eligibility Criteria section in PA app
    When Gender is Male or Female
    Then Gender field is required
      | Field Name                     | Condition                                                    |
      | Gender                         | Required if "Sex" is "Male" or "Female"                      |

  @pa_high @FDAAA @CTRPMICRO-93 @UI
  Scenario: Verify Gender Based eligibility description is available when Gender based study is Yes in Eligibility Criteria section(PA)
    Given I search for a trial
    And I go to Eligibility Criteria section in PA app
    When Gender based study is Yes
    Then Gender Based eligibility description is available

  @pa_high @FDAAA @CTRPMICRO-94 @UI
  Scenario: Verify Gender Based eligibility description is not available when Gender based study is No in Eligibility Criteria section(PA)
    Given I search for a trial
    And I go to Eligibility Criteria section in PA app
    When Gender based study is No
    Then Gender Based eligibility description is not available

  @pa_high @FDAAA @CTRPMICRO-95 @UI
  Scenario: Verify Gender is changed to Sex in Eligibility Criteria section(PA)
    Given I search for a trial
    When I go to Eligibility Criteria section in PA app
    Then Gender is changed to Sex
      | Field Name | New Field Name |
      | Gender     | Sex            |

  @pa_high @FDAAA @CTRPMICRO-96 @UI
  Scenario: Verify field value is updated to Sex dropdown in Eligibility Criteria section(PA)
    Given I search for a trial
    When I go to Eligibility Criteria section in PA app
    Then these existing fields value should be updated
      | Field Name            | Existing Field Value | New Field Value |
      | Sex(old name: Gender) | Both                 | All             |

  @pa_high @FDAAA @CTRPMICRO-24 @UI
  Scenario: Verify fields in Eligibility Criteria section for a new Trial (PA) created in Registration
    Given I registered a new Trial in Registry
    When I go to Eligibility Criteria section in PA app
    Then new fields with options should be there
      | Field Name                     | List Of Value |
      | Gender                         | Yes\NO        |
      | Gender Eligibility Description |               |


  @pa_high @FDAAA @CTRPMICRO-97 @UI
  Scenario: Verify Gender field is required in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    And I go to Eligibility Criteria section in PA app
    When Gender is Male or Female
    Then Gender field is required
      | Field Name                     | Condition                                                    |
      | Gender                         | Required if "Sex" is "Male" or "Female"                      |

  @pa_high @FDAAA @CTRPMICRO-98 @UI
  Scenario: Verify Gender Based eligibility description is available when Gender based study is Yes in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    And I go to Eligibility Criteria section in PA app
    When Gender based study is Yes
    Then Gender Based eligibility description is available

  @pa_high @FDAAA @CTRPMICRO-99 @UI
  Scenario: Verify Gender Based eligibility description is not available when Gender based study is No in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    And I go to Eligibility Criteria section in PA app
    When Gender based study is No
    Then Gender Based eligibility description is not available

  @pa_high @FDAAA @CTRPMICRO-100 @UI
  Scenario: Verify Gender field is changed to Sex in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    When I go to Eligibility Criteria section in PA app
    Then Gender is changed to Sex
      | Field Name | New Field Name |
      | Gender     | Sex            |

  @pa_high @FDAAA @CTRPMICRO-101 @UI
  Scenario: Verify field value is updated to Sex dropdown in Eligibility Criteria section(PA) for a new trial created in Registration
    Given I registered a new Trial in Registration
    When I go to Eligibility Criteria section in PA app
    Then these existing fields value should be updated
      | Field Name            | Existing Field Value | New Field Value |
      | Sex(old name: Gender) | Both                 | All             |