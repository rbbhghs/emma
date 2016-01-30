- view: non_conversion_reason
  fields:

  - dimension: code
    sql: ${TABLE}.code

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: reason
    sql: ${TABLE}.reason

  - dimension: reason_id
    type: int
    sql: ${TABLE}.reason_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: []

