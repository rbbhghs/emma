- view: insurance_company
  fields:

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension: healthcode_id
    sql: ${TABLE}.healthcode_id

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension: insurance_company_name
    sql: ${TABLE}.insurance_company_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_instructions
    sql: ${TABLE}.patient_instructions

  - dimension: purchase_order_number
    sql: ${TABLE}.purchase_order_number

  - dimension: sage_reference
    sql: ${TABLE}.sage_reference

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - insurance_company_name
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - contract.contract_id
    - contract.contract_name
    - failed_patient_import.count
    - healthcode_insurer_rules.count
    - healthcode_practitioner_reference.count
    - healthcode_reference.count
    - patient.count

