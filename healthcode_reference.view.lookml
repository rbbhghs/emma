- view: healthcode_reference
  fields:

  - dimension: healthcode_reference_id
    primary_key: true
    type: int
    sql: ${TABLE}.healthcode_reference_id

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

  - dimension: location_id
    type: int
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: location_reference
    sql: ${TABLE}.location_reference

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: payee_reference
    sql: ${TABLE}.payee_reference

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [healthcode_reference_id, location.location_name, location.billing_location_id, insurance_company.insurance_company_name]

