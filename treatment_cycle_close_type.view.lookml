- view: treatment_cycle_close_type
  fields:

  - dimension: treatment_cycle_close_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.treatment_cycle_close_type_id

  - dimension: email_template_group_id
    type: int
    # hidden: true
    sql: ${TABLE}.email_template_group_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: letter_template_id
    type: int
    sql: ${TABLE}.letter_template_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: speciality_id
    type: int
    # hidden: true
    sql: ${TABLE}.speciality_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: treatment_cycle_close_type_name
    sql: ${TABLE}.treatment_cycle_close_type_name

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - treatment_cycle_close_type_id
    - treatment_cycle_close_type_name
    - email_template_group.email_template_group_name
    - email_template_group.email_template_group_id
    - speciality.speciality_id
    - speciality.speciality_name
    - treatment_cycle.count

