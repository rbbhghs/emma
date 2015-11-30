- view: observation_annotation
  fields:

  - dimension: observation_annotation_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_annotation_id

  - dimension: default_annotation
    sql: ${TABLE}.default_annotation

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

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [observation_annotation_id, observation_name]

