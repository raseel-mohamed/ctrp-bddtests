git Feature: Family service

  @critical1
  Scenario Outline: Search a Family
    Given I want to search a family with following fileds: "<fields>" and values: "<values>"
    When I used the "GET" CTRP service with Content-Type "" Accept "application/json" for "Family"
    Then response to "GET" should be "200"
    And the "JSON" response body should be a "Family" array with elements
       | name               | Holden Comprehensive Cancer Center        |
       | startDate          | 1230786000000                             |
       | p30SerialNumber    | 86862                                     |
       | member             |                                           |
       | familyId           | 16491545                                  |
       | organizationId     | 91802                                     |
       | type               | ORGANIZATIONAL                            |
       | startDate1         | 1230786000000                             |
       | endDate            | null                                      |
       | id                 | 16491545                                  |
       | status             | ACTIVE                                    |

    Examples:
      | fields             | values                                     |
      | name               | Holden Comprehensive Cancer Center         |
      | id                 | 16491545                                   |
      | organizationId     | 91802                                      |