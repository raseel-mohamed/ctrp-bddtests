Feature: Tests for CTRP ECM Microservice for DTO messages from CTEP

  @PA_HIGH @FDAAA @PO @CTRPMICRO-192
  Scenario: CTEPECM_API01. Inserting the Org fields to the PO via ECM service
    Given I want to insert the Org field values into PO via ECM service
    When "GET" to ecm service api with CTEPID "NC004" and Content-Type "application/json" Accept "application/json" for "Organization"
    Then "GET" response should be "200"

  @PA_HIGH @FDAAA @PO @CTRPMICRO-199
  Scenario: CTEPECM_API02. Updating the Org fields to the PO via ECM service
    Given I want to update the Org field values into PO via ECM service
    When "GET" to ecm service api with CTEPID "NC004" and Content-Type "application/json" Accept "application/json" for "Organization"
    Then "GET" response should be "200"

  @PA_HIGH @FDAAA @PO @CTRPMICRO-204
  Scenario: CTEPECM_API03. Inserting the Person fields to the PO via ECM service
    Given I want to insert the Person field values into PO via ECM service
    When "GET" to ecm service api with CTEPID "555537" and Content-Type "application/json" Accept "application/json" for "Person"
    Then "GET" response should be "200"

  @PA_HIGH @FDAAA @PO @CTRPMICRO-208
  Scenario: CTEPECM_API04. Updating the Person fields to the PO via ECM service
    Given I want to update the Person field values into PO via ECM service
    When "GET" to ecm service api with CTEPID "555537" and Content-Type "application/json" Accept "application/json" for "Person"
    Then "GET" response should be "200"
