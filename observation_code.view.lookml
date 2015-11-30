- view: observation_code
  fields:

  - dimension: observation_code_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_code_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: observation_code
    sql: ${TABLE}.observation_code

  - dimension: sort_order
    sql: ${TABLE}.sort_order

  - measure: count
    type: count
    drill_fields: [observation_code_id]

