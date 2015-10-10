- view: appointment_reviewer
  fields:

  - dimension: access_all_patients
    type: yesno
    sql: ${TABLE}.access_all_patients

  - dimension: arbitration
    type: yesno
    sql: ${TABLE}.arbitration

  - dimension: available_for_review
    type: yesno
    sql: ${TABLE}.available_for_review

  - dimension: clinical_auditing
    type: yesno
    sql: ${TABLE}.clinical_auditing

  - dimension: double_read_case
    type: int
    sql: ${TABLE}.double_read_case

  - dimension_group: ind_insurance_expiry
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ind_insurance_expiry

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

  - dimension_group: last_notification
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_notification_date

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: notification_timing
    type: int
    sql: ${TABLE}.notification_timing

  - dimension: qualifications
    sql: ${TABLE}.qualifications

  - dimension: triage
    type: yesno
    sql: ${TABLE}.triage

  - measure: count
    type: count
    drill_fields: [individual.individual_id, individual.forename, individual.middlename, individual.surname]

