- view: appointment_review
  fields:

  - dimension: appointment_review_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_review_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension_group: review_before
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.review_before

  - dimension: review_by_id
    type: int
    sql: ${TABLE}.review_by_id

  - dimension: review_notes
    sql: ${TABLE}.review_notes

  - dimension: review_speciality_id
    type: int
    sql: ${TABLE}.review_speciality_id

  - dimension_group: review_started
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.review_started

  - dimension: review_started_by_id
    type: int
    sql: ${TABLE}.review_started_by_id

  - dimension_group: reviewed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reviewed

  - dimension: reviewed_by_id
    type: int
    sql: ${TABLE}.reviewed_by_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [appointment_review_id, appointment.appointment_id, clinical_report.count, task.count]

