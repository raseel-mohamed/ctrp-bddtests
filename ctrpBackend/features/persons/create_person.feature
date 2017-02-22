Feature: 01 Create Person

  @po_high
  Scenario: #1 To Create a person in CTRP
    Given I want to create person with values
      | prefix              | Dr.                       |
      | firstname           | John1                     |
      | middlename          | M                         |
      | lastname            | Phillips1                 |
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


  @po_medium
  Scenario: #2 To Update a person in CTRP
    Given a person exists with values
      | prefix              | Dr.                       |
      | firstname           | John1                     |
      | middlename          | M                         |
      | lastname            | Phillips1                 |
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
    And I want to update the person with values
      | prefix              | Mr.                       |
      | firstname           | John5                     |
      | middlename          | M                         |
      | lastname            | Phillips5                 |
      | suffix              | Phillips                  |
      | address_line1       | 300 First Street          |
      | address_line2       | New Corner                |
      | city                | Rochester                 |
      | state_or_province   | MD                        |
      | country             | USA                       |
      | postal_code         | 21704                     |
      | contact_email       | person_test@mail.nih.gov  |
      | contact_phone       | 111-555-1212              |
      | contact_fax         | 111-555-1212              |
      | status              | ACTIVE                    |
    When I used the "PUT" CTRP service with Content-Type "application/json" Accept "application/json" for "Person"
    Then response to "PUT" should be "200"
    And response body should include above created person values
    When I used the "GET" CTRP service with Content-Type "application/json" Accept "application/json" for "Person"
    Then response to "GET" should be "200"
    And response body should include above updated person values














