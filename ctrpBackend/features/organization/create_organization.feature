Feature: 01 Create Organization

  @po_high
  Scenario: #1 To Create an Organization in CTRP
    Given I want to create Organization with values
      | name              | Mayo Clinic Test1         |
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
    When I used the "POST" CTRP service with Content-Type "application/json" Accept "application/json" for "Organization"
    Then response to "POST" should be "201"
    And response body should include above created Organization values
    When I used the "GET" CTRP service with Content-Type "application/json" Accept "application/json" for "Organization"
    Then response to "GET" should be "200"
    And response body should include above created Organization values


  @po_medium
  Scenario: #2 To Update an Organization in CTRP
    Given an Organization exist with values
      | name              | Mayo Clinic Test2         |
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
    And I want to update the organization with values
      | name              | Mayo Clinic Cancer Center    |
      | address_line1     | 24th Street                  |
      | address_line2     | New Corner                   |
      | city              | Washington                   |
      | state_or_province | DC                           |
      | country           | USA                          |
      | postal_code       | 20009                        |
      | contact_email     | mayo_cct@mail.mct.gov        |
      | contact_phone     | 111-444-3333                 |
      | contact_fax       | 111-555-3344                 |
      | contact_TTY       | 111-666-3355                 |
      | contact_URL       | http://www.mayoclinicCCT.org |
      | status            | ACTIVE                       |
    When I used the "PUT" CTRP service with Content-Type "application/json" Accept "application/json" for "Organization"
    Then response to "PUT" should be "200"
    And response body should include above created Organization values
    When I used the "GET" CTRP service with Content-Type "application/json" Accept "application/json" for "Organization"
    Then response to "GET" should be "200"
    And response body should include above created Organization values