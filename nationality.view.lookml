- view: nationality
  fields:

  - dimension: nationality_id
    primary_key: true
    type: int
    sql: ${TABLE}.nationality_id

  - dimension: code
    sql: ${TABLE}.code

  - dimension: description
    sql: ${TABLE}.description

  - dimension: nationality
    sql: ${TABLE}.description

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

  - measure: count
    type: count
    drill_fields: [nationality_id, individual.count]

