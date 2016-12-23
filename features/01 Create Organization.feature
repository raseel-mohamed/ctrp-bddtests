Feature: 01 Create Organization

  @critical
  Scenario: #1 To Create an Organization in CTRP
    Given I want to create Organization with values
      | name              | Mayo Clinic Testxyzz      |
      | address_line1     | 200 First Street          |
      | address_line2     | New Corner                |
      | city              | Rochester                 |
      | state_or_province | MN                        |
      | country           | USA                       |
      | postal_code       | 55905                     |
      | contact_email     | mayo.test@mail.nih.gov    |
      | contact_phone     | 111-222-3333              |
      | contact_fax       | 111-222-3344              |
      | contact_TTY       | 111-222-3355              |
      | contact_URL       | http://www.mayoclinic.org |
      | status            | PENDING                   |
    When I used the "POST" CTRP service with Content-Type "application/json" Accept "application/json"
    Then response to "POST" should be "201"
    And response body should include above created Organization values
    When I used the "GET" CTRP service with Content-Type "application/json" Accept "application/json"
    Then response to "GET" should be "200"
    And response body should include above created Organization values