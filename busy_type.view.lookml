- view: busy_type
  fields:

  - dimension: busy_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.busy_type_id

  - dimension: busy_type_name
    sql: ${TABLE}.busy_type_name

  - dimension: colour
    sql: ${TABLE}.colour

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [busy_type_id, busy_type_name, appointment_section.count]

