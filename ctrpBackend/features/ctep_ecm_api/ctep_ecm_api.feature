Feature: Tests for CTRP ECM Microservice for DTO messages from CTEP

  @PA_HIGH @FDAAA @PO @CTRPMICRO-192
  Scenario: CTEPECM_API01. GET JmsMessage from JMS que from ECM service
    Given I want to verify the "jms message" from ECM service
    When "GET" to ecm service api with Content-Type "application/json" for "JmsMessage"
    Then "GET" response should be "200"

  @PA_HIGH @FDAAA @PO @CTRPMICRO-199
  Scenario: CTEPECM_API02. GET ResearchOrganization from from ECM service
    Given I want to verify the "ResearchOrganization" from ECM service
    When "GET" to ecm service api with CTEPID "CIRB-PA121" with Content-Type "application/json" for "ResearchOrganization"
    Then "GET" response should be "200"
    And DTO should be displayed

  @PA_HIGH @FDAAA @PO @CTRPMICRO-204
  Scenario: CTEPECM_API03. GET Organization from from ECM service
    Given I want to verify the "Organization" from ECM service
    When "GET" to ecm service api with CTEPID "CIRB-NC004" with Content-Type "application/json" for "Organization"
    Then "GET" response should be "200"
    And DTO should be displayed

  @PA_HIGH @FDAAA @PO @CTRPMICRO-208
  Scenario: CTEPECM_API04. GET HealthCareFacility from from ECM service
    Given I want to verify the "HealthCareFacility" from ECM service
    When "GET" to ecm service api with CTEPID "WA082" with Content-Type "application/json" for "HealthCareFacility"
    Then "GET" response should be "200"
    And DTO should be displayed


  @PA_HIGH @FDAAA @PO
  Scenario: CTEPECM_API05. Verify the "Change Request Information" section is displayed in PO/Org
    Given I login into PO wand search for an Org with "Has Change Requests" check box checked
    Then click on Curate button in the search result and check for "Change Request Information" is displayed successfully
