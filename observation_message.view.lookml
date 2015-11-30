- view: observation_message
  fields:

  - dimension: observation_message_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_message_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: linked_by_id
    type: int
    sql: ${TABLE}.linked_by_id

  - dimension_group: linked
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.linked_date

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: observation_order_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_order_id

  - dimension: patient_forename
    sql: ${TABLE}.patient_forename

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: patient_surname
    sql: ${TABLE}.patient_surname

  - dimension: patient_title
    sql: ${TABLE}.patient_title

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received

  - dimension: review_notes
    sql: ${TABLE}.review_notes

  - dimension: reviewed_by_id
    type: int
    sql: ${TABLE}.reviewed_by_id

  - dimension_group: reviewed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reviewed_date

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - observation_message_id
    - patient_forename
    - patient_surname
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - observation_order.observation_order_id
    - observation_set.count
    - task.count

