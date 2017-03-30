Feature: Tests for CTRP ECM Microservice for DTO messages from CTEP

  @PA_HIGH @FDAAA @PO @CTRPMICRO-192
  Scenario: CTEPECM_API01. GET JmsMessage from JMS que from ECM service



  @PA_HIGH @FDAAA @PO @CTRPMICRO-199
  Scenario: CTEPECM_API02. GET ResearchOrganization from from ECM service
    Given I send a GET request for "http://129.43.165.163:3300/api/v1/ecmservice/ResearchOrganization/CIRB-PA121" for ResearchOrganization
    Then the response should be JSON
    Then the response status code should be '200'
    Then the JSON response should be:

    """
    {"identifier":{"item":[{"nullFlavor":null,"displayable":true,"extension":"CIRB-PA121","identifierName":"Cancer Therapy Evaluation Program Organization Identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.6.2","scope":"OBJ"}]},
    "telecomAddress":{"item":[]},"duplicateOf":null,"status":{"nullFlavor":null,"code":"active","codeSystem":null,"codeSystemName":null,"codeSystemVersion":null,"displayName":null,"originalText":null},
    "typeCode":{"nullFlavor":null,"code":"CIRB","codeSystem":null,"codeSystemName":null,"codeSystemVersion":null,"displayName":null,"originalText":null},"fundingMechanism":null,"postalAddress":{"item":[{"nullFlavor":null,"part":[{"code":null,
    "codeSystem":null,"value":"1020 Walnut Street","type":"AL"},{"code":null,"codeSystem":null,"value":"Philadelphia",
    "type":"CTY"},{"code":null,"codeSystem":null,"value":"19107","type":"ZIP"},{"code":"PA ","codeSystem":null,"value":"Pennsylvania","type":"STA"},
    {"code":"US ","codeSystem":"ISO 3166-1 alpha-2","value":"USA","type":"CNT"}]}]},
    "name":{"nullFlavor":null,"part":[{"code":null,"codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":null,"value":"Thomas Jefferson University"}]},"playerIdentifier":null}

    """
  @PA_HIGH @FDAAA @PO @CTRPMICRO-204
  Scenario: CTEPECM_API03. GET Organization from from ECM service
    Given I send a GET request for "http://129.43.165.163:3300/api/v1/ecmservice/Organization/CIRB-NC004" for Organization
    Then the response should be JSON
    Then the response status code should be '200'
    Then the JSON response should be:

    """
  {"telecomAddress":{"item":[]},"statusDate":null,"familyOrganizationRelationships":null,"identifier":{"nullFlavor":null,
    "displayable":true,"extension":"CIRB-NC004","identifierName":"Cancer Therapy Evaluation Program Organization Identifier","reliability":"ISS",
    "root":"2.16.840.1.113883.3.26.6.2","scope":"OBJ"},"statusCode":{"nullFlavor":null,"code":"active","codeSystem":null,"codeSystemName":null,"codeSystemVersion":null,
    "displayName":null,"originalText":null},"postalAddress":{"nullFlavor":null,"part":[{"code":null,"codeSystem":null,"value":"501 North Elam Avenue","type":"AL"},{"code":null,
    "codeSystem":null,"value":"Greensboro","type":"CTY"},{"code":null,"codeSystem":null,"value":"27403","type":"ZIP"},{"code":"NC ","codeSystem":null,
    "value":"North Carolina","type":"STA"},{"code":"US ","codeSystem":"ISO 3166-1 alpha-2","value":"USA","type":"CNT"}]},
    "name":{"nullFlavor":null,"part":[{"code":null,"codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":null,
    "value":"The Moses H Cone Memorial Hospital Operating Corporation"}]}}

    """

  @PA_HIGH @FDAAA @PO @CTRPMICRO-208
  Scenario: CTEPECM_API04. GET HealthCareFacility from from ECM service
    Given I send a GET request for "http://129.43.165.163:3300/api/v1/ecmservice/HealthCareFacility/WA082" for HealthCareFacility
    Then the response should be JSON
    Then the response status code should be '200'
    Then the JSON response should be:

    """
    {"identifier":{"item":[{"nullFlavor":null,"displayable":true,"extension":"246058",
    "identifierName":"NCI health care facility identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.4.4.3",
    "scope":"OBJ"},{"nullFlavor":null,"displayable":true,"extension":"WA082","identifierName":"Cancer Therapy Evaluation Program Organization Identifier",
    "reliability":"ISS","root":"2.16.840.1.113883.3.26.6.2","scope":"OBJ"}]},"telecomAddress":{"item":[]},"duplicateOf":null,"status":{"nullFlavor":null,"code":"active",
    "codeSystem":null,"codeSystemName":null,"codeSystemVersion":null,"displayName":null,"originalText":null},"postalAddress":{"item":[{"nullFlavor":null,"part":[{"code":null,
    "codeSystem":null,"value":"PO Box 579","type":"AL"},{"code":null,"codeSystem":null,"value":"Longview","type":"CTY"},{"code":null,"codeSystem":null,"value":"98632","type":"ZIP"},
    {"code":"WA ","codeSystem":null,"value":"Washington","type":"STA"},{"code":"US ","codeSystem":"ISO 3166-1 alpha-2","value":"USA","type":"CNT"}]}]},"name":{"nullFlavor":null,"part":[{"code":null,
    "codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":null,"value":"Longview Surgical Group"}]},
    "playerIdentifier":{"nullFlavor":null,"displayable":true,"extension":"246054","identifierName":"NCI organization entity identifier","reliability":"ISS",
    "root":"2.16.840.1.113883.3.26.4.2","scope":"OBJ"}}

    """


  @PA_HIGH @FDAAA @PO
  Scenario: CTEPECM_API05. Verify the "Change Request Information" section is displayed in PO/Org
    Given I login into PO wand search for an Org with "Has Change Requests" check box checked
    Then click on Curate button in the search result and check for "Change Request Information" is displayed successfully
