Feature: 01 Create Person

  @criticalper
  Scenario: #1 To Create a person in CTRP
    Given I want to create person with values
      | prefix              | Dr                        |
      | firstname           | John                      |
      | middlename          | M                         |
      | lastname            | Phillips                  |
      | suffix              | Phillips                  |
      | address_line1       | 200 First Street          |
      | address_line2       | New Corner                |
      | city                | Rochester                 |
      | state_or_province   | MN                        |
      | country             | USA                       |
      | postal_code         | 55905                     |
      | contact_email       | person_test@mail.nih.gov  |
      | contact_phone       | 111-222-3333              |
      | contact_fax         | 111-222-3344              |
      | status              | ACTIVE                    |
    When I used the "POST" CTRP service with Content-Type "application/json" Accept "application/json" for "Person"
    Then response to "POST" should be "201"
    And response body should include above created person values
    When I used the "GET" CTRP service with Content-Type "application/json" Accept "application/json" for "Person"
    Then response to "GET" should be "200"
    And response body should include above created person values
