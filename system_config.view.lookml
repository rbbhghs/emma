- view: system_config
  fields:

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

  - dimension: setting
    sql: ${TABLE}.setting

  - dimension: value
    sql: ${TABLE}.value

  - measure: count
    type: count
    drill_fields: []

