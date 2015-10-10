- view: cab_cancellation_reason
  fields:

  - dimension: cab_cancellation_reason_code
    type: int
    sql: ${TABLE}.cab_cancellation_reason_code

  - dimension: cab_reason
    type: yesno
    sql: ${TABLE}.cab_reason

  - dimension: description
    sql: ${TABLE}.description

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_reason
    type: yesno
    sql: ${TABLE}.patient_reason

  - dimension: read_only
    type: yesno
    sql: ${TABLE}.read_only

  - dimension: status
    sql: ${TABLE}.status

  - dimension: terminal
    type: yesno
    sql: ${TABLE}.terminal

  - measure: count
    type: count
    drill_fields: []

