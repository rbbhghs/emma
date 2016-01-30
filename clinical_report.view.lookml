- view: clinical_report
  fields:

  - dimension: appointment_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: appointment_review_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_review_id

  - dimension: copy_to_id
    type: int
    hidden: true
    sql: ${TABLE}.copy_to_id

  - dimension_group: first_published
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.first_published_date

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: patient_id
    type: int
    hidden: true
    sql: ${TABLE}.patient_id

  - dimension: report_id
    type: int
    # hidden: true
    primary_key: true
    sql: ${TABLE}.report_id

  - dimension: report_type_version_id
    type: int
    hidden: true
    sql: ${TABLE}.report_type_version_id

  - dimension: review_report
    type: yesno
    sql: ${TABLE}.review_report

  - dimension: report_status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_review.appointment_review_id
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.company_contact_name
    - patient.nickname
    - patient.provided_gp_name
    - patient.source_name
    - appointment.appointment_id
    - report.report_name
    - report.report_id
    - appointment_section_study_clinical_report.count

