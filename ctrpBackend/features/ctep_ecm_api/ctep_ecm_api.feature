Feature: Tests for CTRP ECM Microservice for DTO messages from CTEP


  Scenario: CTEPECM_API01. New field values that relay from ECM JMS messages in DTO format via RESTFul service(GET) successfully for Organization
    Given I want to get updated filed values Org into PO with CTEP ID NC004
      {"telecomAddress":{"item":[]},
      "statusDate":null,
      "familyOrganizationRelationships":null,
      "name":{"nullFlavor":null,
      "part":[{"code":null,"codeSystem":null,
      "codeSystemVersion":null,
      "qualifier":null,
      "type":null,
      "value":"The Moses H Cone Memorial Hospital Operating Corporation"}]},
      "identifier":{"nullFlavor":null,
      "displayable":true,
      "extension":"CIRB-NC004",
      "identifierName":"Cancer Therapy Evaluation Program Organization Identifier",
      "reliability":"ISS",
      "root":"2.16.840.1.113883.3.26.6.2",
      "scope":"OBJ"},
      "statusCode":{"nullFlavor":null,
      "code":"active",
      "codeSystem":null,
      "codeSystemName":null,
      "codeSystemVersion":null,
      "displayName":null,
      "originalText":null},
      "postalAddress":{"nullFlavor":null,
      "part":[{"code":null,
      "codeSystem":null,
      "value":"2400 West Friendly Avenue",
      "type":"AL"},
      {"code":null,
      "codeSystem":null,
      "value":"Greensboro",
      "type":"CTY"},
      {"code":null,
      "codeSystem":null,
      "value":"27403",
      "type":"ZIP"},
      {"code":"NC ",
      "codeSystem":null,
      "value":"North Carolina",
      "type":"STA"},
      {"code":"US ",
      "codeSystem":"ISO 3166-1 alpha-2",
      "value":"USA",
      "type":"CNT"}]}}
    When "POST" to ECM MS API with Content-Type "application/json" Accept "" by the "NC004"
    Then ECM MS API response to "POST" should be "200"


  Scenario: CTEPECM_API02. Error message is displayed when there is no VPN connection
    Given There is not VPN connection to the ECM MS and post GET with CTEP ID NC004
    When "POST" to CTRP Data Clinical Trials API with Content-Type "application/json" Accept "" by the "STUDY_PROTOCOL_ID_AND_NCI_ID"
    Then Then ECM MS API response to "POST" should be "400"


  Scenario: CTEPECM_API03. Verify the Updated values from CTEP DTO file format via RESTFul service (GET) in UI
    Given I want to get updated filed values Org into PO UI with CTEP ID NC004
      {"telecomAddress":{"item":[]},
      "statusDate":null,
      "familyOrganizationRelationships":null,
      "name":{"nullFlavor":null,
      "part":[{"code":null,"codeSystem":null,
      "codeSystemVersion":null,
      "qualifier":null,
      "type":null,
      "value":"The Moses H Cone Memorial Hospital Operating Corporation"}]},
      "identifier":{"nullFlavor":null,
      "displayable":true,
      "extension":"CIRB-NC004",
      "identifierName":"Cancer Therapy Evaluation Program Organization Identifier",
      "reliability":"ISS",
      "root":"2.16.840.1.113883.3.26.6.2",
      "scope":"OBJ"},
      "statusCode":{"nullFlavor":null,
      "code":"active",
      "codeSystem":null,
      "codeSystemName":null,
      "codeSystemVersion":null,
      "displayName":null,
      "originalText":null},
      "postalAddress":{"nullFlavor":null,
      "part":[{"code":null,
      "codeSystem":null,
      "value":"2400 West Friendly Avenue",
      "type":"AL"},
      {"code":null,
      "codeSystem":null,
      "value":"Greensboro",
      "type":"CTY"},
      {"code":null,
      "codeSystem":null,
      "value":"27403",
      "type":"ZIP"},
      {"code":"NC ",
      "codeSystem":null,
      "value":"North Carolina",
      "type":"STA"},
      {"code":"US ",
      "codeSystem":"ISO 3166-1 alpha-2",
      "value":"USA",
      "type":"CNT"}]}}
    When "POST" to ECM MS API with Content-Type "application/json" Accept "" by the "NC004"
    Then ECM MS API response to "POST" should be "200"
    And Verify the fileds in PO Organization

  Scenario: CTEPECM_API01. New field values that relay from ECM JMS messages in DTO format via RESTFul service(GET) successfully for Person
    Given I want to get updated filed values Person into PO with CTEP ID 555537
      {"name":{"nullFlavor":null,"part":[{"code":null,"codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":"FAM","value":"Holtzclaw"},
      {"code":null,"codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":"GIV","value":"Krystal"},
      {"code":null,"codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":"GIV","value":"Holly"},
      {"code":null,"codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":"PFX","value":"Ms."}]},
      "telecomAddress":{"item":[{"nullFlavor":null,"value":"mailto:holly.holtzclaw@gacancer.com"},
      {"nullFlavor":null,"value":"x-text-fax:(678)-355-9517"},
      {"nullFlavor":null,"value":"tel:(770)-590-8311-X-5744"}]},
      "identifier":{"nullFlavor":null,"displayable":true,"extension":"555537",
      "identifierName":"Cancer Therapy Evaluation Program Person Identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.6.1","scope":"OBJ"},
      "statusCode":{"nullFlavor":null,"code":"active",
      "codeSystem":null,"codeSystemName":null,"codeSystemVersion":null,"displayName":null,"originalText":null},
      "postalAddress":{"nullFlavor":null,"part":[{"code":null,"codeSystem":null,"value":"1000 Johnson Ferry Road Northeast","type":"AL"},
      {"code":null,"codeSystem":null,"value":"Atlanta","type":"CTY"},
      {"code":null,"codeSystem":null,"value":"30342","type":"ZIP"},
      {"code":"GA ","codeSystem":null,"value":"Georgia","type":"STA"},
      {"code":"US ","codeSystem":"ISO 3166-1 alpha-2","value":"USA","type":"CNT"}]},
      "ethnicGroupCode":null,"statusDate":null,"sexCode":null,"raceCode":null,"birthDate":null}
    When "POST" to ECM MS API with Content-Type "application/json" Accept "" by the "555537"
    Then ECM MS API response to "POST" should be "200"