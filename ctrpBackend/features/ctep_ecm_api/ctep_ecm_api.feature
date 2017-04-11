Feature: Tests for CTRP ECM Microservice for DTO messages from CTEP

  @PA_HIGH @FDAAA @PO @CTRPMICRO-192
  Scenario: CTEPECM_API01. GET JmsMessage from JMS que from ECM service



  @PA_HIGH @FDAAA @PO @CTRPMICRO-199
  Scenario: CTEPECM_API02. GET ResearchOrganization from from ECM service
    Given I send a GET request "http://129.43.165.163:3300/api/v1/ecmservice/ResearchOrganization/CIRB-PA121" for ResearchOrganization
    Then the response status code should be '200'
    Then the JSON response should be displayed for ResearchOrganization

  @PA_HIGH @FDAAA @PO @CTRPMICRO-204
  Scenario: CTEPECM_API03. GET Organization from from ECM service
    Given I send a GET request for "http://ctrp-inttest-alb-backend-1739456098.us-east-1.elb.amazonaws.com:3300/api/v1/ecmservice/Organization/OH029" for Organization
    Then the response status code should be '200'
    Then the JSON response should be displayed for Organization

  @PA_HIGH @FDAAA @PO @CTRPMICRO-208
  Scenario: CTEPECM_API04. GET HealthCareFacility from from ECM service
    Given I send a GET request for "http://129.43.165.163:3300/api/v1/ecmservice/HealthCareFacility/WA082" for HealthCareFacility
    Then the response status code should be '200'
    Then the JSON response should be displayed for HealthCareFacility

  @PA_HIGH @FDAAA @PO @CTRPMICRO-ABC1
  Scenario: CTEPECM_API04. GET Person from from ECM service
    Given I send a GET request for "http://ctrp-inttest-alb-backend-1739456098.us-east-1.elb.amazonaws.com:3300/api/v1/ecmservice/Person/513057" for Person
    Then the response status code should be '200'
    Then the JSON response should be displayed for Person

  @PA_HIGH @FDAAA @PO @CTRPMICRO-ABC2
  Scenario: CTEPECM_API04. GET HealthCareProvider from from ECM service
    Given I send a GET request for "http://129.43.165.163:3300/api/v1/ecmservice/HealthCareProvider/42402" for HealthCareProvider
    Then the response status code should be '200'
    Then the JSON response should be displayed for HealthCareProvider

  @PA_HIGH @FDAAA @PO @CTRPMICRO-ABC3
  Scenario: CTEPECM_API04. GET ClinicalResearchStaff from from ECM service
    Given I send a GET request for "http://129.43.165.163:3300/api/v1/ecmservice/ClinicalResearchStaff/527696" for ClinicalResearchStaff
    Then the response status code should be '200'
    Then the JSON response should be displayed for ClinicalResearchStaff
