- view: individual_speciality
  fields:

  - dimension: individual_speciality_id
    primary_key: true
    type: int
    sql: ${TABLE}.individual_speciality_id

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

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
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - individual_speciality_id
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - speciality.speciality_id
    - speciality.speciality_name

