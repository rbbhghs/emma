- view: professional_registration
  fields:

  - dimension: professional_registration_id
    primary_key: true
    type: int
    sql: ${TABLE}.professional_registration_id

  - dimension_group: checked
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.checked_date

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension: last_modified
    type: int
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    type: int
    sql: ${TABLE}.last_modified_by

  - dimension: licensed_to_practice
    type: yesno
    sql: ${TABLE}.licensed_to_practice

  - dimension: professional_body
    sql: ${TABLE}.professional_body

  - dimension_group: registration
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.registration_date

  - dimension: registration_number
    sql: ${TABLE}.registration_number

  - measure: count
    type: count
    drill_fields: [professional_registration_id, individual.individual_id, individual.forename, individual.middlename, individual.surname]

