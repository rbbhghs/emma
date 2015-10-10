- view: form_type_appointment_type_problem
  fields:

  - dimension: form_type_appointment_type_problem_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_type_appointment_type_problem_id

  - dimension: appointment_type_problem_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_problem_id

  - dimension: form_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_type_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - measure: count
    type: count
    drill_fields: [form_type_appointment_type_problem_id, form_type.form_type_id, appointment_type_problem.appointment_type_problem_id]

