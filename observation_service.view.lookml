- view: observation_service
  fields:

  - dimension: observation_service_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_service_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: min_age
    type: int
    sql: ${TABLE}.min_age

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: observation_service_category_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_service_category_id

  - dimension: observation_service_type
    sql: ${TABLE}.observation_service_type

  - dimension: service_code
    sql: ${TABLE}.service_code

  - dimension: service_name
    sql: ${TABLE}.service_name

  - dimension: sex
    sql: ${TABLE}.sex

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - observation_service_id
    - service_name
    - observation_service_category.observation_service_category_id
    - observation_service_category.observation_service_category_name
    - appointment_type_observation_service.count
    - common_observation_service.count
    - observation_request.count
    - product.count

