- view: problem
  fields:

  - dimension: problem_id
    primary_key: true
    type: int
    sql: ${TABLE}.problem_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: problem_name
    sql: ${TABLE}.problem_name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [problem_id, problem_name, appointment_type_problem.count, reviewer_problem.count]

