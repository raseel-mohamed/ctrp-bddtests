Feature: Tests for CTRP ECM Microservice for DTO messages from CTEP

  @PA_HIGH @FDAAA @PO @CTRPMICRO-192
  Scenario: CTEPECM_API01. GET JmsMessage from JMS que from ECM service



  @PA_HIGH @FDAAA @PO @CTRPMICRO-199
  Scenario: CTEPECM_API02. GET ResearchOrganization from from ECM service
    Given I send a GET request for "/ResearchOrganization/CIRB-PA121" for ResearchOrganization
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
    Given I send a GET request for "/Organization/CIRB-NC004" for Organization
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
    Given I send a GET request for "/HealthCareFacility/WA082" for HealthCareFacility
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

  @PA_HIGH @FDAAA @PO @CTRPMICRO-ABC
  Scenario: CTEPECM_API04. GET Person from from ECM service
    Given I send a GET request for "Person/513057" for Person
    Then the response should be JSON
    Then the response status code should be '200'
    Then the JSON response should be:

    """
    {"name":{"nullFlavor":null,"part":[{"code":null,"codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":"FAM","value":"Ageton"},
    {"code":null,"codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":"GIV","value":"Cheryl"},{"code":null,"codeSystem":null,"codeSystemVersion":null,"qualifier":null,"type":"PFX","value":"Ms."}]},
    "telecomAddress":{"item":[{"nullFlavor":null,"value":"mailto:cheryl.ageton@CTIS1avera.org"},
    {"nullFlavor":null,"value":"x-text-fax:(605)-322-3299"},{"nullFlavor":null,"value":"tel:(605)-322-3095"}]},
    "statusCode":{"nullFlavor":null,"code":"active","codeSystem":null,"codeSystemName":null,"codeSystemVersion":null,"displayName":null,"originalText":null},
    "ethnicGroupCode":null,"identifier":{"nullFlavor":null,"displayable":true,"extension":"513057","identifierName":"Cancer Therapy Evaluation Program Person Identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.6.1",
    "scope":"OBJ"},"postalAddress":{"nullFlavor":null,"part":[{"code":null,"codeSystem":null,"value":"1000 East 23rd Street","type":"AL"},
    {"code":null,"codeSystem":null,"value":"Suite 320","type":"ADL"},{"code":null,"codeSystem":null,"value":"Sioux Falls","type":"CTY"},
    {"code":null,"codeSystem":null,"value":"57105","type":"ZIP"},{"code":"SD ","codeSystem":null,"value":"South Dakota","type":"STA"},
    {"code":"US ","codeSystem":"ISO 3166-1 alpha-2","value":"USA","type":"CNT"}]},"sexCode":null,"statusDate":null,"raceCode":null,"birthDate":null}

    """

  @PA_HIGH @FDAAA @PO @CTRPMICRO-ABC
  Scenario: CTEPECM_API04. GET HealthCareProvider from from ECM service
    Given I send a GET request for "HealthCareProvider/42402" for HealthCareProvider
    Then the response should be JSON
    Then the response status code should be '200'
    Then the JSON response should be:

    """
    {"identifier":{"item":[{"nullFlavor":null,"displayable":true,"extension":"1654973","identifierName":"CTEP Health Care Provider Identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.6.1.1","scope":"OBJ"}]},
    "telecomAddress":{"item":[{"nullFlavor":null,"value":"mailto:mryan@CTIS1gboncology.com"},{"nullFlavor":null,"value":"x-text-fax:920-433-0288"},
    {"nullFlavor":null,"value":"tel:800-432-6049"}]},"duplicateOf":null,"status":{"nullFlavor":null,"code":"active","codeSystem":null,"codeSystemName":null,"codeSystemVersion":null,"displayName":null,"originalText":null},
    "certificateLicenseText":null,"playerIdentifier":{"nullFlavor":null,"displayable":true,"extension":"42402","identifierName":"Cancer Therapy Evaluation Program Person Identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.6.1","scope":"OBJ"},
    "scoperIdenticd fier":{"nullFlavor":null,"displayable":true,"extension":"WI116","identifierName":"Cancer Therapy Evaluation Program Organization Identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.6.2","scope":"OBJ"},
    "postalAddress":{"item":[{"nullFlavor":null,"part":[{"code":null,"codeSystem":null,"value":"835 South Van Buren Street","type":"AL"},{"code":null,"codeSystem":null,"value":"Green Bay","type":"CTY"},
    {"code":null,"codeSystem":null,"value":"54301-3526","type":"ZIP"},{"code":"WI ","codeSystem":null,"value":"Wisconsin","type":"STA"},
    {"code":"US ","codeSystem":"ISO 3166-1 alpha-2","value":"USA","type":"CNT"}]}]}}

    """

  @PA_HIGH @FDAAA @PO @CTRPMICRO-ABC
  Scenario: CTEPECM_API04. GET ClinicalResearchStaff from from ECM service
    Given I send a GET request for "ClinicalResearchStaff/527696" for ClinicalResearchStaff
    Then the response should be JSON
    Then the response status code should be '200'
    Then the JSON response should be:

    """
    {"identifier":{"item":[{"nullFlavor":null,"displayable":true,"extension":"2098151","identifierName":"CTEP Clinical Research Staff Person Identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.6.1.2","scope":"OBJ"}]},
    "telecomAddress":{"item":[{"nullFlavor":null,"value":"mailto:vwang@CTIS1jimmy.harvard.edu"},{"nullFlavor":null,"value":"x-text-fax:617-632-2444"},
    {"nullFlavor":null,"value":"tel:617-582-7585"}]},"duplicateOf":null,"status":{"nullFlavor":null,"code":"active","codeSystem":null,"codeSystemName":null,"codeSystemVersion":null,"displayName":null,"originalText":null},
    "playerIdentifier":{"nullFlavor":null,"displayable":true,"extension":"527696","identifierName":"Cancer Therapy Evaluation Program Person Identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.6.1","scope":"OBJ"},
    "scoperIdentifier":{"nullFlavor":null,"displayable":true,"extension":"MA036","identifierName":"Cancer Therapy Evaluation Program Organization Identifier","reliability":"ISS","root":"2.16.840.1.113883.3.26.6.2","scope":"OBJ"},
    "postalAddress":{"item":[{"nullFlavor":null,"part":[{"code":null,"codeSystem":null,"value":"Three Blackfan Circle","type":"AL"},{"code":null,"codeSystem":null,"value":"Boston","type":"CTY"},
    {"code":null,"codeSystem":null,"value":"02215","type":"ZIP"},{"code":"MA ","codeSystem":null,"value":"Massachusetts","type":"STA"},
    {"code":"US ","codeSystem":"ISO 3166-1 alpha-2","value":"USA","type":"CNT"}]}]}}

    """