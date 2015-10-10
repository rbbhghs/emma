- view: doctor_speciality
  fields:

  - dimension: doctor_speciality_id
    primary_key: true
    type: int
    sql: ${TABLE}.doctor_speciality_id

  - dimension: doctor_id
    type: int
    sql: ${TABLE}.doctor_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: referral_form_type_id
    type: int
    sql: ${TABLE}.referral_form_type_id

  - dimension: speciality_id
    type: int
    # hidden: true
    sql: ${TABLE}.speciality_id

  - measure: count
    type: count
    drill_fields: [doctor_speciality_id, speciality.speciality_id, speciality.speciality_name]

