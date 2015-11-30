- view: observation_abnormal_flag
  fields:

  - dimension: abnormal_flag
    sql: ${TABLE}.abnormal_flag

  - dimension: description
    sql: ${TABLE}.description

  - dimension: importance
    type: int
    sql: ${TABLE}.importance

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

