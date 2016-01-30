- view: clinical_report_type
  fields:

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: report_type_id
    type: int
    hidden: true
    primary_key: true
    sql: ${TABLE}.report_type_id

  - dimension: restrict_appointment_type
    type: yesno
    sql: ${TABLE}.restrict_appointment_type

  - dimension: restrict_contract
    type: yesno
    sql: ${TABLE}.restrict_contract

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: []

