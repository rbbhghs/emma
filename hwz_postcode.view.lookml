- view: hwz_postcode
  fields:

  - dimension_group: last_modified
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: outcode
    primary_key: true
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
  
  - dimension: location
    type: location
    sql: ${TABLE}.x
    sql: ${TABLE}.y  

