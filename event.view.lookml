- view: event
  fields:

  - dimension: event_id
    primary_key: true
    type: int
    sql: ${TABLE}.event_id

  - dimension: company_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension_group: date_reviewed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_reviewed

  - dimension: entity_id
    type: int
    sql: ${TABLE}.entity_id

  - dimension: entity_type_id
    type: int
    sql: ${TABLE}.entity_type_id

  - dimension: event_data
    sql: ${TABLE}.event_data

  - dimension: event_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.event_type_id

  - dimension: external_practitice_id
    type: int
    sql: ${TABLE}.external_practitice_id

  - dimension: external_practitioner_id
    type: int
    # hidden: true
    sql: ${TABLE}.external_practitioner_id

  - dimension_group: follow_up
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.follow_up

  - dimension: from_id
    type: int
    sql: ${TABLE}.from_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: reviewed_by
    type: int
    sql: ${TABLE}.reviewed_by

  - dimension: to_id
    type: int
    sql: ${TABLE}.to_id

  - dimension: user_id
    type: int
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - event_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - event_type.integral_event_type_id
    - company.company_name
    - task.count

