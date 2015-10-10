- view: reviewer_problem
  fields:

  - dimension: reviewer_problem_id
    primary_key: true
    type: int
    sql: ${TABLE}.reviewer_problem_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: problem_id
    type: int
    # hidden: true
    sql: ${TABLE}.problem_id

  - dimension: reviewer_id
    type: int
    sql: ${TABLE}.reviewer_id

  - measure: count
    type: count
    drill_fields: [reviewer_problem_id, problem.problem_id, problem.problem_name]
