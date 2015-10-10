- view: healthcode_practitioner_reference
  fields:

  - dimension: healthcode_practitioner_reference_id
    primary_key: true
    type: int
    sql: ${TABLE}.healthcode_practitioner_reference_id

  - dimension: healthcode_reference
    sql: ${TABLE}.healthcode_reference

  - dimension: insurance_company_id
    type: int
    # hidden: true
    sql: ${TABLE}.insurance_company_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: practitioner_id
    type: int
    # hidden: true
    sql: ${TABLE}.practitioner_id

  - measure: count
    type: count
    drill_fields: [healthcode_practitioner_reference_id, insurance_company.insurance_company_name]

