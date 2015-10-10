- view: appointment_type_review_speciality
  fields:

  - dimension: appointment_type_review_speciality_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_type_review_speciality_id

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

  - dimension: speciality_id
    type: int
    # hidden: true
    sql: ${TABLE}.speciality_id

  - measure: count
    type: count
    drill_fields: [appointment_type_review_speciality_id, appointment_type.appointment_type_id, appointment_type.appointment_type_name, speciality.speciality_id, speciality.speciality_name]

