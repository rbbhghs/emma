- view: observation_service_component
  fields:

  - dimension: observation_service_component_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_service_component_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: print_order
    sql: ${TABLE}.print_order

  - dimension: request_service_code
    sql: ${TABLE}.request_service_code

  - dimension: service_code
    sql: ${TABLE}.service_code

  - dimension: service_name
    sql: ${TABLE}.service_name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [observation_service_component_id, service_name]

