- view: observation_request_set
  fields:

  - dimension: observation_request_set_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_request_set_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: observation_request_code
    sql: ${TABLE}.observation_request_code

  - dimension: observation_set_code
    sql: ${TABLE}.observation_set_code

  - measure: count
    type: count
    drill_fields: [observation_request_set_id]

