- view: appointment_type_problem
  fields:

  - dimension: appointment_type_problem_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_type_problem_id

  - dimension: appointment_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_id

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

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_type_problem_id
    - appointment_type.appointment_type_id
    - appointment_type.appointment_type_name
    - problem.problem_id
    - problem.problem_name
    - appointment.count
    - form_type_appointment_type_problem.count

