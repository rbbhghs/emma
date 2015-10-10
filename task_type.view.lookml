- view: task_type
  fields:

  - dimension: task_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.task_type_id

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

  - dimension: task_type_name
    sql: ${TABLE}.task_type_name

  - measure: count
    type: count
    drill_fields: [task_type_id, task_type_name, emr2_procedure_type.count, task.count]

