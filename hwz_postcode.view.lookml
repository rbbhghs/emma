- view: hwz_postcode
  fields:

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: outcode
    sql: ${TABLE}.outcode

  - dimension: x
    type: int
    sql: ${TABLE}.x

  - dimension: y
    type: int
    sql: ${TABLE}.y

  - measure: count
    type: count
    drill_fields: []

