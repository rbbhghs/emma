- view: healthcode_insurer_rules
  fields:

  - dimension: fallback_controlling_specialist
    type: yesno
    sql: ${TABLE}.fallback_controlling_specialist

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

  - dimension: location_payee_no
    type: yesno
    sql: ${TABLE}.location_payee_no

  - dimension: location_provider_no
    type: yesno
    sql: ${TABLE}.location_provider_no

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: practitioner_controlling_specialist
    type: yesno
    sql: ${TABLE}.practitioner_controlling_specialist

  - dimension: practitioner_payee_no
    type: yesno
    sql: ${TABLE}.practitioner_payee_no

  - dimension: practitioner_provider_no
    type: yesno
    sql: ${TABLE}.practitioner_provider_no

  - measure: count
    type: count
    drill_fields: [insurance_company.insurance_company_name]

