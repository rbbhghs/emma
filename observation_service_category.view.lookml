- view: observation_service_category
  fields:

  - dimension: observation_service_category_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_service_category_id

  - dimension: category_code
    sql: ${TABLE}.category_code

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: observation_service_category_name
    sql: ${TABLE}.observation_service_category_name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [observation_service_category_id, observation_service_category_name, observation_service.count]

