Feature: Import ct api

  @IMPORT_CT_API_HIGH
  Scenario: CT_API01. Import Trial with NCT ID: NCT03093480 to verify Lead Org Trial ID
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Lead Org Trial ID
      | clinical Trial field | CTRP fields       |
      | org_study_id         | Lead Org Trial ID |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API02. Import Trial with NCT ID: NCT03087201 to verify Secondary ID
    Given I want to Import a trial with NCT ID NCT03087201
    Then I want to verify the Secondary  ID
      | clinical Trial field | CTRP fields |
      | secondary_id         | Other ID    |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API03. Import Trial with NCT ID: NCT03093480 to verify NCT ID
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the NCT ID
      | clinical Trial field | CTRP fields |
      | nct_id               | NCT ID      |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API04. Import Trial with NCT ID: NCT03093480 to verify brief title
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Brief Title
      | clinical Trial field | CTRP fields |
      | brief_title          | brief title |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API05. Import Trial with NCT ID: NCT03093480 to verify official Title
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Official Title
      | clinical Trial field | CTRP fields    |
      | official_title       | official title |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API06. Import Trial with NCT ID: NCT00000369 to verify official title if official title is empty in clinical trials.gov
    Given I want to Import a trial with NCT ID NCT00000369
    Then I want to verify the Official title is empty
      | clinical Trial field | CTRP fields             |
      | brief_title          | official title is empty |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API07. Import Trial with NCT ID: NCT03093636 to verify acronym
    Given I want to Import a trial with NCT ID NCT03093636
    Then I want to verify the acronym
      | clinical Trial field | CTRP fields |
      | acronym              | acronym     |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API08. Import Trial with NCT ID: NCT03093480 to verify Lead Organization
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Lead Organization
      | clinical Trial field | CTRP fields       |
      | lead_sponsor.agency  | Lead Organization |
    #Need to add database verification query

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API09. Import Trial with NCT ID: NCT03093480 to verify sponsor
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the sponsor
      | clinical Trial field | CTRP fields |
      | lead_sponsor.agency  | sponsor     |
    And I want to verify RO role is populated with this sponsor

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API10. Import Trial with NCT ID: NCT03088722 to verify collaborator
    Given I want to Import a trial with NCT ID NCT03088722
    Then I want to verify the collaborator
      | clinical Trial field | CTRP fields  |
      | collaborator.agency  | collaborator |
    And I want to verify the collaborator Functional Code should be “Laboratory” by default

  @IMPORT_CT_API_HIGH
  Scenario: CT_API11. Import Trial with NCT ID: NCT03093480 to verify Data Monitoring Committee Appointed Indicator
    Given I want to Import a trial with NCT ID NCT03093480
    Then I want to verify the Data Monitoring Committee Appointed Indicator
      | clinical Trial field   | CTRP fields                                   |
      | oversight_info.has_dmc | Data Monitoring Committee Appointed Indicator |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API12. Import Trial with NCT ID: NCT03087760 to verify FDA-regulated Drug Product
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the FDA-regulated Drug Product
      | clinical Trial field                 | CTRP fields                |
      | oversight_info.is_fda_regulated_drug | FDA-regulated Drug Product |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API13. Import Trial with NCT ID: NCT03087760 to verify FDA-regulated Device Product
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the FDA-regulated Device Product
      | clinical Trial field                   | CTRP fields                  |
      | oversight_info.is_fda_regulated_device | FDA-regulated Device Product |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API14. Import Trial with NCT ID: NCT03087760 to verify FDA Approval or Clearance
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the FDA Approval or Clearance
      | clinical Trial field                | CTRP fields               |
      | oversight_info.is_unapproved_device | FDA Approval or Clearance |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API15. Import Trial with NCT ID: NCT03087760 to verify Product Exported from the U.S
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the Product Exported from the U.S
      | clinical Trial field        | CTRP fields                   |
      | oversight_info.is_us_export | Product Exported from the U.S |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API16. Import Trial with NCT ID: NCT03087760 to verify Brief Summary
    Given I want to Import a trial with NCT ID NCT03087760
    Then I want to verify the brief summary
      | clinical Trial field | CTRP fields   |
      | brief_summary        | brief_summary |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API17. Import Trial with NCT ID: NCT03095131 to verify Detailed description
    Given I want to Import a trial with NCT ID NCT03095131
    Then I want to verify the Detailed description
      | clinical Trial field | CTRP fields          |
      | detailed_description | Detailed Description |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API18. Import Trial with NCT ID: NCT03088930 to verify Clinical Trial status: Not yet recruiting
    Given I want to Import a trial with NCT ID NCT03088930
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Not yet recruiting    | In Review         |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API19. Import Trial with NCT ID: NCT02969174 to verify Clinical Trial status: Approved for marketing
    Given I want to Import a trial with NCT ID NCT02969174
    Then I want to verify the Trial status
      | clinical Trial status  | CTRP Trial status |
      | Approved for marketing | Approved          |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API20. Import Trial with NCT ID: NCT03086395 to verify Clinical Trial status: Withdrawn
    Given I want to Import a trial with NCT ID NCT03086395
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Withdrawn             | Withdrawn         |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API21. Import Trial with NCT ID: NCT03079687 to verify Clinical Trial status: Available
    Given I want to Import a trial with NCT ID NCT03079687
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Available             | Active            |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API22. Import Trial with NCT ID: NCT03088904 to verify Clinical Trial status: Recruiting
    Given I want to Import a trial with NCT ID NCT03088904
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Recruiting            | Active            |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API23. Import Trial with NCT ID: NCT03087812 to verify Clinical Trial status: Enrolling by invitation
    Given I want to Import a trial with NCT ID NCT03087812
    Then I want to verify the Trial status
      | clinical Trial status   | CTRP Trial status       |
      | Enrolling by invitation | Enrolling by invitation |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API24. Import Trial with NCT ID: NCT03088449 to verify Clinical Trial status: Active, not recruiting
    Given I want to Import a trial with NCT ID NCT03088449
    Then I want to verify the Trial status
      | clinical Trial status  | CTRP Trial status |
      | Active, not recruiting | Closed to Accrual |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API25. Import Trial with NCT ID: NCT03085186 to verify Clinical Trial status: No longer available
    Given I want to Import a trial with NCT ID NCT03085186
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status                  |
      | No longer available   | Closed to Accrual and Intervention |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API26. Import Trial with NCT ID: NCT03057418 to verify Clinical Trial status: Suspended
    Given I want to Import a trial with NCT ID NCT03057418
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status                              |
      | Suspended             | Temporarily Closed to Accrual and Intervention |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API27. Import Trial with NCT ID: NCT03088891 to verify Clinical Trial status: Completed
    Given I want to Import a trial with NCT ID NCT03088891
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status |
      | Completed             | Completed         |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API28. Import Trial with NCT ID: NCT03072901 to verify Clinical Trial status: Terminated
    Given I want to Import a trial with NCT ID NCT03072901
    Then I want to verify the Trial status
      | clinical Trial status | CTRP Trial status         |
      | Terminated            | Administratively Complete |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API29. Import Trial with NCT ID: NCT03063710 to verify Clinical Trial status: Temporarily not available
    Given I want to Import a trial with NCT ID NCT03063710
    Then I want to verify the Trial status
      | clinical Trial status     | CTRP Trial status                              |
      | Temporarily not available | Temporarily Closed to Accrual and Intervention |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API30. Import Trial with NCT ID: NCT03090061 to verify Trial Start Date and Trial Start Date option: Anticipated
    Given I want to Import a trial with NCT ID NCT03090061
    Then I want to verify the Trial Start Date
      | clinical Trial field | CTRP field              |
      | start_date           | Trial Start Date        |
      | start_date type      | Trial Start Date option |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API31. Import Trial with NCT ID: NCT03088722 to verify Trial Start Date and Trial Start Date option: Actual
    Given I want to Import a trial with NCT ID NCT03088722
    Then I want to verify the Trial Start Date
      | clinical Trial field | CTRP field              |
      | start_date           | Trial Start Date        |
      | start_date type      | Trial Start Date option |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API32. Import Trial with NCT ID: NCT00000309 to verify Trial Start Date and no Trial Start Date option
    Given I want to Import a trial with NCT ID NCT00000309
    Then I want to verify the Trial Start Date
      | clinical Trial field | CTRP field               |
      | start_date           | Trial Start Date option  |
    And For the Trial Start Date in Past the Trial Start Date option should be populated as "Actual"

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API33. Import Trial with NCT ID: NCT03083132 to verify Completion Date and Completion Date option: Anticipated
    Given I want to Import a trial with NCT ID NCT03083132
    Then I want to verify the Completion Date
      | clinical Trial field | CTRP field             |
      | completion_date      | Completion Date        |
      | completion_date type | Completion Date option |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API34. Import Trial with NCT ID: NCT03088722 to verify Completion Date and Completion Date option: Actual
    Given I want to Import a trial with NCT ID NCT03088722
    Then I want to verify the Completion Date
      | clinical Trial field | CTRP field             |
      | completion_date      | Completion Date        |
      | completion_date type | Completion Date option |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API35. Import Trial with NCT ID: NCT03083132 to verify Primary Completion Date and Primary Completion Date option: Anticipated
    Given I want to Import a trial with NCT ID NCT03083132
    Then I want to verify the Primary Completion Date
      | clinical Trial field         | CTRP field                     |
      | primary_completion_date      | Primary Completion Date        |
      | primary_completion_date type | Primary Completion Date option |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API36. Import Trial with NCT ID: NCT03088722 to verify Primary Completion Date and Primary Completion Date option: Actual
    Given I want to Import a trial with NCT ID NCT03088722
    Then I want to verify the Primary Completion Date
      | clinical Trial field         | CTRP field                     |
      | primary_completion_date      | Primary Completion Date        |
      | primary_completion_date type | Primary Completion Date option |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API37. Import Trial with NCT ID: NCT03045770 to verify Start Date, Completion Date and Primary Completion Date with Month, Date and Year in it
    Given I want to Import a trial with NCT ID NCT03045770
    Then I want to verify the Date field
      | clinical Trial field    | CTRP field              |
      | start_date              | Trial Start Date        |
      | completion_date         | Completion Date         |
      | primary_completion_date | Primary Completion Date |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API38. Import Trial with NCT ID: NCT00000142 to verify Start Date, Completion Date and Primary Completion Date with just Month and Year in it
    Given I want to Import a trial with NCT ID NCT00000142
    Then I want to verify the Date field
      | clinical Trial field    | CTRP field                                |
      | start_date              | Trial Start Date (DD should be 01)        |
      | completion_date         | Completion Date (DD should be 01)         |
      | primary_completion_date | Primary Completion Date (DD should be 01) |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API39. Import Trial with NCT ID: NCT03090048 to verify Phase: Early Phase
    Given I want to Import a trial with NCT ID NCT03090048
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase    |
      | Early Phase 1        | Early Phase 1 |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API40. Import Trial with NCT ID: NCT03089918 to verify Phase 1
    Given I want to Import a trial with NCT ID NCT03089918
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 1              | I          |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API41. Import Trial with NCT ID: NCT03090165 to verify Phase 1/Phase 2
    Given I want to Import a trial with NCT ID NCT03090165
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 1/Phase 2      | I/II       |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API42. Import Trial with NCT ID: NCT03090412 to verify Phase 2
    Given I want to Import a trial with NCT ID NCT03090412
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 2              | II         |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API43. Import Trial with NCT ID: NCT03090516 to verify Phase 2/Phase 3
    Given I want to Import a trial with NCT ID NCT03090516
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 2/Phase 3      | II/III     |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API44. Import Trial with NCT ID: NCT03090191 to verify Phase 3
    Given I want to Import a trial with NCT ID NCT03090191
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 3              | III        |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API45. Import Trial with NCT ID: NCT03090503 to verify Phase 4
    Given I want to Import a trial with NCT ID NCT03090503
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | Phase 4              | IV         |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API46. Import Trial with NCT ID: NCT03089892 to verify Phase: N/A
    Given I want to Import a trial with NCT ID NCT03089892
    Then I want to verify the Phase
      | clinical Trial phase | CTRP phase |
      | N/A                  | NA         |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API47. Import Trial with NCT ID: NCT03001349 to verify Clinical Trial type: Expanded Access
    Given I want to Import a trial with NCT ID NCT03001349
    Then I want to verify the Trial Type
      | clinical Trial type | CTRP Study Type      |
      | Expanded Access     | Interventional Study |
    And Expanded Access should be "Yes"


  Scenario: CT_API48. Import Trial with NCT ID: NCT03095144 to verify Clinical Trial type: Interventional Study
    Given I want to Import a trial with NCT ID NCT03095144
    Then I want to verify the Trial Type
      | clinical Trial type | CTRP Study Type      |
      | Interventional      | Interventional Study |
    And Expanded Access should be "No"

  Scenario: CT_API49. Import Trial with NCT ID: NCT03090464 to verify Clinical Trial type: Observational Study
    Given I want to Import a trial with NCT ID NCT03090464
    Then I want to verify the Trial Type
      | clinical Trial type | CTRP Study Type          |
      | Observational       | Non-Interventional Study |
    And Expanded Access should be "No"

  Scenario: CT_API50. Import Trial with NCT ID: NCT03090308 to verify Clinical Trial type: Observational [Patient Registry] Study
    Given I want to Import a trial with NCT ID NCT03090308
    Then I want to verify the Trial Type
      | clinical Trial type              | CTRP Study Type          |
      | Observational [Patient Registry] | Non-Interventional Study |
    And Expanded Access should be "No"

  Scenario: CT_API51. Import Trial with NCT ID: NCT03090217 to verify Clinical Trial Allocation: Randomized
    Given I want to Import a trial with NCT ID NCT03090217
    Then I want to verify the Allocation
      | clinical Trial allocation | CTRP Study Allocation       |
      | Randomized                | Randomized Controlled Trial |

  Scenario: CT_API52. Import Trial with NCT ID: NCT03095248 to verify Clinical Trial Allocation: Non-Randomized
    Given I want to Import a trial with NCT ID NCT03095248
    Then I want to verify the Allocation
      | clinical Trial allocation | CTRP Study Allocation |
      | Non-Randomized            | Non-Randomized Trial  |

  Scenario: CT_API53. Import Trial with NCT ID: NCT03090347 to verify Clinical Trial Interventional Model: Single Group Assignment
    Given I want to Import a trial with NCT ID NCT03090347
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Single Group Assignment             | Single Group              |

  Scenario: CT_API54. Import Trial with NCT ID: NCT03095651 to verify Clinical Trial Interventional Model: Parallel Assignment
    Given I want to Import a trial with NCT ID NCT03095651
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Parallel Assignment                 | Parallel                  |

  Scenario: CT_API55. Import Trial with NCT ID: NCT03089723 to verify Clinical Trial Interventional Model: Crossover Assignment
    Given I want to Import a trial with NCT ID NCT03089723
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Crossover Assignment                | Cross-over                |

  Scenario: CT_API56. Import Trial with NCT ID: NCT01178892 to verify Clinical Trial Interventional Model: Factorial Assignment
    Given I want to Import a trial with NCT ID NCT01178892
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Factorial Assignment                | Factorial                 |

  Scenario: CT_API57. Import Trial with NCT ID: NCT03089203 to verify Clinical Trial Interventional Model: Sequential Assignment
    Given I want to Import a trial with NCT ID NCT03089203
    Then I want to verify the Interventional Model
      | clinical Trial Interventional Model | CTRP Interventional Model |
      | Sequential Assignment               | Sequential                |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API58. Import Trial with NCT ID: NCT03098550 to verify Clinical Trial Masking: No masking
    Given I want to Import a trial with NCT ID NCT03098550
    Then I want to verify the Masking
      | clinical Trial Masking | CTRP Masking |
      | No masking             | No masking   |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API59. Import Trial with NCT ID: NCT03098524 to verify Clinical Trial Masking: Participant
    Given I want to Import a trial with NCT ID NCT03098524
    Then I want to verify the Masking
      | clinical Trial Masking | CTRP Masking |
      | Participant            | Participant  |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API60. Import Trial with NCT ID: NCT03098524 to verify Clinical Trial Masking: Investigator
    Given I want to Import a trial with NCT ID NCT03098550
    Then I want to verify the Masking
      | clinical Trial Masking | CTRP Masking |
      | Investigator           | Investigator |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API61. Import Trial with NCT ID: NCT03098511 to verify Clinical Trial Masking: Care Provider
    Given I want to Import a trial with NCT ID NCT03098511
    Then I want to verify the Masking
      | clinical Trial Masking | CTRP Masking  |
      | Care Provider          | Care Provider |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API62. Import Trial with NCT ID: NCT03098524 to verify Clinical Trial Masking: Outcomes Assessor
    Given I want to Import a trial with NCT ID NCT03098524
    Then I want to verify the Masking
      | clinical Trial Masking | CTRP Masking      |
      | Outcomes Assessor      | Outcomes Assessor |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API63. Import Trial with NCT ID: NCT03098017 to verify Clinical Trial Primary Purpose: Basic Science
    Given I want to Import a trial with NCT ID NCT03098017
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking  |
      | Basic Science                  | Basic Science |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API64. Import Trial with NCT ID: NCT03097887 to verify Clinical Trial Primary Purpose: Diagnostic
    Given I want to Import a trial with NCT ID NCT03097887
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking |
      | Diagnostic                     | Diagnostic   |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API65. Import Trial with NCT ID: NCT03097640 to verify Clinical Trial Primary Purpose: Health Services Research
    Given I want to Import a trial with NCT ID NCT03097640
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking             |
      | Health Services Research       | Health Services Research |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API66. Import Trial with NCT ID: NCT03097588 to verify Clinical Trial Primary Purpose: Prevention
    Given I want to Import a trial with NCT ID NCT03097588
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking |
      | Prevention                     | Prevention   |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API67. Import Trial with NCT ID: NCT03096938 to verify Clinical Trial Primary Purpose: Screening
    Given I want to Import a trial with NCT ID NCT03096938
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking |
      | Screening                      | Screening    |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API68. Import Trial with NCT ID: NCT03096756 to verify Clinical Trial Primary Purpose: Supportive Care
    Given I want to Import a trial with NCT ID NCT03096756
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking    |
      | Supportive Care                | Supportive Care |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API69. Import Trial with NCT ID: NCT03096782 to verify Clinical Trial Primary Purpose: Treatment
    Given I want to Import a trial with NCT ID NCT03096782
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking |
      | Treatment                      | Treatment    |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API70. Import Trial with NCT ID: NCT03098511 to verify Clinical Trial Primary Purpose: Device Feasibility
    Given I want to Import a trial with NCT ID NCT03098511
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking       |
      | Device Feasibility             | Device Feasibility |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API71. Import Trial with NCT ID: NCT03090178 to verify Clinical Trial Primary Purpose: Other
    Given I want to Import a trial with NCT ID NCT03090178
    Then I want to verify the Primary Purpose
      | clinical Trial Primary Purpose | CTRP Masking |
      | Other                          | Other        |
    And Description should be populated

  @IMPORT_CT_API_HIGH
  Scenario: CT_API72. Import Trial with NCT ID: NCT03097640 to verify Clinical Trial Outcome Measures: Primary
    Given I want to Import a trial with NCT ID NCT03097640
    Then I want to verify the Outcome Measures
      | clinical Trial Outcome Measures | CTRP Outcome Measures            |
      | primary_outcome                 | Outcome Measure Type = “PRIMARY” |
      | primary_outcome.measure         | Title                            |
      | primary_outcome.time_frame      | Time Frame                       |
      | primary_outcome.description     | Description                      |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API73. Import Trial with NCT ID: NCT03097640 to verify Clinical Trial Outcome Measures: Secondary
    Given I want to Import a trial with NCT ID NCT03097640
    Then I want to verify the Outcome Measures
      | clinical Trial Outcome Measures | CTRP Outcome Measures              |
      | secondary_outcome               | Outcome Measure Type = “SECONDARY” |
      | secondary_outcome.measure       | Title                              |
      | secondary_outcome.time_frame    | Time Frame                         |
      | secondary_outcome.description   | Description                        |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API74. Import Trial with NCT ID: NCT03096340 to verify Clinical Trial Outcome Measures: other_outcome
    Given I want to Import a trial with NCT ID NCT03096340
    Then I want to verify the Outcome Measures
      | clinical Trial Outcome Measures | CTRP Outcome Measures                        |
      | other_outcome                   | Outcome Measure Type = “OTHER_PRE_SPECIFIED” |
      | other_outcome.measure           | Title                                        |
      | other_outcome.time_frame        | Time Frame                                   |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API75. Import Trial with NCT ID: NCT03097640 to verify Number of Arms
    Given I want to Import a trial with NCT ID NCT03097640
    Then I want to verify the Number of Arms
      | clinical Trial Field | CTRP field     |
      | number_of_arms       | Number of Arms |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API76. Import Trial with NCT ID: NCT03097640 to verify Enrollment
    Given I want to Import a trial with NCT ID NCT03097640
    Then I want to verify the Target Enrollment
      | clinical Trial Field | CTRP field        |
      | enrollment           | Target Enrollment |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API77. Import Trial with NCT ID: NCT03097640 to verify Clinical Trial Arm Type: NULL
    Given I want to Import a trial with NCT ID NCT03097640
    Then I want to verify the Arm
      | clinical Trial Arm                   | CTRP Arm    |
      | arm_group.arm_group_label            | Label       |
      | arm_group.arm_group_type = Secondary | Type        |
      | arm_group.description                | Description |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API78. Import Trial with NCT ID: NCT03096457 to verify Clinical Trial Arm Type: Active Comparator
    Given I want to Import a trial with NCT ID NCT03096457
    Then I want to verify the Arm
      | clinical Trial Arm                           | CTRP Arm                 |
      | arm_group.arm_group_label                    | Label                    |
      | arm_group.arm_group_type = Active Comparator | Type = Active Comparator |
      | arm_group.description                        | Description              |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API79. Import Trial with NCT ID: NCT03096457 to verify Clinical Trial Arm Type: Experimental
    Given I want to Import a trial with NCT ID NCT03096457
    Then I want to verify the Arm
      | clinical Trial Arm                      | CTRP Arm            |
      | arm_group.arm_group_label               | Label               |
      | arm_group.arm_group_type = Experimental | Type = Experimental |
      | arm_group.description                   | Description         |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API80. Import Trial with NCT ID: NCT02827994 to verify Clinical Trial Arm Type: No Intervention
    Given I want to Import a trial with NCT ID NCT02827994
    Then I want to verify the Arm
      | clinical Trial Arm                         | CTRP Arm               |
      | arm_group.arm_group_label                  | Label                  |
      | arm_group.arm_group_type = No Intervention | Type = No Intervention |
      | arm_group.description                      | Description            |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API81. Import Trial with NCT ID: NCT03098537 to verify Clinical Trial Arm Type: Other
    Given I want to Import a trial with NCT ID NCT03098537
    Then I want to verify the Arm
      | clinical Trial Arm               | CTRP Arm     |
      | arm_group.arm_group_label        | Label        |
      | arm_group.arm_group_type = Other | Type = Other |
      | arm_group.description            | Description  |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API82. Import Trial with NCT ID: NCT03096457 to verify Clinical Trial Arm Type: Placebo Comparator
    Given I want to Import a trial with NCT ID NCT03096457
    Then I want to verify the Arm
      | clinical Trial Arm                            | CTRP Arm                  |
      | arm_group.arm_group_label                     | Label                     |
      | arm_group.arm_group_type = Placebo Comparator | Type = Placebo Comparator |
      | arm_group.description                         | Description               |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API83. Import Trial with NCT ID: NCT00819182 to verify Clinical Trial Arm Type: Sham Comparator
    Given I want to Import a trial with NCT ID NCT00819182
    Then I want to verify the Arm
      | clinical Trial Arm                         | CTRP Arm               |
      | arm_group.arm_group_label                  | Label                  |
      | arm_group.arm_group_type = Sham Comparator | Type = Sham Comparator |
      | arm_group.description                      | Description            |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API84. Import Trial with NCT ID: NCT03098212 to verify Clinical Trial Eligibility Criterion Type = “INCLUSION”
    Given I want to Import a trial with NCT ID NCT03098212
    Then I want to verify the Eligibility Criterion
      | clinical Trial Eligibility Criterion   | CTRP Eligibility Criterion |
      | Eligibility Criterion Type = INCLUSION | Type = INCLUSION           |
      | description                            | Description                |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API85. Import Trial with NCT ID: NCT03098212 to verify Clinical Trial Eligibility Criterion Type = “EXCLUSION”
    Given I want to Import a trial with NCT ID NCT03098212
    Then I want to verify the Eligibility Criterion
      | clinical Trial Eligibility Criterion   | CTRP Eligibility Criterion |
      | Eligibility Criterion Type = EXCLUSION | Type = EXCLUSION           |
      | description                            | Description                |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API86. Import Trial with NCT ID: NCT03098355 to verify Clinical Trial Gender based
    Given I want to Import a trial with NCT ID NCT03098355
    Then I want to verify the Gender Based
      | clinical Trial Gender Based | CTRP Gender |
      | eligibility.gender_based    | Gender      |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API87. Import Trial with NCT ID: NCT03098420 to verify Clinical Trial Gender description
    Given I want to Import a trial with NCT ID NCT03098420
    Then I want to verify the Gender Description
      | clinical Trial Gender Based | CTRP Gender        |
      | Gender description          | Gender description |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API88. Import Trial with NCT ID: NCT00947284 to verify Clinical Trial Gender: Male
    Given I want to Import a trial with NCT ID NCT00947284
    Then I want to verify the Sex
      | clinical Trial Gender     | CTRP Sex |
      | eligibility.gender = Male | Male     |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API89. Import Trial with NCT ID: NCT02181595 to verify Clinical Trial Gender: Female
    Given I want to Import a trial with NCT ID NCT02181595
    Then I want to verify the Sex
      | clinical Trial Gender       | CTRP Sex |
      | eligibility.gender = Female | Female   |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API90. Import Trial with NCT ID: NCT01827657 to verify Clinical Trial Gender: All
    Given I want to Import a trial with NCT ID NCT01827657
    Then I want to verify the Sex
      | clinical Trial Gender    | CTRP Sex |
      | eligibility.gender = All | All      |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API91. Import Trial with NCT ID: NCT03098355 to verify minimum age
    Given I want to Import a trial with NCT ID NCT03098355
    Then I want to verify the minimum age
      | clinical Trial          | CTRP Age    |
      | eligibility.minimum_age | minimum age |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API92. Import Trial with NCT ID: NCT03098355 to verify minimum age = N/A
    Given I want to Import a trial with NCT ID NCT03098355
    Then I want to verify the minimum age
      | clinical Trial                | CTRP Age |
      | eligibility.minimum_age = N/A | 0        |
    And Units of Measurement should be Years

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API93. Import Trial with NCT ID: NCT03098355 to verify minimum & maximum age, Units of Measurement = Years
    Given I want to Import a trial with NCT ID NCT03098355
    Then I want to verify the minimum & maximum age, Units of Measurement
      | clinical Trial Units of Measurement                    | CTRP Units of Measurement |
      | eligibility.minimum_age (Units of Measurement = Years) | Years                     |
      | eligibility.maximum_age (Units of Measurement = Years) | Years                     |

  @IMPORT_CT_API_LOW
  Scenario: CT_API94. Import Trial with NCT ID: NCT03094247 to verify minimum & maximum age, Units of Measurement = Months
    Given I want to Import a trial with NCT ID NCT03094247
    Then I want to verify the minimum & maximum age, Units of Measurement
      | clinical Trial Units of Measurement                     | CTRP Units of Measurement |
      | eligibility.minimum_age (Units of Measurement = Months) | Months                    |
      | eligibility.maximum_age (Units of Measurement = Months) | Months                    |

  @IMPORT_CT_API_LOW
  Scenario: CT_API95. Import Trial with NCT ID: NCT03093337 to verify minimum & maximum age, Units of Measurement = Weeks
    Given I want to Import a trial with NCT ID NCT03093337
    Then I want to verify the minimum & maximum age, Units of Measurement
      | clinical Trial Units of Measurement                    | CTRP Units of Measurement |
      | eligibility.minimum_age (Units of Measurement = Weeks) | Weeks                     |
      | eligibility.maximum_age (Units of Measurement = Weeks) | Weeks                     |

  @IMPORT_CT_API_LOW
  Scenario: CT_API96. Import Trial with NCT ID: NCT03081936 to verify minimum & maximum age, Units of Measurement = Days
    Given I want to Import a trial with NCT ID NCT03081936
    Then I want to verify the minimum & maximum age, Units of Measurement
      | clinical Trial Units of Measurement                   | CTRP Units of Measurement |
      | eligibility.minimum_age (Units of Measurement = Days) | Days                      |
      | eligibility.maximum_age (Units of Measurement = Days) | Days                      |

  @IMPORT_CT_API_LOW
  Scenario: CT_API97. Import Trial with NCT ID: NCT03098069 to verify minimum & maximum age, Units of Measurement = Minutes
    Given I want to Import a trial with NCT ID NCT03098069
    Then I want to verify the minimum & maximum age, Units of Measurement
      | clinical Trial Units of Measurement                      | CTRP Units of Measurement |
      | eligibility.minimum_age (Units of Measurement = Minutes) | Minutes                   |
      | eligibility.maximum_age (Units of Measurement = Minutes) | Minutes                   |

  @IMPORT_CT_API_LOW
  Scenario: CT_API98. Import Trial with NCT ID: NCT03079167 to verify minimum & maximum age, Units of Measurement = Hours
    Given I want to Import a trial with NCT ID NCT03079167
    Then I want to verify the minimum & maximum age, Units of Measurement
      | clinical Trial Units of Measurement                    | CTRP Units of Measurement |
      | eligibility.minimum_age (Units of Measurement = Hours) | Hours                     |
      | eligibility.maximum_age (Units of Measurement = Hours) | Hours                     |

  @IMPORT_CT_API_HIGH
  Scenario: CT_API99. Import Trial with NCT ID: NCT03085680 to verify maximum age
    Given I want to Import a trial with NCT ID NCT03085680
    Then I want to verify the maximum age
      | clinical Trial          | CTRP Age    |
      | eligibility.maximum_age | maximum age |

  @IMPORT_CT_API_MEDIUM
  Scenario: CT_API100. Import Trial with NCT ID: NCT03095716 to verify maximum age = N/A
    Given I want to Import a trial with NCT ID NCT03095716
    Then I want to verify the maximum age
      | clinical Trial                | CTRP Age |
      | eligibility.maximum_age = N/A | 999      |
    And Units of Measurement should be Years

  Scenario: CT_API101. Import Trial with NCT ID: NCT02512757 to verify Study Model: Case-Control
    Given I want to Import a trial with NCT ID NCT02512757
    Then I want to verify the Study Model
      | clinical Trial Study Model | CTRP fields  |
      | Case-Control               | Case-Control |
