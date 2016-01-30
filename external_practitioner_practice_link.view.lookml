- view: external_practitioner_practice_link
  fields:

  - dimension: external_practitioner_practice_link_id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.external_practitioner_practice_link_id

  - dimension: external_practice_id
    type: int
    hidden: true
    sql: ${TABLE}.external_practice_id

  - dimension: individual_id
    type: int
    hidden: true
    sql: ${TABLE}.individual_id

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: status
    hidden: true
    sql: ${TABLE}.status

  - measure: count
    type: count
    hidden: true
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - external_practitioner_practice_link_id
    - external_practice.external_practice_id
    - external_practice.practice_name
    - individual.surname
    - individual.middlename
    - individual.forename
    - individual.individual_id

