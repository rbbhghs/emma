- view: cab_priority_type
  fields:

  - dimension: cab_priority_type_code
    type: int
    sql: ${TABLE}.cab_priority_type_code

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

  - measure: count
    type: count
    drill_fields: []

