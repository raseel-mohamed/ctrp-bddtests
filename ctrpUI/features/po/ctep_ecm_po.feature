Feature: CTEP ECM Updates in PO

  @PA_HIGH  @PO @ECMUI @CTRPMICRO-1233
  Scenario: CTEPECM_UI101. Verify if the Org is updated with Change Request
    Given I Login into CTRP PO and Navigate to Org search screen
    When I run the MOCK service for the JMS Notification
    Then The Org with Change Request section is updated
    And  Search for the Org "181802" and Change Requestion section should be displayed


  @PA_HIGH  @PO @ECMUI @CTRPMICRO-ABC
  Scenario: CTEPECM_UI102. Verify if the ResearchOrganization is updated in PO
    Given I Login into CTRP PO and Navigate to Org search screen
    And Search for Org "181802" and navigate to the ResearchOrganization section
    When I run the MOCK service for the JMS Notification
    Then The ResearchOrganization is updated

  @PA_HIGH  @PO @ECMUI @CTRPMICRO-ABC
  Scenario: CTEPECM_UI103. Verify if the HealthCareFacility is updated in PO
    Given I Login into CTRP PO and Navigate to Org search screen
    And Search for Org "181802" and navigate to the HealthCareFacility section
    When I run the MOCK service for the JMS Notification
    Then The HealthCareFacility is updated


  @PA_HIGH  @PO @ECMUI @CTRPMICRO-ABC
  Scenario: CTEPECM_UI104. Verify if the Person is updated in PO
    Given I Login into CTRP PO and Navigate to Person search screen
    And Search for Person "513057" and navigate to the Person Information section
    When I run the MOCK service for the JMS Notification
    Then The Person is updated with new values from CTEP

  @PA_HIGH  @PO @ECMUI @CTRPMICRO-ABC
  Scenario: CTEPECM_UI105. Verify if the HealthCareProvider is updated in PO
    Given I Login into CTRP PO and Navigate to Person search screen
    And Search for Person "513057" and navigate to the Person Information section
    When I run the MOCK service for the JMS Notification
    Then The HealthCareProvider is updated with new values from CTEP

  @PA_HIGH  @PO @ECMUI @CTRPMICRO-ABC
  Scenario: CTEPECM_UI105. Verify if the ClinicalResearchStaff is updated in PO
    Given I Login into CTRP PO and Navigate to Person search screen
    And Search for Person "513057" and navigate to the Person Information section
    When I run the MOCK service for the JMS Notification
    Then The ClinicalResearchStaff is updated with new values from CTEP