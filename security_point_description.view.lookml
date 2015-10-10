- view: security_point_description
  fields:

  - dimension: security_point_description_id
    primary_key: true
    type: int
    sql: ${TABLE}.security_point_description_id

  - dimension: description
    sql: ${TABLE}.description

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: security_point_name
    sql: ${TABLE}.security_point_name

  - measure: count
    type: count
    drill_fields: [security_point_description_id, security_point_name]

