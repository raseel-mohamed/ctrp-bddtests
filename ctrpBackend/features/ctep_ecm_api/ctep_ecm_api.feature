Feature: Tests for CTRP ECM Microservice for DTO messages from CTEP


  Scenario: CTEPECM_API01. New field values that relay from ECM JMS messages in DTO format via RESTFul service(GET) successfully for Organization
    Given I want to get updated filed values Org into PO with CTEP ID NC004
    When "POST" to ECM MS API with Content-Type "application/json" Accept "" by the "NC004"
    Then ECM MS API response to "POST" should be "200"


  Scenario: CTEPECM_API02. Error message is displayed when there is no VPN connection
    Given There is not VPN connection to the ECM MS and post GET with CTEP ID NC004
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then Then ECM MS API response to "POST" should be "400"


  Scenario: CTEPECM_API03. Verify the Updated values from CTEP DTO file format via RESTFul service (GET) in UI
    Given I want to get updated filed values Org into PO UI with CTEP ID NC004
    When "POST" to ECM MS API with Content-Type "application/json" Accept "" by the "NC004"
    Then ECM MS API response to "POST" should be "200"
    And Verify the fileds in PO Organization

  Scenario: CTEPECM_API01. New field values that relay from ECM JMS messages in DTO format via RESTFul service(GET) successfully for Person
    Given I want to get updated filed values Person into PO with CTEP ID 555537
    When "POST" to ECM MS API with Content-Type "application/json" Accept "" by the "555537"
    Then ECM MS API response to "POST" should be "200"