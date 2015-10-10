- view: calendar
  fields:

  - dimension_group: d
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.d

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

