- view: observation_service_observation
  fields:

  - dimension: observation_service_observation_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_service_observation_id

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

  - dimension: observation_name
    sql: ${TABLE}.observation_name

  - dimension: print_order
    sql: ${TABLE}.print_order

  - dimension: reference_range
    sql: ${TABLE}.reference_range

  - dimension: service_code
    sql: ${TABLE}.service_code

  - dimension: status
    sql: ${TABLE}.status

  - dimension: units
    sql: ${TABLE}.units

  - dimension: value_type
    sql: ${TABLE}.value_type

  - measure: count
    type: count
    drill_fields: [observation_service_observation_id, observation_name]

