- view: patient_change_log
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: field_name
    sql: ${TABLE}.field_name

  - dimension: field_value
    sql: ${TABLE}.field_value

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    type: int
    sql: ${TABLE}.last_modified_by

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - field_name
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname

